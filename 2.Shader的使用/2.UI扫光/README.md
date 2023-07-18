Shader "LK/UI/Sweep "
{
    Properties
    {
        [PerRendererData] _MainTex("Sprite Texture", 2D) = "white" {}
        _Color("Tint", Color) = (1,1,1,1)

        _StencilComp("Stencil Comparison", Float) = 8
        _Stencil("Stencil ID", Float) = 0
        _StencilOp("Stencil Operation", Float) = 0
        _StencilWriteMask("Stencil Write Mask", Float) = 255
        _StencilReadMask("Stencil Read Mask", Float) = 255

        _ColorMask("Color Mask", Float) = 15

        [Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip("Use Alpha Clip", Float) = 0




        _SweepTime("SweepTime",Float) = 1
        _SweepWidth("SweepWidth",Range(0.02,1)) = 0.2
        _SweepAngle("SweepAngle",Float) = 0
        _SweepColor("SweepColor",Color) = (1,1,1,1)
            _SleepTime("SleepTime",Float) = 1
       _Test("Test",Float) = 1
            
    }

        SubShader
        {
            Tags
            {
                "Queue" = "Transparent"
                "IgnoreProjector" = "True"
                "RenderType" = "Transparent"
                "PreviewType" = "Plane"
                "CanUseSpriteAtlas" = "True"
            }

            Stencil
            {
                Ref[_Stencil]
                Comp[_StencilComp]
                Pass[_StencilOp]
                ReadMask[_StencilReadMask]
                WriteMask[_StencilWriteMask]
            }

            Cull Off
            Lighting Off
            ZWrite Off
            ZTest[unity_GUIZTestMode]
            Blend One OneMinusSrcAlpha
            ColorMask[_ColorMask]

            Pass
            {
                Name "Default"
            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #pragma target 2.0

                #include "UnityCG.cginc"
                #include "UnityUI.cginc"

                #pragma multi_compile_local _ UNITY_UI_CLIP_RECT
                #pragma multi_compile_local _ UNITY_UI_ALPHACLIP

                struct appdata_t
                {
                    float4 vertex   : POSITION;
                    float4 color    : COLOR;
                    float2 texcoord : TEXCOORD0;
                    UNITY_VERTEX_INPUT_INSTANCE_ID
                };

                struct v2f
                {
                    float4 vertex   : SV_POSITION;
                    fixed4 color : COLOR;
                    float2 texcoord  : TEXCOORD0;
                    float4 worldPosition : TEXCOORD1;
                    half4  mask : TEXCOORD2;
                    UNITY_VERTEX_OUTPUT_STEREO
                };

                sampler2D _MainTex;
                fixed4 _Color;
                fixed4 _TextureSampleAdd;
                float4 _ClipRect;
                float4 _MainTex_ST;
                float _UIMaskSoftnessX;
                float _UIMaskSoftnessY;
                fixed _SweepAngle;
                fixed _SweepWidth;
                float4 _SweepColor;
                float _SweepTime;
                float _Test;
                float _SleepTime;

                v2f vert(appdata_t v)
                {
                    v2f OUT;
                    UNITY_SETUP_INSTANCE_ID(v);
                    UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(OUT);
                    float4 vPosition = UnityObjectToClipPos(v.vertex);
                    OUT.worldPosition = v.vertex;
                    OUT.vertex = vPosition;

                    float2 pixelSize = vPosition.w;
                    pixelSize /= float2(1, 1) * abs(mul((float2x2)UNITY_MATRIX_P, _ScreenParams.xy));

                    float4 clampedRect = clamp(_ClipRect, -2e10, 2e10);
                    float2 maskUV = (v.vertex.xy - clampedRect.xy) / (clampedRect.zw - clampedRect.xy);
                    OUT.texcoord = TRANSFORM_TEX(v.texcoord.xy, _MainTex);
                    OUT.mask = half4(v.vertex.xy * 2 - clampedRect.xy - clampedRect.zw, 0.25 / (0.25 * half2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(pixelSize.xy)));

                    OUT.color = v.color * _Color;
                    return OUT;
                }
                float smoothstep(float a, float b, float x)
                {
                    float t = saturate((x - a) / (b - a));
                    return t * t * (3.0 - (2.0 * t));
                }
                fixed4 frag(v2f IN) : SV_Target
                {
                    half4 color = IN.color * (tex2D(_MainTex, IN.texcoord) + _TextureSampleAdd);

                    #ifdef UNITY_UI_CLIP_RECT
                    half2 m = saturate((_ClipRect.zw - _ClipRect.xy - abs(IN.mask.xy)) * IN.mask.zw);
                    color.a *= m.x * m.y;
                    #endif
                    #ifdef UNITY_UI_ALPHACLIP
                    clip(color.a - 0.001);
                    #endif
                    color.rgb *= color.a;

                    fixed progress = _Time.y% (_SweepTime+_SleepTime)/ _SweepTime;
                    fixed radian = 3.1415 / 180;
                    fixed tanx = tan(radian * _SweepAngle);
                    fixed cosx = cos(radian * (90-_SweepAngle));
                    fixed weightx = _SweepWidth / 2 / cosx;
  
                    fixed middlex = IN.texcoord.y / tanx
                        - (1 / tanx + weightx)
                        + progress * (1/tanx+ weightx*2+1);

                    fixed min = middlex - weightx;
                    fixed max = middlex + weightx;
                    fixed valueL = smoothstep(min, middlex, IN.texcoord.x);
                    fixed valueR = smoothstep(max, middlex, IN.texcoord.x);
                    float value = saturate(1- saturate(1-valueL)-saturate(1-valueR ));
                    color += _SweepColor * value*color.a;
                    
                    return color;
                }
            ENDCG
            }
        }
}

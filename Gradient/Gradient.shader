Shader "LK/Gradient"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Texture1("SecondTex1",2D)="White"{}
         _Texture2("SecondTex2",2D)="White"{}
         _min("Min",float)=0
         _max("Max",float)=1
         _hight("Hight",float)=0
         _speed("Speed",float)=20
          _Amplitude("Amplitude",float)=1
    }
    SubShader
    {
         pass
        {
            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag 
                #include "UnityCG.cginc"
                float4 _Color;
                sampler2D _Texture1;
                sampler2D _Texture2;
                float4 _Texture1_ST;
                float4 _Texture2_ST;
                float _min;
                float _max;
                float _hight;
                float _speed;
                float _Amplitude;
                struct appdata
                {
                    float4 vertex:POSITION;
                    float4 color:COLOR;
                    float4 uv : TEXCOORD0;
                  
                };
                struct v2f
                {
                    float4 pos:SV_POSITION;
                    float4 uv : TEXCOORD0;
                   float4 loaclPos : TEXCOORD1;
                };
                float4 vLerp(float4 from,float4 to,float r)
                {
                    return (1-r)*from+r*to;
                }
                float soomthStep(float min,float max,float r)
                {
                    return (max-r)/(r-min)+0.5;
                }
                float SmoothStep(float min,float max,float x)
                {
                    float t=saturate(x-min)/(max-min);
                    return t*t*(3-2*t);
                }
                v2f vert(appdata v)
                {
                    v2f o=(v2f)0;
                    o.pos=UnityObjectToClipPos(v.vertex);
                    o.uv.xy=TRANSFORM_TEX(v.uv,_Texture1);
                     o.uv.zw=TRANSFORM_TEX(v.uv,_Texture2);
                     o.loaclPos=v.vertex;
                    return o;
                }
                float4 frag(v2f i):SV_TARGET
                {
                    float st=(sin(_Time*_speed*3.1415926)+1)/2;
                    float r= 1-SmoothStep(_min,_max,i.loaclPos.y-_hight-st*_Amplitude);
                    float4 orign= tex2D(_Texture1,i.uv.xy);
                    float4 gradient= tex2D(_Texture2,i.uv.zw)*_Color*r*4+_Color*r*2;
                    return orign+gradient;
                }




                ENDCG
        }
    }
    FallBack "Diffuse"
}

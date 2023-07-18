渐变 Gradient

1.效果图

![](https://unity-shader.oss-cn-beijing.aliyuncs.com/Gradient.gif)

2.关键点 平滑阶梯函数

     //如果x在min与max之间返回x,如果x的平滑值,如果小于min返回min,大于max返回max
     float SmoothStep(float min,float max,float x)
     {
      float t=saturate(x-min)/(max-min);
      return t*t*(3-2*t);
     }
     
 3.进阶 程序生成地图的Shader
 
 ![](https://unity-shader.oss-cn-beijing.aliyuncs.com/ProgramGeneratedMapGradient.gif)
 
 
 
     Shader "LK/Gradient"
     {
    Properties
    {
       
        _Texture1("Texture1",2D)="White"{}
        _Hight1("Hight1",float)=0
        _Texture2("Texture2",2D)="White"{}
        _Hight2("Hight2",float)=0
        _Texture3("Texture3",2D)="White"{}
        _Hight3("Hight3",float)=0
        _Texture4("Texture4",2D)="White"{}
        _Hight4("Hight4",float)=0
    }
    SubShader
    {
         pass
        {
            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag 
                #include "UnityCG.cginc"
        
                sampler2D _Texture1;
                sampler2D _Texture2;
                sampler2D _Texture3;
                sampler2D _Texture4;
                float4 _Texture1_ST;
                //float4 _Texture2_ST;
                //float4 _Texture3_ST;
                //float4 _Texture4_ST;
                float _Hight1;
                float _Hight2;
                float _Hight3;
                float _Hight4;
                struct appdata
                {
                    float4 vertex:POSITION;
                    float4 color:COLOR;
                    float4 uv : TEXCOORD0;
                };
                struct v2f
                {
                    float4 pos:SV_POSITION;
                    float2 uv : TEXCOORD0;
            
                    float4 localPos : TEXCOORD2;
                };
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
                    o.localPos=v.vertex;
                    return o;
                }
                float4 frag(v2f i):SV_TARGET
                {
                    
                    float r1= 1-SmoothStep(0,1,i.localPos.y-_Hight1);
                    float r2= 1-SmoothStep(0,1,i.localPos.y-_Hight2);
                    float r3= 1-SmoothStep(0,1,i.localPos.y-_Hight3);
                    float r4= 1-SmoothStep(0,1,i.localPos.y-_Hight4);

                    r1=saturate(r1-r2-r3-r4);
                    r2=saturate(r2-r3-r4);
                    r3=saturate(r3-r4);
               

                    float4 o1= tex2D(_Texture1,i.uv.xy);
                    float4 o2= tex2D(_Texture2,i.uv.xy);
                    float4 o3= tex2D(_Texture3,i.uv.xy);
                    float4 o4= tex2D(_Texture4,i.uv.xy);

                    float4 gradient= o1*r1+o2*r2+o3*r3+o4*r4;
                    return gradient;
                }
                ENDCG
        }
    }
    FallBack "Diffuse"
     }

// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33398,y:32912,varname:node_3138,prsc:2|emission-1057-RGB,olwid-1702-OUT,olcol-4030-RGB;n:type:ShaderForge.SFN_LightVector,id:9128,x:31665,y:33196,varname:node_9128,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:8117,x:31665,y:33010,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:5010,x:31843,y:33114,varname:node_5010,prsc:2,dt:0|A-8117-OUT,B-9128-OUT;n:type:ShaderForge.SFN_Multiply,id:7078,x:32158,y:33007,varname:node_7078,prsc:2|A-5010-OUT,B-8494-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8494,x:31924,y:33357,ptovrint:False,ptlb:node_8494,ptin:_node_8494,varname:node_8494,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Add,id:9981,x:32363,y:33180,varname:node_9981,prsc:2|A-7078-OUT,B-8494-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1702,x:33137,y:33344,ptovrint:False,ptlb:node_1702,ptin:_node_1702,varname:node_1702,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.05;n:type:ShaderForge.SFN_Color,id:4030,x:33137,y:33432,ptovrint:False,ptlb:node_4030,ptin:_node_4030,varname:node_4030,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3962264,c2:0.2430087,c3:0.1140085,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1057,x:32981,y:33185,ptovrint:False,ptlb:node_1057,ptin:_node_1057,varname:node_1057,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c9085d117373b6b40bd5a6cee12c2087,ntxv:3,isnm:False|UVIN-249-OUT;n:type:ShaderForge.SFN_Append,id:249,x:32566,y:33331,varname:node_249,prsc:2|A-9981-OUT,B-9092-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9092,x:32363,y:33388,ptovrint:False,ptlb:node_9092,ptin:_node_9092,varname:node_9092,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_LightColor,id:3392,x:32530,y:33561,varname:node_3392,prsc:2;proporder:8494-1702-4030-1057-9092;pass:END;sub:END;*/

Shader "Shader Forge/NewShader" {
    Properties {
        _node_8494 ("node_8494", Float ) = 0.5
        _node_1702 ("node_1702", Float ) = 0.05
        _node_4030 ("node_4030", Color) = (0.3962264,0.2430087,0.1140085,1)
        _node_1057 ("node_1057", 2D) = "bump" {}
        _node_9092 ("node_9092", Float ) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _node_1702)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_4030)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                float _node_1702_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_1702 );
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*_node_1702_var,1) );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float4 _node_4030_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_4030 );
                return fixed4(_node_4030_var.rgb,0);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _node_1057; uniform float4 _node_1057_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _node_8494)
                UNITY_DEFINE_INSTANCED_PROP( float, _node_9092)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float _node_8494_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_8494 );
                float _node_9092_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_9092 );
                float2 node_249 = float2(((dot(i.normalDir,lightDirection)*_node_8494_var)+_node_8494_var),_node_9092_var);
                float4 _node_1057_var = tex2D(_node_1057,TRANSFORM_TEX(node_249, _node_1057));
                float3 emissive = _node_1057_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _node_1057; uniform float4 _node_1057_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _node_8494)
                UNITY_DEFINE_INSTANCED_PROP( float, _node_9092)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

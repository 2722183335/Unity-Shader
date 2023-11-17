// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:100,x:32948,y:32715,varname:node_100,prsc:2|emission-9060-OUT;n:type:ShaderForge.SFN_LightVector,id:8243,x:31399,y:32819,varname:node_8243,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:5154,x:31399,y:32949,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:6696,x:31677,y:32882,varname:node_6696,prsc:2,dt:0|A-8243-OUT,B-5154-OUT;n:type:ShaderForge.SFN_Multiply,id:213,x:31895,y:32904,varname:node_213,prsc:2|A-6696-OUT,B-2156-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2156,x:31737,y:33096,ptovrint:False,ptlb:0.5,ptin:_05,varname:node_2156,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Add,id:5994,x:32097,y:32984,varname:node_5994,prsc:2|A-213-OUT,B-2156-OUT;n:type:ShaderForge.SFN_Add,id:6525,x:31610,y:33331,varname:node_6525,prsc:2|A-8243-OUT,B-8007-XYZ;n:type:ShaderForge.SFN_Vector4Property,id:8007,x:31362,y:33355,ptovrint:False,ptlb:光点偏移坐标1,ptin:_1,varname:node_8007,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Dot,id:3067,x:31834,y:33266,varname:node_3067,prsc:2,dt:0|A-5154-OUT,B-6525-OUT;n:type:ShaderForge.SFN_Step,id:9565,x:32143,y:33317,varname:node_9565,prsc:2|A-5673-OUT,B-3067-OUT;n:type:ShaderForge.SFN_Tex2d,id:9436,x:32417,y:32831,ptovrint:False,ptlb:node_9436,ptin:_node_9436,varname:node_9436,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9f58f8c01e9b49243ac7fdcba8374651,ntxv:0,isnm:False|UVIN-9933-OUT;n:type:ShaderForge.SFN_Append,id:9933,x:32144,y:32703,varname:node_9933,prsc:2|A-5994-OUT,B-5533-OUT;n:type:ShaderForge.SFN_Vector4Property,id:6832,x:31362,y:33527,ptovrint:False,ptlb:光点便宜坐标2,ptin:_2,varname:node_6832,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Add,id:7292,x:31610,y:33489,varname:node_7292,prsc:2|A-8243-OUT,B-6832-XYZ;n:type:ShaderForge.SFN_Dot,id:934,x:31816,y:33489,varname:node_934,prsc:2,dt:0|A-5154-OUT,B-7292-OUT;n:type:ShaderForge.SFN_Step,id:9060,x:32143,y:33501,varname:node_9060,prsc:2|A-416-OUT,B-934-OUT;n:type:ShaderForge.SFN_ValueProperty,id:416,x:31966,y:33421,ptovrint:False,ptlb:光点大小B,ptin:_B,varname:node_416,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.98;n:type:ShaderForge.SFN_Max,id:6854,x:32373,y:33368,varname:node_6854,prsc:2|A-9565-OUT,B-9060-OUT;n:type:ShaderForge.SFN_Lerp,id:513,x:32586,y:33126,varname:node_513,prsc:2|A-9436-RGB,B-6854-OUT,T-6426-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6426,x:32386,y:33176,ptovrint:False,ptlb:光点平滑值,ptin:_,varname:node_6426,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Fresnel,id:237,x:32424,y:33617,varname:node_237,prsc:2|EXP-3587-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3587,x:32268,y:33729,ptovrint:False,ptlb:node_3587,ptin:_node_3587,varname:node_3587,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Color,id:1792,x:32510,y:33423,ptovrint:False,ptlb:node_1792,ptin:_node_1792,varname:node_1792,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8820755,c2:1,c3:0.9086698,c4:1;n:type:ShaderForge.SFN_Multiply,id:8560,x:32705,y:33499,varname:node_8560,prsc:2|A-1792-RGB,B-237-OUT;n:type:ShaderForge.SFN_Blend,id:2464,x:32853,y:33268,varname:node_2464,prsc:2,blmd:6,clmp:True|SRC-513-OUT,DST-8560-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5533,x:31904,y:32695,ptovrint:False,ptlb:垂直采样,ptin:_,varname:node_5533,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_ValueProperty,id:5673,x:31996,y:33181,ptovrint:False,ptlb:node_5673,ptin:_node_5673,varname:node_5673,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:2156-8007-9436-6832-416-3587-1792-6426;pass:END;sub:END;*/

Shader "Custom/NewSurfaceShader" {
    Properties {
        _05 ("0.5", Float ) = 0.5
        _1 ("光点偏移坐标1", Vector) = (0,0,0,0)
        _node_9436 ("node_9436", 2D) = "white" {}
        _2 ("光点便宜坐标2", Vector) = (0,0,0,0)
        _B ("光点大小B", Float ) = 0.98
        _node_3587 ("node_3587", Float ) = 1
        _node_1792 ("node_1792", Color) = (0.8820755,1,0.9086698,1)
        _ ("光点平滑值", Float ) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
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
            #pragma multi_compile_fog
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _2)
                UNITY_DEFINE_INSTANCED_PROP( float, _B)
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
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
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
                float _B_var = UNITY_ACCESS_INSTANCED_PROP( Props, _B );
                float4 _2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _2 );
                float node_9060 = step(_B_var,dot(i.normalDir,(lightDirection+_2_var.rgb)));
                float3 emissive = float3(node_9060,node_9060,node_9060);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
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
            #pragma multi_compile_fog
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _2)
                UNITY_DEFINE_INSTANCED_PROP( float, _B)
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
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
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
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

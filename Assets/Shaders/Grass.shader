Shader "Unlit/Grass"
{
    Properties
    {
        _BottomColor ("Bottom Color", Color) = (1,1,1)
        _MiddleColor ("Middle Color", Color) = (1,1,1)
        _TopColor ("Top Color", Color) = (1,1,1)

    }
    SubShader
    {
        Tags 
        { 
            "RenderType"="Transparent"
            "Queue" = "Transparent"
        }
        LOD 100

        Cull Off
        ZWrite On

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer

            #pragma target 4.5

            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "AutoLight.cginc"

            struct vertexData
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
                float4 worldPos : TEXCOORD1;
                float4 chunkNumber : TEXCOORD2;
                float noiseValue : TEXCOORD3;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (vertexData v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float4 color = float4(i.uv.r, i.uv.g, 0, 1);
                return color;
            }
            ENDCG
        }
    }
}

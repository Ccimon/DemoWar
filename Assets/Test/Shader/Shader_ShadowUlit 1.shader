Shader "ShaderLib/Shader_Addtive"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }

    SubShader
	{

		Tags{ "RenderType" = "Transparent" "Queue" = "Transparent" }

		Blend SrcAlpha DstAlpha
		Pass
		{

			Tags{ "LightMode" = "ForwardBase" }
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdbase

			#include "UnityCG.cginc"
			#include "AutoLight.cginc" 

			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
                float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
				float4 color : COLOR;
                float2 uv : TEXCOORD0;
			};

			fixed4 _ShadowColor;
            fixed4 _MainTex_ST;
			fixed _Alpha;
            sampler2D _MainTex;
            
			v2f vert(appdata v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.color = v.color;
				return o;
			}


			fixed4 frag(v2f i) : SV_Target
			{
                float4 color = tex2D(_MainTex, i.uv);
				color.rgba *= i.color.rgba;
				return color;
			}
			ENDCG
		}

	}
    FallBack "Diffuse"
}

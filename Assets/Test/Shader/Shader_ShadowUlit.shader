Shader "ShaderLib/Shader_ShadowUlit"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
		_ShadowColor("Shadow Color", Color) = (0.1, 0.1, 0.1, 0.53)
		_Alpha("TextureAlpha", Range(0,1)) = 1
    }

    SubShader
	{

		Tags{ "RenderType" = "Transparent" "Queue" = "Geometry+1" }

		Blend SrcAlpha OneMinusSrcAlpha
		ZWrite Off
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
                float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
				SHADOW_COORDS(2)
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
				TRANSFER_SHADOW(o);
				return o;
			}


			fixed4 frag(v2f i) : SV_Target
			{
				fixed atten = SHADOW_ATTENUATION(i);
                float4 color = float4(_ShadowColor.rgb,saturate(1 - atten) * _ShadowColor.a);
				return color;
			}
			ENDCG
		}

	}
    FallBack "Diffuse"
}

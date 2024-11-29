// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Traffic/FixPolish"
{
	Properties
	{
		[Enum(AlphaBlend,10,Additive,1)]_Dst("材质模式", Float) = 10
		_Main_Tex("Main_Tex", 2D) = "white" {}
		_Light_Tex("Light_Tex", 2D) = "white" {}
		[Toggle(_CHANGE_RGB_A_ON)] _Change_RGB_A("Change_RGB_A", Float) = 0
		_Light_Col("Light_Col", Color) = (1,1,1,1)
		_Light_Int("Light_Int", Float) = 1
		_Light_rotator("Light_rotator", Range( 0 , 1)) = 0
		[Toggle(_LIGHT_TIME_ON)] _Light_Time("Light_Time", Float) = 0
		_Light_Speed("Light_Speed", Vector) = (0,0,0,0)
		_Light_Width("Light_Width", Float) = 0.46
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull Back
		ZWrite Off
		Blend SrcAlpha [_Dst]
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma shader_feature_local _CHANGE_RGB_A_ON
		#pragma shader_feature_local _LIGHT_TIME_ON
		#pragma surface surf Unlit keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _Dst;
		uniform float _Light_Width;
		uniform sampler2D _Light_Tex;
		uniform float2 _Light_Speed;
		uniform float4 _Light_Tex_ST;
		uniform float _Light_rotator;
		uniform float _Light_Int;
		uniform float4 _Light_Col;
		uniform sampler2D _Main_Tex;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 temp_cast_0 = (_Light_Width).xxxx;
			float2 temp_cast_1 = (0.0).xx;
			#ifdef _LIGHT_TIME_ON
				float2 staticSwitch56 = _Light_Speed;
			#else
				float2 staticSwitch56 = temp_cast_1;
			#endif
			float2 uv_Light_Tex = i.uv_texcoord * _Light_Tex_ST.xy + _Light_Tex_ST.zw;
			float cos40 = cos( ( _Light_rotator * UNITY_PI ) );
			float sin40 = sin( ( _Light_rotator * UNITY_PI ) );
			float2 rotator40 = mul( uv_Light_Tex - float2( 0.5,0.5 ) , float2x2( cos40 , -sin40 , sin40 , cos40 )) + float2( 0.5,0.5 );
			float2 panner25 = ( 1.0 * _Time.y  * staticSwitch56 + rotator40);
			float4 tex2DNode24 = tex2D( _Light_Tex, panner25 );
			float4 temp_cast_2 = (tex2DNode24.a).xxxx;
			#ifdef _CHANGE_RGB_A_ON
				float4 staticSwitch66 = temp_cast_2;
			#else
				float4 staticSwitch66 = tex2DNode24;
			#endif
			float4 tex2DNode4 = tex2D( _Main_Tex, i.uv_texcoord );
			float4 smoothstepResult60 = tex2DNode24.a * tex2DNode4.rgba;
			o.Emission = ( ( ( ( smoothstepResult60 * _Light_Int * _Light_Col ) * ( tex2DNode24.a + tex2DNode4.a ) ) * tex2DNode4 ) + tex2DNode4 ).rgb;
			o.Alpha = tex2DNode4.a;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
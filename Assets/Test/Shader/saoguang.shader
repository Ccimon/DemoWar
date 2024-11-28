// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Traffic/Saoguang"
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
		_Light_Wait_Time("LightWaitTime",Float) = 3
		_Light_Polish_Time("LightPolishTime",Float) = 4
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
		uniform float _Light_Wait_Time;
		uniform float _Light_Polish_Time;
		uniform float4 _Light_Col;
		uniform sampler2D _Main_Tex;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		inline float PolishOffsetTime(float time)
		{
			float offset = time % (_Light_Wait_Time + _Light_Polish_Time);
			return 1 - step(offset,_Light_Wait_Time);
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
			float offsetTime = PolishOffsetTime(_Time.y);
			float2 panner25 = ( _Time.y * staticSwitch56 + rotator40);
			float4 tex2DNode24 = tex2D( _Light_Tex, panner25 ) * offsetTime;
			float4 temp_cast_2 = (tex2DNode24.a).xxxx;
			#ifdef _CHANGE_RGB_A_ON
				float4 staticSwitch66 = temp_cast_2;
			#else
				float4 staticSwitch66 = tex2DNode24;
			#endif
			float4 smoothstepResult60 = smoothstep( temp_cast_0 , float4( 1,1,1,1 ) , staticSwitch66);
			float4 tex2DNode4 = tex2D( _Main_Tex, i.uv_texcoord );
			o.Emission = ( ( ( ( smoothstepResult60 * _Light_Int * _Light_Col ) * ( tex2DNode24.a + tex2DNode4.a ) ) * tex2DNode4 ) + tex2DNode4 ).rgb;
			o.Alpha = tex2DNode4.a;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19100
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;2;776.1564,100.5835;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;00VFX/SAOGUANG;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Back;2;False;;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;False;0;True;Transparent;;Transparent;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;2;5;False;;10;True;_Dst;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;2;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.SamplerNode;4;-912.7289,40.10498;Inherit;True;Property;_Main_Tex;Main_Tex;1;0;Create;True;0;0;0;False;0;False;-1;d80e04237114cfb4d94bd47a58d54717;69cac947ac2ac4044a18f1206daafd8a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;46;-1187.639,49.87397;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3;819.3741,-75.24436;Inherit;False;Property;_Dst;材质模式;0;1;[Enum];Create;False;0;2;AlphaBlend;10;Additive;1;0;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-105.9229,-567.6609;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;64;-1667.68,-946.7635;Inherit;False;0;24;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.17,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PiNode;41;-1594.997,-789.4574;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;42;-1898.194,-795.2042;Inherit;False;Property;_Light_rotator;Light_rotator;7;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;25;-1144.451,-750.5254;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;56;-1433.885,-692.0146;Inherit;False;Property;_Light_Time;Light_Time;8;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;48;-1641.62,-601.6074;Inherit;False;Property;_Light_Speed;Light_Speed;9;0;Create;True;0;0;0;False;0;False;0,0;1,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;57;-1631.462,-692.6454;Inherit;False;Constant;_Float0;Float 0;10;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;65;-100.9247,-283.6497;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;73;-1622.736,-1392.522;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;74;-1388.236,-1359.281;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;69;-1597.557,-1265.427;Inherit;False;Constant;_Float3;Float 3;11;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;76;-1503.361,-1170.172;Inherit;False;Constant;_Float1;Float 1;11;0;Create;True;0;0;0;False;0;False;-0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;60;-377.8424,-723.2858;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.RotatorNode;40;-1367.704,-923.5403;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;24;-938.8317,-792.0679;Inherit;True;Property;_Light_Tex;Light_Tex;3;0;Create;True;0;0;0;False;0;False;-1;b850fe673da587242830d3d82ae5639d;53bc32d92caaac040a004afcdcb7a6e2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.AbsOpNode;78;-1114.881,-1326.847;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;75;-1251.439,-1352.444;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;79;-986.7083,-1304.874;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;87;-774.9259,-1283.776;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;85;-1099.933,-1213.792;Inherit;False;True;False;True;True;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-724.7526,-508.3434;Inherit;False;Property;_Light_Width;Light_Width;10;0;Create;True;0;0;0;False;0;False;0.46;0.09;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;66;-625.1538,-760.4166;Inherit;False;Property;_Change_RGB_A;Change_RGB_A;4;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-372.3343,-462.9376;Inherit;False;Property;_Light_Int;Light_Int;6;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;29;523.6303,-23.00088;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;320.3867,-196.3136;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;119.6068,-389.4245;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;7;-467.8109,-371.1723;Inherit;False;Property;_Light_Col;Light_Col;5;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
WireConnection;2;2;29;0
WireConnection;2;9;4;4
WireConnection;4;1;46;0
WireConnection;33;0;60;0
WireConnection;33;1;34;0
WireConnection;33;2;7;0
WireConnection;41;0;42;0
WireConnection;25;0;40;0
WireConnection;25;2;56;0
WireConnection;56;1;57;0
WireConnection;56;0;48;0
WireConnection;65;0;24;4
WireConnection;65;1;4;4
WireConnection;74;0;73;1
WireConnection;74;1;69;0
WireConnection;60;0;66;0
WireConnection;60;1;61;0
WireConnection;40;0;64;0
WireConnection;40;2;41;0
WireConnection;24;1;25;0
WireConnection;78;0;75;0
WireConnection;75;0;74;0
WireConnection;75;1;76;0
WireConnection;79;0;78;0
WireConnection;87;0;79;0
WireConnection;87;1;85;0
WireConnection;66;1;24;0
WireConnection;66;0;24;4
WireConnection;29;0;47;0
WireConnection;29;1;4;0
WireConnection;47;0;28;0
WireConnection;47;1;4;0
WireConnection;28;0;33;0
WireConnection;28;1;65;0
ASEEND*/
//CHKSM=2B912CD5B22216D8377CC87A83E554EEC302437E
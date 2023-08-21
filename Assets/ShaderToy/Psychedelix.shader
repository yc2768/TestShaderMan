
Shader "ShaderMan/Psychedelix "
	{

	Properties{
	//Properties
	}

	SubShader
	{
	Tags { "RenderType" = "Transparent" "Queue" = "Transparent" }

	Pass
	{
	ZWrite Off
	Blend SrcAlpha OneMinusSrcAlpha

	CGPROGRAM
	#pragma vertex vert
	#pragma fragment frag
	#include "UnityCG.cginc"

	struct VertexInput {
    fixed4 vertex : POSITION;
	fixed2 uv:TEXCOORD0;
    fixed4 tangent : TANGENT;
    fixed3 normal : NORMAL;
	//VertexInput
	};


	struct VertexOutput {
	fixed4 pos : SV_POSITION;
	fixed2 uv:TEXCOORD0;
	//VertexOutput
	};

	//Variables

	



	VertexOutput vert (VertexInput v)
	{
	VertexOutput o;
	o.pos = UnityObjectToClipPos (v.vertex);
	o.uv = v.uv;
	//VertexFactory
	return o;
	}
	fixed4 frag(VertexOutput i) : SV_Target
	{
	
	fixed2 uv = i.uv / 1;
	fixed2 pos = (uv.xy-0.5);
	fixed2 cir = ((pos.xy*pos.xy+sin(uv.x*18.0+_Time.y)/25.0*sin(uv.y*7.0+_Time.y*1.5)/1.0)+uv.x*sin(_Time.y)/16.0+uv.y*sin(_Time.y*1.2)/16.0);
	fixed circles = (sqrt(abs(cir.x+cir.y*0.5)*25.0)*5.0);
	return fixed4(sin(circles * 1.25 + 2.0), abs(sin(circles * 1.0 - 1.0) - sin(circles)), abs(sin(circles) * 1.0), 1.0);

	}
	ENDCG
	}
  }
}


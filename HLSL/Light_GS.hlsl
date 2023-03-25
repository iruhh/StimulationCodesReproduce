#include "Light.hlsli"

[maxvertexcount(9)]
void GS(triangle VertexOut input[3], inout TriangleStream<VertexOut> output)
{
	float mirrorPosX = 60.0f;// ��X=mirrorPosX��Ϊ���ģ�����������һ������
	float doubleMirrorPosX = 2 * mirrorPosX;

	int i;
	//original
	for (i = 0; i < 3; i++) {
		output.Append(input[i]);
	}
	output.RestartStrip();

	//clone
	for (i = 2; i >= 0; i--) {// ��������������������㣬��֤����ǰ����Ƶ������ζ���˳��һ�£������ַ��ʻ�ǰ���ѹ��ϵ�ʹ������
		VertexOut vOut;

		//PosW
		vOut.PosW = input[i].PosW;
		vOut.PosW.x = doubleMirrorPosX - input[i].PosW.x;

		//PosH
		matrix viewProj = mul(g_View, g_Proj);
		vOut.PosH = mul(float4(vOut.PosW, 1.0f), viewProj);

		//NormalW
		vOut.NormalW = input[i].NormalW;
		vOut.NormalW.x = -vOut.NormalW.x;

		//Color
		vOut.Color = float4(0.5f, 0.5f, 0.5f, 1.0f);// Ϊ���ɵ�ɭ�־����޸���ɫ

		output.Append(vOut);
	}
}
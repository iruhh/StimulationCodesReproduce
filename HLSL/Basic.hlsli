//modified: ����ӵ����ڴ��������shader
#include "LightHelper.hlsli"

Texture2D g_Tex : register(t0);
SamplerState g_SamLinear : register(s0);


cbuffer VSConstantBuffer : register(b0)
{
    matrix g_World; 
    matrix g_View;  
    matrix g_Proj;  
    matrix g_WorldInvTranspose;
}

//cbuffer PSConstantBuffer : register(b1)
//{
//    DirectionalLight g_DirLight[10];
//    PointLight g_PointLight[10];
//    SpotLight g_SpotLight[10];
//    Material g_Material;
//	int g_NumDirLight;
//	int g_NumPointLight;
//	int g_NumSpotLight;
//    float g_Pad1;

//    float3 g_EyePosW;
//    float g_Pad2;
//}

cbuffer PSConstantBuffer : register(b1)
{
    DirectionalLight g_DirLight;
    PointLight g_PointLight0;
    PointLight g_PointLight1; //���üǵ��Ͽ��ᵽ��"C++��hlsl����Ľṹ��ö�Ӧ����,��Ϊ����Ĵ��ݲ�������"
    PointLight g_PointLight2;
    SpotLight g_SpotLight;
    Material g_Material;
    float3 g_EyePosW;
    float g_Pad;
}


struct VertexPosNormalTex
{
	float3 PosL : POSITION;
    float3 NormalL : NORMAL;
	float2 Tex : TEXCOORD;
};

struct VertexPosTex
{
    float3 PosL : POSITION;
    float2 Tex : TEXCOORD;
};

struct VertexPosHWNormalTex
{
	float4 PosH : SV_POSITION;
    float3 PosW : POSITION;     // �������е�λ��
    float3 NormalW : NORMAL;    // �������������еķ���
	float2 Tex : TEXCOORD;
};

struct VertexPosHTex
{
    float4 PosH : SV_POSITION;
    float2 Tex : TEXCOORD;
};











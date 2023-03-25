#include "LightHelper.hlsli"

cbuffer VSConstantBuffer : register(b0)
{
    matrix g_World; 
    matrix g_View;  
    matrix g_Proj;  
    matrix g_WorldInvTranspose;
}

cbuffer PSConstantBuffer : register(b1)
{
    DirectionalLight g_DirLight;
    PointLight g_PointLight0;
    PointLight g_PointLight1;//���üǵ��Ͽ��ᵽ��"C++��hlsl����Ľṹ��ö�Ӧ����,��Ϊ����Ĵ��ݲ�������"
    PointLight g_PointLight2;
    SpotLight g_SpotLight;
    Material g_Material;
    //float3 g_SphereCenter;
    //float g_SphereRadius;
    float3 g_EyePosW;
    float g_Pad;
}



struct VertexIn
{
	float3 PosL : POSITION;
    float3 NormalL : NORMAL;//���KeyAndBoard��ӵģ������������ĸԭ��û��д�����ڴ�д�ˡ�
	float4 Color : COLOR;
};

struct VertexOut
{
	float4 PosH : SV_POSITION;
    float3 PosW : POSITION; //�������е�λ��//���KeyAndBoard��ӵ�
    float3 NormalW : NORMAL; //�������������еķ���//���KeyAndBoard��ӵ�
	float4 Color : COLOR;
};



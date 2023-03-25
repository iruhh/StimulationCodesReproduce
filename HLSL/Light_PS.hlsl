#include "Light.hlsli"

// ������ɫ��
float4 PS(VertexOut pIn) : SV_Target
{
    // ��׼��������
    pIn.NormalW = normalize(pIn.NormalW);

    // ����ָ���۾�������
    float3 toEyeW = normalize(g_EyePosW - pIn.PosW);

    // ��ʼ��Ϊ0 
    float4 ambient, diffuse, spec;
    float4 A, D, S;
    ambient = diffuse = spec = A = D = S = float4(0.0f, 0.0f, 0.0f, 0.0f);

    ComputeDirectionalLight(g_Material, g_DirLight, pIn.NormalW, toEyeW, A, D, S);
    ambient += A;
    diffuse += D;
    spec += S;

    ComputePointLight(g_Material, g_PointLight0, pIn.PosW, pIn.NormalW, toEyeW, A, D, S);
    ambient += A;
    diffuse += D;
    spec += S;
    
    ComputePointLight(g_Material, g_PointLight1, pIn.PosW, pIn.NormalW, toEyeW, A, D, S);
    ambient += A;
    diffuse += D;
    spec += S;
    
    ComputePointLight(g_Material, g_PointLight2, pIn.PosW, pIn.NormalW, toEyeW, A, D, S);
    ambient += A;
    diffuse += D;
    spec += S;

    ComputeSpotLight(g_Material, g_SpotLight, pIn.PosW, pIn.NormalW, toEyeW, A, D, S);
    ambient += A;
    diffuse += D;
    spec += S;

    float4 litColor = pIn.Color * (ambient + diffuse) + spec; //���KeyAndBoard����pIn.Color����Щ����������
	
    litColor.a = g_Material.Diffuse.a * pIn.Color.a;
	
    //float4 litColor = { 0.7f, 0.7f, 1.0f, 1.0f };
    //float4 litColor = pIn.Color;
    return litColor;
}
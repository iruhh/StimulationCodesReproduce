#pragma once

#include "GameApp.h"
#include "Vertex.h"

class StimulatingVertices
{
public:
	StimulatingVertices(D3D11_PRIMITIVE_TOPOLOGY type);
	~StimulatingVertices();

	// ��ȡ����
	VertexPosNormalColor* GetStimulatingVertices();
	// ��ȡ����
	WORD* GetStimulatingIndices();
	// ��ȡ����ͼԪ����
	D3D11_PRIMITIVE_TOPOLOGY GetTopology();
	// ��ȡ������� 
	UINT GetVerticesCount();
	// ��ȡ��������
	UINT GetIndexCount();
    UINT GetSubSteps();

	
	void step();
	void update_stimulatingvertices_POS();

private:
	VertexPosNormalColor* stimulatingVertices; // ����
	WORD* stimulatingIndices; // ����
	D3D11_PRIMITIVE_TOPOLOGY topology;// ͼԪ���� 
	UINT verticesCount; // �������
	UINT indexCount; // ��������

	UINT substeps;
    double pos[128][128][3];
	double v[128][128][3];

	double length(double deltaPos[], int n);
	double dot(double a[], double b[], int n);
	void initialize_mass_points();
	void initialize_spring_offsets();
	void initialize_mesh_indices();
	void substep();
};

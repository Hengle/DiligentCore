
Texture2D g_tex2D_Dyn;
Texture2D g_tex2DArr_Dyn[8];
Texture2D g_tex2D_Static;
Texture2D g_tex2DArr_Static[2];
Texture2D g_tex2D_Mut;
Texture2D g_tex2DArr_Mut[3];

Texture2D g_sepTex2D_static;
Texture2D g_sepTex2DArr_static[2];
Texture2D g_sepTex2D_mut;
Texture2D g_sepTex2DArr_mut[3];
Texture2D g_sepTex2D_dyn;
Texture2D g_sepTex2DArr_dyn[4];

SamplerState g_Sam_static;
SamplerState g_SamArr_static[2];
SamplerState g_Sam_mut;
SamplerState g_SamArr_mut[3];
SamplerState g_SamArr_dyn[4];
SamplerState g_Sam_dyn;

Buffer g_UniformTexelBuff;
RWBuffer<float4> g_StorageTexelBuff;
Buffer g_UniformTexelBuff_mut;
RWBuffer<float4> g_StorageTexelBuff_mut;


cbuffer UniformBuff_Dyn
{
    float2 g_UV_Dyn;
}

cbuffer UniformBuff_Stat
{
    float2 g_UV_Stat;
}

cbuffer UniformBuff_Mut
{
    float2 g_UV_Mut;
}

struct CBData
{
    float2 UV;
};

ConstantBuffer<CBData> UniformBuffArr_Dyn[4];
ConstantBuffer<CBData> UniformBuffArr_Stat[2];
ConstantBuffer<CBData> UniformBuffArr_Mut[3];

struct RWBufferData
{
    float4 Data;
};
RWBuffer<float4> storageBuff_Dyn;
RWBuffer<float4> storageBuffArr_Dyn[4];
RWBuffer<float4> storageBuff_Static;
RWBuffer<float4> storageBuffArr_Static[2];
RWBuffer<float4> storageBuff_Mut;
RWBuffer<float4> storageBuffArr_Mut[3];

RWTexture2D<float4> g_tex2DStorageImg_Stat;
RWTexture2D<float4> g_tex2DStorageImgArr_Mut[2];
RWTexture2D<float4> g_tex2DStorageImgArr_Dyn[2];

void main(out float4 f4Color : COLOR,
          out float4 f4Position : SV_Position)
{
	f4Color = float4(0.0, 0.0, 0.0, 0.0);
    f4Color += g_tex2D_Dyn.      SampleLevel(g_Sam_static,       g_UV_Dyn.xy, 0.0);
    f4Color += g_tex2DArr_Dyn[0].SampleLevel(g_SamArr_static[0], UniformBuffArr_Dyn[0].UV, 0.0);
    f4Color += g_tex2DArr_Dyn[1].SampleLevel(g_SamArr_static[1], UniformBuffArr_Dyn[1].UV, 0.0);
    f4Color += g_tex2DArr_Dyn[2].SampleLevel(g_SamArr_mut[0],    UniformBuffArr_Dyn[2].UV, 0.0);
    f4Color += g_tex2DArr_Dyn[3].SampleLevel(g_SamArr_mut[1],    UniformBuffArr_Dyn[3].UV, 0.0);
    f4Color += g_tex2DArr_Dyn[4].SampleLevel(g_SamArr_mut[2],    UniformBuffArr_Dyn[0].UV, 0.0);
    f4Color += g_tex2DArr_Dyn[5].SampleLevel(g_SamArr_dyn[1],    UniformBuffArr_Dyn[1].UV, 0.0);
    f4Color += g_tex2DArr_Dyn[6].SampleLevel(g_SamArr_dyn[3],    UniformBuffArr_Dyn[2].UV, 0.0);
    f4Color += g_tex2DArr_Dyn[7].SampleLevel(g_Sam_dyn,          UniformBuffArr_Dyn[3].UV, 0.0);

    f4Color += g_tex2D_Static.      SampleLevel(g_SamArr_dyn[0], g_UV_Stat, 0.0);
    f4Color += g_tex2DArr_Static[0].SampleLevel(g_SamArr_dyn[2], UniformBuffArr_Stat[0].UV, 0.0);
    f4Color += g_tex2DArr_Static[1].SampleLevel(g_Sam_dyn,       UniformBuffArr_Stat[1].UV, 0.0);

    f4Color += g_tex2D_Mut.      SampleLevel(g_SamArr_static[0], g_UV_Mut, 0.0);
    f4Color += g_tex2DArr_Mut[0].SampleLevel(g_SamArr_mut[0], UniformBuffArr_Mut[0].UV, 0.0);
    f4Color += g_tex2DArr_Mut[1].SampleLevel(g_SamArr_dyn[3], UniformBuffArr_Mut[1].UV, 0.0);
    f4Color += g_tex2DArr_Mut[2].SampleLevel(g_SamArr_dyn[3], UniformBuffArr_Mut[2].UV, 0.0);

    f4Color += g_sepTex2D_static.SampleLevel(g_Sam_static, float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2DArr_static[0].SampleLevel(g_SamArr_static[0], float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2DArr_static[1].SampleLevel(g_SamArr_static[1], float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2D_mut.SampleLevel(g_Sam_mut, float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2DArr_mut[0].SampleLevel(g_SamArr_mut[0], float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2DArr_mut[1].SampleLevel(g_SamArr_mut[1], float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2DArr_mut[2].SampleLevel(g_SamArr_mut[2], float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2D_dyn.SampleLevel(g_SamArr_dyn[0], float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2D_dyn.SampleLevel(g_SamArr_dyn[1], float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2D_dyn.SampleLevel(g_SamArr_dyn[2], float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2D_dyn.SampleLevel(g_SamArr_dyn[3], float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2DArr_dyn[0].SampleLevel(g_Sam_dyn, float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2DArr_dyn[1].SampleLevel(g_Sam_dyn, float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2DArr_dyn[2].SampleLevel(g_Sam_dyn, float2(0.5, 0.5), 0.0);
    f4Color += g_sepTex2DArr_dyn[3].SampleLevel(g_Sam_dyn, float2(0.5, 0.5), 0.0);

    storageBuff_Dyn[0] = float4(1.0, 2.0, 3.0, 4.0);
    storageBuffArr_Dyn[0][0] = float4(1.0, 2.0, 3.0, 4.0);
    storageBuffArr_Dyn[1][0] = float4(1.0, 2.0, 3.0, 4.0);
    storageBuffArr_Dyn[2][0] = float4(1.0, 2.0, 3.0, 4.0);
    storageBuffArr_Dyn[3][0] = float4(1.0, 2.0, 3.0, 4.0);
    storageBuff_Static[0]  = float4(1.0, 2.0, 3.0, 4.0);
    storageBuffArr_Static[0][0] = float4(1.0, 2.0, 3.0, 4.0);
    storageBuffArr_Static[1][0] = float4(1.0, 2.0, 3.0, 4.0);
    storageBuff_Mut[0] = float4(1.0, 2.0, 3.0, 4.0);
    storageBuffArr_Mut[0][0] = float4(1.0, 2.0, 3.0, 4.0);
    storageBuffArr_Mut[1][0] = float4(1.0, 2.0, 3.0, 4.0);
    storageBuffArr_Mut[2][0] = float4(1.0, 2.0, 3.0, 4.0);

    g_tex2DStorageImg_Stat[int2(0,0)] = float4(1.0, 2.0, 3.0, 4.0);
    g_tex2DStorageImgArr_Mut[0][int2(0, 0)] = float4(1.0, 2.0, 3.0, 4.0);
    g_tex2DStorageImgArr_Mut[1][int2(0, 0)] = float4(1.0, 2.0, 3.0, 4.0);
    g_tex2DStorageImgArr_Dyn[0][int2(0, 0)] = float4(1.0, 2.0, 3.0, 4.0);
    g_tex2DStorageImgArr_Dyn[1][int2(0, 0)] = float4(1.0, 2.0, 3.0, 4.0);

    g_StorageTexelBuff[0] = g_UniformTexelBuff.Load(0);
    g_StorageTexelBuff_mut[0] = g_UniformTexelBuff_mut.Load(0);

	f4Position = float4(0.0, 0.0, 0.0, 1.0);
}

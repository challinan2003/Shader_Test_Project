using System.Collections;
using System.Collections.Generic;
using static System.Runtime.InteropServices.Marshal;
using UnityEngine;

public class Grass : MonoBehaviour
{
    public Mesh mesh;
    public Material material;
    public float grassPatchSize;
    public float grassHeight;
    public ComputeBuffer buffer;

    void Start()
    {
        //Set up grass distance bounds
        Bounds grassDistance;
        grassDistance = new Bounds(Vector3.zero, new Vector3(-grassPatchSize, grassHeight, grassPatchSize));

        buffer = new ComputeBuffer(1, 32, ComputeBufferType.IndirectArguments);

        Graphics.DrawMeshInstancedIndirect(mesh, 0, material, grassDistance, buffer);

        Debug.Log("Grass Spawned");
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SpriteMeshTest : MonoBehaviour
{
    public MeshFilter filter;

    public Material mat;

    private Mesh mesh;
    private Image image;
    // Start is called before the first frame update
    void Start()
    {
        mesh = new Mesh();
        mesh.vertices = filter.mesh.vertices;
        mesh.triangles = filter.mesh.triangles;
        Debug.Log("UseMesh");
        image = GetComponent<Image>();
        image.material = mat;
    }

    // Update is called once per frame
    void LateUpdate()
    {
        image.canvasRenderer.SetMesh(mesh);
    }
}

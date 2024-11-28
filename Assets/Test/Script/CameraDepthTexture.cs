using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraDepthTexture : MonoBehaviour
{
    // Start is called before the first frame update

    public DepthTextureMode CameraDepthTextureMode;
    void Start()
    {
        GetComponent<Camera>().depthTextureMode = CameraDepthTextureMode;
    }

    // Update is called once per frame
    void Update()
    {
    }
}

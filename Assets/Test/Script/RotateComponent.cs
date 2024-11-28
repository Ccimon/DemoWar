using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateComponent : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        var angle = transform.eulerAngles;
        angle.y += 0.1f;
        transform.eulerAngles = angle;
    }
}

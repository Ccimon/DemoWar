using System.Collections;
using System.Collections.Generic;
using MainGame;
using TMPro;
using UnityEngine;
using UnityEngine.UI;


/// <summary>
/// 
/// </summary>
public class MovableMono : MonoBehaviour
{
    public bool MoveEnable = true;

    public Vector3 TargetPosition = Vector3.zero;

    public IAttackable Target = null;

    public float Speed = 20f;

    public TextMeshPro MeshText;

    public Transform ScalerContent;

    public Transform Content;

    public MeshRenderer Render;

}
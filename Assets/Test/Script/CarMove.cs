using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics.Tracing;
using UnityEngine;
using Vector3 = UnityEngine.Vector3;
public class CarMove : MonoBehaviour
{
    public List<Transform> TargetTrasnform = new List<Transform>();
    private List<Vector3> Targets = new List<Vector3>();

    private Vector3 curForward = Vector3.zero;
    private bool CurStepComplete = false;
    private bool ProcessComplete = false;
    private int StepIndex = 0;
    private Vector3 CurTarget = Vector3.zero;
    private float Speed = 60f;
    private float TimeScale = 1f;
    private float FixDeltaTime = 0f;
    void Start()
    {
        foreach (var trans in TargetTrasnform)
        {
            Targets.Add(trans.position);
        }
        PrepareFrame();
    }

    // Update is called once per frame
    void Update()
    {
        if (!ProcessComplete)
        {
            MoveTo(Targets[StepIndex]);
        }
    }

    protected void OnTriggerEnter(Collider other)
    {
        TimeScale = -1f;
    }
    protected void OnTriggerExit(Collider other)
    {
        TimeScale = 1;
    }
    private void PrepareFrame()
    {
        Debug.Log($"StepIndex:{StepIndex}");
        Vector3 target = Targets[StepIndex];
        curForward = (target - transform.position).normalized;
    }

    private void MoveTo(Vector3 target)
    {
        if (CurStepComplete || ProcessComplete) return;
        float deltaTime = Time.deltaTime;
        float needTime = (target - transform.position).magnitude / Math.Abs(Speed * TimeScale);
        Vector3 deltaMove;
        // Debug.Log("Move");
        if (deltaTime > needTime)
        {
            FixDeltaTime = deltaTime - needTime;
            deltaMove = target - transform.position;
            CurStepComplete = true;
        }
        else
        {
            deltaMove = (deltaTime + FixDeltaTime) * curForward * Speed * TimeScale;
        }
        FixDeltaTime = 0;
        Vector3 endPosition = transform.position + deltaMove;
        transform.position = endPosition;

        if (CurStepComplete && !ProcessComplete)
        {
            OnStepComplete();
        }
    }

    private void RotateTo()
    {

    }

    private void OnStepComplete()
    {
        StepIndex += 1;
        if (StepIndex < TargetTrasnform.Count)
        {
            CurStepComplete = false;
            PrepareFrame();
        }
        else
        {
            ProcessComplete = true;
        }
    }
}
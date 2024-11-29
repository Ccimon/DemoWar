using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UnityEngine;

namespace MainGame.Manager
{
    public class InputManager : MonoBehaviour
    {
        private static InputManager _instance;
        public static InputManager Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = GameObject.FindAnyObjectByType<InputManager>();
                }
                return _instance;
            }
        }

        private System.Action _onTouchUp;

        protected void Update()
        {
            if (Input.GetMouseButtonUp(0))
            {
                _onTouchUp?.Invoke();
            }
        }

        public void RegisterTouchUpEvent(System.Action action)
        {
            _onTouchUp += action;
        }

        public void UnRegisterTouchUpEvent(System.Action action)
        {
            _onTouchUp -= action;
        }
    }
}
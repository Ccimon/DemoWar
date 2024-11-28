using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UnityEngine;

namespace MainGame.Manager
{
    /// <summary>
    /// 游戏进入初始化管理器
    /// </summary>
    public class GameEnterManager : MonoBehaviour
    {
        public static GameEnterManager Instance;
        private System.Action<float> _frameCall;

        private void Awake()
        {
            Instance = this;
        }

        private void Start()
        {
            MainInit();
        }

        private void MainInit()
        {
            GameManager.Instance.InitGame();
        }

        #region 时间刷新
        public void RegisterFrameCall(System.Action<float> call)
        {
            _frameCall += call;
        }

        public void UnRegisterFrameCall(System.Action<float> call)
        {
            _frameCall -= call;
        }

        private void Update()
        {
            _frameCall?.Invoke(Time.deltaTime);
        }
        #endregion
    }
}
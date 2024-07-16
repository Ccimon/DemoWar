using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace MainGame.Manager
{
    public class TimeManager : BaseSingleton<TimeManager>, IManager
    {
        protected bool _active;
        public bool Active { get => _active; set => _active = value; }

        private List<ITimerEntity> timerEntities;
        public void CleanData()
        {
            timerEntities?.Clear();
            _active = false;
        }

        public void Init()
        {

        }

        public void InitData()
        {
            timerEntities = new List<ITimerEntity>();
        }

        public void ResetData()
        {
            timerEntities?.Clear();
        }

        public void SetActive(bool active)
        {
        }

        #region 公有方法
        public void UpdateFrame(float time)
        {

        }
        #endregion
    }
}

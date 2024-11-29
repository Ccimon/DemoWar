using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace MainGame.Manager
{
    /// <summary>
    /// 管理时间相关的业务
    /// </summary>
    public class PlayerManager : BaseSingleton<TimeManager>, IManager
    {
        protected bool _active;
        public bool Active { get => _active; set => _active = value; }

        public List<Color> PlayerColors = new List<Color> { Color.red, Color.blue, Color.yellow };

        private List<ITimerEntity> timerEntities;
        public void CleanData()
        {
            timerEntities.Clear();
            _active = false;
        }

        public void Init()
        {
            timerEntities = new List<ITimerEntity>();
        }

        public void InitData()
        {
            timerEntities = new List<ITimerEntity>();
        }

        public void ResetData()
        {
            timerEntities.Clear();
        }

        public void SetActive(bool active)
        {
        }

        #region 公有方法
        public Color GetPlayerColors(int index)
        {
            index = index % PlayerColors.Count;
            return PlayerColors[index];
        }
        #endregion
    }
}

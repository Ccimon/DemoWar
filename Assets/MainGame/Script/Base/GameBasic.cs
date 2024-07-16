using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UnityEngine;

namespace MainGame
{
    #region BaseClass
    public class BaseSingleton<T> where T : class, new()
    {
        private static T _instance = null;
        public static T Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new T();
                }
                return _instance;
            }
        }
    }
    #endregion

    #region BaseInterface
    public interface IManager
    {
        public bool Active { get; set; }

        public void Init();

        public void CleanData();

        public void InitData();

        public void ResetData();

        public void SetActive(bool active);
    }

    public interface ITimerEntity
    {
        protected float Time { get; set; }

        public void SyncTime(float delta);
    }
    #endregion
}
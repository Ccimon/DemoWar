using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UnityEngine;

namespace MainGame
{
    #region BaseClass
    /// <summary>
    /// 基础类的单例，继承可实现单例
    /// </summary>
    /// <typeparam name="T"></typeparam>
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
    /// <summary>
    /// Manager接口，用来方便规范，以及调用
    /// </summary>
    public interface IManager
    {
        public bool Active { get; set; }

        public void Init();

        public void CleanData();

        public void InitData();

        public void ResetData();

        public void SetActive(bool active);
    }
    /// <summary>
    /// 受时间影响的物体，以后会有TimerManager来管理
    /// </summary>
    public interface ITimerEntity
    {
        protected float Time { get; set; }

        public void SyncTime(float delta);
    }

    /// <summary>
    /// 可回收的接口，用来对接对象池
    /// </summary>
    public interface IRecyclable
    {
        public void Recycle();

        public Type GetObjectType();
    }

    /// <summary>
    /// 可受攻击物体的接口
    /// </summary>
    public interface IAttackable
    {
        public void GetAttack(Data.AttackData attackData);

        public Vector3 GetPosition();

        public void Dead();
    }

    /// <summary>
    /// 可受支援物体的接口
    /// </summary>
    public interface IPureable
    {

    }
    #endregion
}
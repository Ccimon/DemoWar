using System.Collections;
using System.Collections.Generic;
using MainGame.Entity;
using MainGame.Event;
using MainGame.Script.Data;
using QFramework;
using UnityEngine;

namespace MainGame.Manager
{
    /// <summary>
    /// 
    /// </summary>
    public class BastionManager : BaseSingleton<BastionManager>, IManager
    {
        #region Manager
        protected bool _active;
        public bool Active { get => _active; set => _active = value; }

        private BastionEntity _curBastion = null;

        private List<BastionEntity> bastionEntities = new List<BastionEntity>();
        public void CleanData()
        {
            CleanEvent();
            foreach (BastionEntity bastion in bastionEntities)
            {
                bastion.Recycle();
            }
            bastionEntities.Clear();
        }
        public void InitData()
        {
            InitEvent();
        }

        public void ResetData()
        {

        }

        public void SetActive(bool active)
        {

        }
        public void Init()
        {
            for (int i = 0; i < 1; i++)
            {
                var bastion = CreateBastion();
                bastionEntities.Add(bastion);
            }
        }
        #endregion

        #region 私有方法

        private void InitEvent()
        {
            TypeEventSystem.Register<GEvent_Bastion_Click>(OnBastionClick);
        }

        private void CleanEvent()
        {
            TypeEventSystem.UnRegister<GEvent_Bastion_Click>(OnBastionClick);
        }
        private void OnBastionClick(GEvent_Bastion_Click gEvent)
        {
            ClickBastion(gEvent.bastion);
        }

        private void ClickBastion(BastionEntity bastion)
        {
            Debug.Log($"ClickBasion:{bastion}");
            if (!_active) return;
        }

        private BastionEntity CreateBastion()
        {
            GameObject gameObject = DemoWarGameConfig.Instance.BastionObject;
            BastionEntity bastionEntity = Object.Instantiate(gameObject).GetComponent<BastionEntity>();
            bastionEntity.transform.SetParent(DemoWarGameConfig.Instance.GameBoardContent);
            bastionEntity.transform.localScale = Vector3.one;
            bastionEntity.transform.localPosition = Vector3.zero;
            bastionEntity.InitData(null);
            return bastionEntity;
        }
        #endregion
    }
}
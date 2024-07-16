using System.Collections;
using System.Collections.Generic;
using MainGame.Entity;
using MainGame.Event;
using QFramework;
using UnityEngine;

namespace MainGame.Manager
{
    public class BastionManager : BaseSingleton<BastionManager>, IManager
    {
        #region Manager
        protected bool _active;
        public bool Active { get => _active; set => _active = value; }

        private BastionEntity _curBastion = null;

        public void CleanData()
        {

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
        #endregion

        #region 私有方法

        private void InitEvent()
        {
            TypeEventSystem.Register<GEvent_Bastion_Click>(OnBastionClick);
        }

        private void OnBastionClick(GEvent_Bastion_Click gEvent)
        {
            ClickBastion(gEvent.bastion);
        }

        private void ClickBastion(BastionEntity bastion)
        {

        }

        public void Init()
        {
            throw new System.NotImplementedException();
        }
        #endregion
    }
}
namespace MainGame.Entity
{
    using UnityExtension;
    using MainGame.Data;
    using MainGame.Event;
    using System;
    using QFramework;
    using UnityEngine.EventSystems;

    public class BastionEntity : MonoClickHandler, ITimerEntity, IRecyclable
    {
        private BastionData data;
        protected float _time;
        float ITimerEntity.Time { get => _time; set => _time = value; }

        #region 公有方法
        public void InitData(BastionData bastionData)
        {
            data = bastionData;
            CleanPointerClick();
            RegisterClickAction(OnBastionClick);
        }

        public void SyncTime(float delta)
        {

        }
        #endregion

        #region 私有方法

        protected void OnBastionClick(PointerEventData data)
        {
            var gevent = new GEvent_Bastion_Click()
            {
                bastion = this
            };

            TypeEventSystem.Send(gevent);
        }

        public void Recycle()
        {
            Destroy(gameObject);
        }

        public Type GetObjectType()
        {
            return typeof(BastionEntity);
        }

        #endregion
    }
}
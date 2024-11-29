namespace MainGame.Entity
{
    using UnityExtension;
    using MainGame.Data;
    using MainGame.Event;
    using System;
    using QFramework;
    using UnityEngine.EventSystems;
    using UnityEngine;
    using DG.Tweening;

    public class BastionEntity : MonoClickHandler, IAttackable, ITimerEntity, IRecyclable
    {
        private BastionData data;
        public int PlayerId = 0;
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

            ClickAnimation();
        }


        protected virtual void ClickAnimation()
        {
            transform.DOScale(1.1f, 0.1f);
            transform.DOScale(1f, 0.1f).SetDelay(0.1f);
        }

        public void Recycle()
        {
            Destroy(gameObject);
        }

        public Type GetObjectType()
        {
            return typeof(BastionEntity);
        }

        public void UnderAttack(AttackData attackData)
        {
            throw new NotImplementedException();
        }

        public Vector3 GetPosition()
        {
            throw new NotImplementedException();
        }

        public void Dead()
        {
            throw new NotImplementedException();
        }


        #endregion
    }
}
namespace MainGame.Entity
{
    using UnityExtension;
    using MainGame.Data;
    using MainGame.Event;


    public class BastionEntity : MonoClickHandler, ITimerEntity
    {
        private BastionData data;
        protected float _time;
        float ITimerEntity.Time { get => _time; set => _time = value; }

        #region 公有方法
        public void InitData(BastionData bastionData)
        {
            data = bastionData;

        }

        public void SyncTime(float delta)
        {

        }
        #endregion

        #region 私有方法

        protected void OnBastionClick()
        {
            var gevent = new GEvent_Bastion_Click()
            {
                bastion = this
            };

        }

        #endregion
    }
}
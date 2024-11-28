using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MainGame.Entity;

namespace MainGame.Manager
{
    public class SolderManager : BaseSingleton<SolderManager>, IManager
    {
        protected List<SolderEntity> solderEntities = new List<SolderEntity>();
        protected bool _active;
        public bool Active { get => _active; set => _active = value; }

        public void CleanData()
        {
        }

        public void Init()
        {
        }

        public void InitData()
        {
        }

        public void ResetData()
        {
        }

        public void SetActive(bool active)
        {
        }

        #region 公共方法
        public SolderEntity GetSolderEntity()
        {
            return null;
        }
        #endregion
    }
}
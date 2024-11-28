using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MainGame;
using Unity.VisualScripting;

namespace MainGame.Manager
{
    public class GameEntityCacheManager : BaseSingleton<GameEntityCacheManager>
    {
        public GameEntityCacheManager() { }


        public bool Recycle2Cache(IRecyclable recyclable)
        {



            return false;
        }
    }
}
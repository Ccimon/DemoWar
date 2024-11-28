using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MainGame;

namespace MainGame.Manager
{
    /// <summary>
    /// 游戏管理器
    /// </summary>
    public class GameManager : BaseSingleton<GameManager>
    {
        public GameManager() { }

        public void InitGame()
        {
            BastionManager.Instance.InitData();
            BastionManager.Instance.Init();
        }
    }
}
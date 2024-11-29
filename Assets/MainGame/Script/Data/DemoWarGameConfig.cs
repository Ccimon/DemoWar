using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UnityEngine;

namespace MainGame.Script.Data
{
    /// <summary>
    /// 
    /// </summary>
    public class DemoWarGameConfig : MonoBehaviour
    {
        public static DemoWarGameConfig Instance;

        public GameObject BastionObject;
        public GameObject SolderObject;


        public List<Material> PortalMoterial = new List<Material>();
        public List<Material> SolderMaterial = new List<Material>();
        public Transform GameBoardContent;
        private void Awake()
        {
            Instance = this;

        }
    }
}
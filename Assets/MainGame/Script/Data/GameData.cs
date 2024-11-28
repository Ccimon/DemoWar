using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace MainGame.Data
{
    public class BastionData
    {
        public float SoldierCount;
        public float InCreaseSpeed;
        public int UserId;
    }

    public class AttackData
    {
        public int Damage = 0;
        protected int RealDamange = 0;

        public void SetRealDamage(int damage)
        {
            RealDamange = damage;
        }
        public int GetAllDamange()
        {
            return RealDamange;
        }
    }
}

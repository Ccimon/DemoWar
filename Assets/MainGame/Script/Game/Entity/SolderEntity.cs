using System;
using System.Collections;
using System.Collections.Generic;
using MainGame.Data;
using UnityEngine;

namespace MainGame.Entity
{
    public class SolderEntity : MovableMono, IAttackable, IRecyclable, ITimerEntity
    {
        protected float _time;
        float ITimerEntity.Time { get => _time; set => _time = value; }

        public void Dead()
        {
            throw new NotImplementedException();
        }

        public Type GetObjectType()
        {
            throw new NotImplementedException();
        }

        public Vector3 GetPosition()
        {
            throw new NotImplementedException();
        }

        public void Recycle()
        {
            throw new NotImplementedException();
        }

        public void SyncTime(float delta)
        {
            throw new NotImplementedException();
        }

        public void UnderAttack(AttackData attackData)
        {
            throw new NotImplementedException();
        }

        void ITimerEntity.SyncTime(float delta)
        {
            throw new NotImplementedException();
        }
    }
}

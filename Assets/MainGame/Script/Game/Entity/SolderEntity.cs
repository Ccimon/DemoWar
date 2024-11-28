using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace MainGame.Entity
{
    public class SolderEntity : MovableMono, IRecyclable
    {
        public Type GetObjectType()
        {
            throw new NotImplementedException();
        }

        public void Recycle()
        {
            throw new NotImplementedException();
        }
    }
}

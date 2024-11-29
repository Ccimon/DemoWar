using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using System;

namespace UnityExtension
{
    public class MonoClickHandler : MonoBehaviour, IPointerClickHandler
    {
        protected System.Action<PointerEventData> clickCall;
        protected bool _pointerEnabled = true;
        public void RegisterClickAction(System.Action<PointerEventData> call)
        {
            clickCall = null;
            clickCall += call;
        }

        public void OnPointerClick(PointerEventData eventData)
        {
            if (!_pointerEnabled) return;
            clickCall?.Invoke(eventData);
        }

        public void CleanPointerClick()
        {
            clickCall = null;
        }
    }
}

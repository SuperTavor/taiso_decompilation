using UnityEngine;
using System;

public class MenuCommonButton : MonoBehaviour
{
	[Serializable]
	public class Offset
	{
		public Vector2 m_Move;
		public Transform m_Transform;
		public Vector3 m_Base;
	}

	[SerializeField]
	private GameObject m_Object;
	[SerializeField]
	private string m_MethodName;
	[SerializeField]
	private string m_PressMethodName;
	[SerializeField]
	private string m_DragMethodName;
	[SerializeField]
	private bool m_ControlLock;
	[SerializeField]
	private bool m_ColliderLock;
	[SerializeField]
	private Vector2 m_PushOffset;
	[SerializeField]
	private Offset m_Offset;
	[SerializeField]
	private bool m_IsButtonLock;
	[SerializeField]
	private UISprite m_ShadowBase;
}

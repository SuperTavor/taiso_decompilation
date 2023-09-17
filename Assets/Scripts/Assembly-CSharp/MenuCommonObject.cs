using UnityEngine;
using System;

public class MenuCommonObject : MonoBehaviour
{
	[Serializable]
	public class Transform
	{
		public Vector3 m_position;
		public Quaternion m_rotation;
		public Vector3 m_scale;
	}

	[SerializeField]
	private Transform m_Main;
	[SerializeField]
	private Transform m_Sub;
}

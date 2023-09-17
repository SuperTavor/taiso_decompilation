using UnityEngine;
using System;

public class EffectAnimation : MonoBehaviour
{
	[Serializable]
	private class MotionName
	{
		public string m_InOrStand;
		public string m_Loop;
		public string m_End;
	}

	[SerializeField]
	private MaterialAnime[] m_MaterialAnime;
	[SerializeField]
	private MotionName m_MotionName;
	[SerializeField]
	private bool m_MotionLoop;
	[SerializeField]
	private string m_attachName;
}

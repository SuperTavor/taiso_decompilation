using UnityEngine;
using System;

public class ModelImportData : MonoBehaviour
{
	[Serializable]
	public class ClipInfo
	{
		public string m_name;
		public int m_crc;
		public float m_start_key;
		public float m_end_key;
	}

	[SerializeField]
	private ClipInfo[] m_clip_list;
	[SerializeField]
	private float m_min_clip_frame;
	[SerializeField]
	private float m_max_clip_frame;
}

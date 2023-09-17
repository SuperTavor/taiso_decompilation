using UnityEngine;
using System;

public class MaterialAnime : MonoBehaviour
{
	[Serializable]
	public class FrameData
	{
		public float m_frame;
		public float[] m_value;
	}

	[Serializable]
	public class AnimeData
	{
		public MaterialAnime.AnimeType m_type;
		public MaterialAnime.FrameData[] m_frame_list;
		public int m_proj_idx;
		public int m_value_num;
	}

	[Serializable]
	public class ObjectData
	{
		public string m_object_name;
		public string m_material_name;
		[SerializeField]
		public MaterialAnime.AnimeData[] m_anime_data_list;
	}

	public enum AnimeType
	{
		Alpha = 0,
		Color = 1,
		TexUVOfs = 2,
		TexUOfs = 3,
		TexVOfs = 4,
		TexUVScl = 5,
		TexUScl = 6,
		TexVScl = 7,
	}

	[SerializeField]
	private ObjectData[] m_ObjectList;
	[SerializeField]
	private string m_MotionName;
	[SerializeField]
	private float m_StepTime;
}

using System;
using UnityEngine;

[Serializable]
public class MaterialAnimePlayer
{
	[Serializable]
	public class AnimePlayInfo
	{
		public AnimePlayInfo(MaterialAnime.AnimeData _anime_data, Material _material)
		{
		}

		[SerializeField]
		private float[] m_now_value;
		[SerializeField]
		private float m_now_play;
		[SerializeField]
		private float m_now_frame;
		[SerializeField]
		private float m_end_frame;
		[SerializeField]
		private int m_key_data_idx;
		[SerializeField]
		private bool m_is_playing;
		[SerializeField]
		private bool m_is_repeat;
		[SerializeField]
		private MaterialAnime.AnimeData m_anime_data;
		[SerializeField]
		private string m_prop_name;
	}

	[Serializable]
	public class ObjectPlayInfo
	{
		public ObjectPlayInfo(GameObject _game_object, MaterialAnime.ObjectData _object_data)
		{
		}

		[SerializeField]
		private MaterialAnime.ObjectData m_object_data;
		[SerializeField]
		private MaterialAnimePlayer.AnimePlayInfo[] m_anime_list;
		[SerializeField]
		private Material[] m_material_list;
	}

	public MaterialAnimePlayer(GameObject _game_object, MaterialAnime _material_anime)
	{
	}

	[SerializeField]
	private GameObject m_game_object;
	[SerializeField]
	private MaterialAnime m_material_anime;
	[SerializeField]
	private ObjectPlayInfo[] m_object_list;
}

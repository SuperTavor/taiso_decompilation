using UnityEngine;

public class MenuCommonNumberAnime : MonoBehaviour
{
	public enum AnimeType
	{
		Bounds = 0,
		BoundsAll = 1,
	}

	[SerializeField]
	private AnimeType m_anime_type;
	[SerializeField]
	private float m_dulation;
	[SerializeField]
	private Vector2 m_anime_position;
}

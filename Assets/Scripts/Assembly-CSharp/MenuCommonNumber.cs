using UnityEngine;

public class MenuCommonNumber : MonoBehaviour
{
	public enum DrawPositionH
	{
		Left = 0,
		Center = 1,
		Right = 2,
	}

	public enum DrawPositionV
	{
		Top = 0,
		Middle = 1,
		Bottom = 2,
	}

	[SerializeField]
	private int m_DecimalDigit;
	[SerializeField]
	private Vector2 m_size;
	[SerializeField]
	private Vector2 m_padding;
	[SerializeField]
	private int m_digit;
	[SerializeField]
	private bool m_show_zero;
	[SerializeField]
	private bool m_hide_number;
	[SerializeField]
	private GameObject m_atlas_go;
	[SerializeField]
	private string m_prefix;
	[SerializeField]
	private int m_depth;
	[SerializeField]
	private int m_number;
	[SerializeField]
	private GameObject m_AnimeEventListener;
	[SerializeField]
	private DrawPositionH m_DrawPosH;
	[SerializeField]
	private DrawPositionV m_DrawPosV;
}

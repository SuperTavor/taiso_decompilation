using UnityEngine;

public class CharaSelectScene : MonoBehaviour
{
	[SerializeField]
	private int m_chara_num;
	[SerializeField]
	private UIImageButton[] m_select_btn;
	[SerializeField]
	public GameObject m_win_root;
	[SerializeField]
	public UISprite m_win_text;
	[SerializeField]
	public UISprite m_chr_name;
	[SerializeField]
	public UIImageButton m_start_btn;
	[SerializeField]
	public UISprite m_game_lv;
	public Color m_disable_color;
	public Vector3 m_chara_position;
	public GameObject m_banner_yw;
	public GameObject m_banner2_yw;
	public GameObject m_banner2_wf;
}

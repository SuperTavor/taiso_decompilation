using UnityEngine;

public class KanshoScene : MonoBehaviour
{
	public AudioClip m_bgm;
	public AudioClip m_se_skill;
	public AudioClip m_se_change;
	public AudioClip[] m_se_nya;
	public SongNo m_song_no_obj;
	[SerializeField]
	private KanshoCharaModel m_models;
	[SerializeField]
	private UISprite m_lyric_sprite;
	[SerializeField]
	private GameObject m_wisper_obj;
	[SerializeField]
	private UITextureScroll m_scroll_bg;
	[SerializeField]
	private GameObject m_nikukyu;
	[SerializeField]
	private GameObject m_songInfo;
	public float m_bgm_elp;
	public float m_delay_bgm;
	public float m_wait_intro;
	public float m_wait_song_info;
	public float m_change_se_ofs;
	public int m_skill_count;
	public GameObject m_banner_yw;
	public GameObject m_banner2_yw;
	public GameObject m_banner2_wf;
}

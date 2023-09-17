using UnityEngine;

public class PuzzleState : MonoBehaviour
{
	public enum FNC
	{
		NORMAL = 0,
		HEAL = 1,
		CROSS = 2,
		BONUS = 3,
	}

	public enum PNL_STATE
	{
		FREE = 0,
		SWAP = 1,
		DELETE_RSV = 2,
		DELETING = 3,
		DELETED = 4,
		FILL = 5,
		SHUFFLE = 6,
		GEN_BONUS = 7,
	}

	public bool DBG_EDIT_MODE;
	public AudioClip BGM_SUCCESS_I;
	public AudioClip BGM_SUCCESS_L;
	public AudioClip BGM_FAIL_I;
	public AudioClip BGM_FAIL_L;
	public AudioClip BGM_TAISOU;
	public AudioClip SE_START;
	public AudioClip SE_MOVE_OK;
	public AudioClip SE_MOVE_NG;
	public AudioClip SE_HEAL;
	public AudioClip SE_BONUS;
	public AudioClip SE_SHUFFLE;
	public Object PREFAB_PANEL;
	public Object PREFAB_DISAPPEAR_EFFECT;
	public Object PREFAB_HEART;
	public Object PREFAB_BONUS;
	public Object PREFAB_CROSS;
	public Object PREFAB_PANELSCORE;
	public GameObject WHISPER;
	public KanshoCharaModel MODEL;
	public GameObject PUZZLE_COVER;
	public ComboObject COMBO_OBJ;
	public SongNo SONG_NO_OBJ;
	public UISlider HP_SLIDER;
	public TweenColor HP_BACKGROUND;
	public TweenColor PZL_BACKGROUND;
	public TweenAlpha BNS_BACKGROUND;
	public MenuCommonNumber SCORE;
	public MenuCommonNumber COMBO;
	public GameObject COMBO_POS;
	public UISprite LYRIC_SPRITE;
	public GameObject LYRIC_GAMEOBJ;
	public UITextureScroll BG_SCROLL;
	public GameObject CTRL_LOCK_OBJ;
	public GameObject[] PAUSE_OBJ_LIST;
	public GameObject TELOP_END;
	public TweenScale TELOP_START_SCL;
	public TweenAlpha TELOP_START_ALP;
	public TweenPosition TELOP_CHANGE_POS;
	public TweenScale TELOP_END_SCL;
	public TweenAlpha TELOP_END_ALP;
	public TweenScale TELOP_CLEAR_SCL;
	public TweenPosition TELOP_MISS_POS;
	public TweenAlpha TELOP_MISS_ALP;
	public GameObject m_banner_yw;
	public GameObject m_banner2_yw;
	public GameObject m_banner2_wf;
}

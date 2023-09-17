using UnityEngine;

public class ComboObject : MonoBehaviour
{
	public AudioSource AUDIO_SOURCE_COMBO;
	public AudioClip SE_COMBO;
	public GameObject COMBO_POS;
	public MenuCommonNumber COMBO;
	public TweenPosition COMBO_TWEEN;
	public int COMBO_SCORE;
	public MenuCommonNumber COMBO_SCORE_NUM;
	public TweenPosition COMBO_SCORE_TWEEN_POS;
	public TweenAlphaChild COMBO_SCORE_TWEEN_ALP;
	public UISprite[] COMBO_SPR;
	public float TIME_MOVE;
}

using UnityEngine;

public class PanelObject : MonoBehaviour
{
	public int m_index;
	public Vector2 m_base_pos;
	public Vector3 m_base_scl;
	public Vector2 m_pos;
	public float m_vel;
	public sbyte m_clr_type;
	public PuzzleState.FNC m_fnc_type;
	public sbyte m_anm_type;
	public sbyte[] m_next;
	public float m_time;
	public PuzzleState.PNL_STATE m_state;
	public bool m_rsv_bonus;
	public bool m_create_score;
	public sbyte m_clr_type_old;
	public PuzzleState.FNC m_fnc_type_old;
	public float m_eye_time;
}

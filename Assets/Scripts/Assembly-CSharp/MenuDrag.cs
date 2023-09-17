using UnityEngine;

public class MenuDrag : MonoBehaviour
{
	[SerializeField]
	private GameObject m_Object;
	[SerializeField]
	private Vector2 m_Collision;
	[SerializeField]
	private Vector2 m_Scale;
	[SerializeField]
	private Vector2 m_MinRate;
	[SerializeField]
	private Vector2 m_MaxRate;
	[SerializeField]
	private float m_MoveCoef;
}

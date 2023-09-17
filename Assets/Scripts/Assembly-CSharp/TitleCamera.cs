using UnityEngine;

public class TitleCamera : MonoBehaviour
{
	public enum Type
	{
		Normal = 0,
		Front = 1,
	}

	[SerializeField]
	private Type m_Type;
	[SerializeField]
	private float m_Time;
	[SerializeField]
	private float m_FrontAngle;
}

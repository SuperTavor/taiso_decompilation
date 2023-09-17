using UnityEngine;

public class MenuYesNoWindow : MonoBehaviour
{
	[SerializeField]
	private GameObject m_Window;
	[SerializeField]
	private UIPanel m_Panel;
	[SerializeField]
	private GameObject m_Yes;
	[SerializeField]
	private GameObject m_No;
	[SerializeField]
	private GameObject m_Win;
	[SerializeField]
	private UISprite m_YesSpr;
	[SerializeField]
	private UISprite m_NoSpr;
	[SerializeField]
	private UISprite m_WinSpr;
	[SerializeField]
	private UILabel m_YesText;
	[SerializeField]
	private UILabel m_NoText;
	[SerializeField]
	private UILabel m_WinText;
	[SerializeField]
	private BoxCollider m_BackCollision;
}

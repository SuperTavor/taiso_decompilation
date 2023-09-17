using UnityEngine;

public class L5UITextList : MonoBehaviour
{
	[SerializeField]
	private GameObject m_list_panel;
	[SerializeField]
	private GameObject m_list_object_panel;
	[SerializeField]
	private GameObject m_EventListener;
	[SerializeField]
	private string m_EventCallbackSelected;
	[SerializeField]
	private string[] m_ListText;
	[SerializeField]
	private GameObject m_Font;
	[SerializeField]
	private int m_FontSize;
	[SerializeField]
	private Vector2 m_FontPadding;
	[SerializeField]
	private Vector2 m_FontPosAdjust;
	[SerializeField]
	private Vector2 m_ListBoxSize;
	[SerializeField]
	private Vector2 m_ListBoxPadding;
	[SerializeField]
	private UISlicedSprite m_TouchButton;
}

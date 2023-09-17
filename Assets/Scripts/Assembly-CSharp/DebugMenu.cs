using UnityEngine;
using System;

public class DebugMenu : MonoBehaviour
{
	[Serializable]
	public class Resolution
	{
		public int x;
		public int y;
	}

	[SerializeField]
	private L5UITextList m_ui_text_list;
	[SerializeField]
	private bool m_close_at_start;
	[SerializeField]
	private Resolution[] m_resolution_list;
}

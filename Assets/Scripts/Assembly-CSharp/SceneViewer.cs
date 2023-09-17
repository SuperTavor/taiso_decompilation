using UnityEngine;
using System;

public class SceneViewer : MonoBehaviour
{
	[Serializable]
	public class SceneItem
	{
		public bool hide;
		public string scenePath;
		public string sceneName;
	}

	[SerializeField]
	private string m_scene_view;
	[SerializeField]
	private SceneItem[] m_scene_item_list;
	[SerializeField]
	private GameObject m_ListGameObject;
	[SerializeField]
	private string m_BuildListPath;
}

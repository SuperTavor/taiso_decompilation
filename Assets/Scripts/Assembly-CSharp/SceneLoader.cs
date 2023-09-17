using UnityEngine;

public class SceneLoader : MonoBehaviour
{
	public enum ChengeSceneType
	{
		Scene = 0,
		Resources = 1,
		AssetBundle = 2,
	}

	[SerializeField]
	private ChengeSceneType m_change_type;
}

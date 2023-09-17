using UnityEngine;

public class LocalSceneManager : MonoBehaviour
{
	public enum LOCAL_SCENE_TYPE
	{
		LOCAL_SCENE_BACK = -1,
		LOCAL_SCENE_TITLE = 0,
		LOCAL_SCENE_OPITON = 1,
		LOCAL_SCENE_TUTORIAL = 2,
		LOCAL_SCENE_HELP = 3,
		LOCAL_SCENE_CREDIT = 4,
		LOCAL_SCENE_MODE_SELECT = 5,
		LOCAL_SCENE_CHARA_SELECT = 6,
		LOCAL_SCENE_PAZZLE = 7,
		LOCAL_SCENE_KANSHO = 8,
		LOCAL_SCENE_POSE = 9,
		LOCAL_SCENE_RESULT = 10,
		LOCAL_SCENE_QUIT = 11,
		LOCAL_SCENE_NUM = 12,
	}

	public enum PREV_SCENE_TYPE
	{
		PREV_SCENE_DEACTIVE = 0,
		PREV_SCENE_ACTIVE = 1,
		PREV_SCENE_DESTROY = 2,
	}

	[SerializeField]
	private GameObject[] m_ary_prefab;
	[SerializeField]
	private string[] m_ary_name;
}

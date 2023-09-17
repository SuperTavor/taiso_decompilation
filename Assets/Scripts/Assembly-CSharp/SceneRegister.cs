using UnityEngine;

public class SceneRegister : MonoBehaviour
{
	[SerializeField]
	private int m_regist_scene_num;
	[SerializeField]
	private SceneManager.SceneType[] m_reg_scene_type;
	[SerializeField]
	private string[] m_reg_scene_path;
	[SerializeField]
	private string[] m_reg_scene_prefab_resource;
	[SerializeField]
	private string[] m_reg_scene_prefab_assetbundle;
}

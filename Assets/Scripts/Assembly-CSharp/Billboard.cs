using UnityEngine;

public class Billboard : MonoBehaviour
{
	public enum BillboardType
	{
		Normal = 0,
		Y = 1,
		Parallel = 2,
		Y_Parallel = 3,
	}

	public Transform m_Transform;
	public BillboardType m_Type;
}

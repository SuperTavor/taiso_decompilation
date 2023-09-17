using UnityEngine;

public class UIPanel : MonoBehaviour
{
	public enum DebugInfo
	{
		None = 0,
		Gizmos = 1,
		Geometry = 2,
	}

	public bool showInPanelTool;
	public bool generateNormals;
	public bool depthPass;
	public bool widgetsAreStatic;
	[SerializeField]
	private float mAlpha;
	[SerializeField]
	private DebugInfo mDebugInfo;
	[SerializeField]
	private UIDrawCall.Clipping mClipping;
	[SerializeField]
	private Vector4 mClipRange;
	[SerializeField]
	private Vector2 mClipSoftness;
}

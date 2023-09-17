Shader "lv5Chara/Basic" {
Properties {
 _MainTex ("Color(RGB) Mask(A)", 2D) = "white" {}
 _MainTexInetnsity ("MainTex Intensity", Float) = 1
 _NrmTex ("Normal(RGB)", 2D) = "blue" {}
 _CubeTex ("Cube(CUBE)", CUBE) = "black" {}
 _CharaColor ("Chara Color", Color) = (1,1,1,1)
 _CubeAlpha ("CubeTex Alpha", Range(0,1)) = 0.5
 _FresnelPower ("Fresnel Power", Range(0,3)) = 1
 _SpecularColor ("Specular Color", Color) = (1,1,1,1)
 _SpecularPower ("Specular Power", Range(2,64)) = 48
 _RimColor ("Rim Color", Color) = (0.26,0.19,0.16,0)
 _RimRange ("Rim Range", Range(1,0)) = 0.3
 _SkyColor ("Sky Color", Color) = (0,0,0.5,1)
 _GroundColor ("Ground Color", Color) = (0,1,0,1)
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Geometry" "RenderType"="Opaque" }
 Pass {
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Geometry" "RenderType"="Opaque" }
Program "vp" {
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp float _RimRange;
uniform mediump vec4 _MainTex_ST;
uniform highp vec4 unity_Scale;
uniform highp mat4 _Object2World;

uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  mediump vec3 binormal_3;
  mediump vec3 posW_4;
  mediump vec4 tmpvar_5;
  lowp vec2 tmpvar_6;
  lowp vec4 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp vec3 tmpvar_10;
  lowp vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_5 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Object2World * _glesVertex).xyz;
  posW_4 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((_WorldSpaceCameraPos - posW_4));
  tmpvar_7.xyz = tmpvar_15;
  tmpvar_11.xyz = normalize((tmpvar_7.xyz + _WorldSpaceLightPos0.xyz));
  tmpvar_11.w = (1.0/((1.0 - _RimRange)));
  tmpvar_7.w = _RimRange;
  highp vec3 tmpvar_16;
  tmpvar_16 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  binormal_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_17 = tmpvar_1.xyz;
  tmpvar_18 = binormal_3;
  highp mat3 tmpvar_19;
  tmpvar_19[0].x = tmpvar_17.x;
  tmpvar_19[0].y = tmpvar_18.x;
  tmpvar_19[0].z = tmpvar_2.x;
  tmpvar_19[1].x = tmpvar_17.y;
  tmpvar_19[1].y = tmpvar_18.y;
  tmpvar_19[1].z = tmpvar_2.y;
  tmpvar_19[2].x = tmpvar_17.z;
  tmpvar_19[2].y = tmpvar_18.z;
  tmpvar_19[2].z = tmpvar_2.z;
  vec4 v_20;
  v_20.x = _Object2World[0].x;
  v_20.y = _Object2World[1].x;
  v_20.z = _Object2World[2].x;
  v_20.w = _Object2World[3].x;
  highp vec3 tmpvar_21;
  tmpvar_21 = ((tmpvar_19 * v_20.xyz) * unity_Scale.w);
  tmpvar_8 = tmpvar_21;
  vec4 v_22;
  v_22.x = _Object2World[0].y;
  v_22.y = _Object2World[1].y;
  v_22.z = _Object2World[2].y;
  v_22.w = _Object2World[3].y;
  highp vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * v_22.xyz) * unity_Scale.w);
  tmpvar_9 = tmpvar_23;
  vec4 v_24;
  v_24.x = _Object2World[0].z;
  v_24.y = _Object2World[1].z;
  v_24.z = _Object2World[2].z;
  v_24.w = _Object2World[3].z;
  highp vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_19 * v_24.xyz) * unity_Scale.w);
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = unity_4LightPosX0.x;
  tmpvar_26.y = unity_4LightPosY0.x;
  tmpvar_26.z = unity_4LightPosZ0.x;
  mat3 tmpvar_27;
  tmpvar_27[0] = _Object2World[0].xyz;
  tmpvar_27[1] = _Object2World[1].xyz;
  tmpvar_27[2] = _Object2World[2].xyz;
  mediump vec3 lightPos_28;
  lightPos_28 = tmpvar_26;
  lowp vec3 lightColor0_29;
  lightColor0_29 = unity_LightColor[0].xyz;
  mediump float lightAttenSq_30;
  lightAttenSq_30 = unity_4LightAtten0.x;
  lowp vec3 normal_31;
  normal_31 = (tmpvar_27 * (tmpvar_2 * unity_Scale.w));
  lowp vec3 col_32;
  lowp float atten_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (lightPos_28 - posW_4);
  mediump vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  mediump float tmpvar_36;
  tmpvar_36 = ((tmpvar_35.x + tmpvar_35.y) + tmpvar_35.z);
  mediump vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_34 * normal_31);
  mediump float tmpvar_38;
  tmpvar_38 = (1.0/((1.0 + (tmpvar_36 * lightAttenSq_30))));
  atten_33 = tmpvar_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (lightColor0_29 * (max (0.0, (((tmpvar_37.x + tmpvar_37.y) + tmpvar_37.z) * inversesqrt(tmpvar_36))) * atten_33));
  col_32 = tmpvar_39;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_10;
  xlv_TEXCOORD5 = col_32;
  xlv_TEXCOORD6 = tmpvar_11;
}



#endif
#ifdef FRAGMENT

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp vec3 _GroundColor;
uniform lowp vec3 _SkyColor;
uniform lowp vec3 _RimColor;
uniform mediump float _FresnelPower;
uniform lowp float _CubeAlpha;
uniform mediump vec4 _CharaColor;
uniform lowp float _MainTexInetnsity;
uniform samplerCube _CubeTex;
uniform sampler2D _NrmTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _WorldSpaceLightPos0;
void main ()
{
  mediump vec4 color_1;
  lowp float fresnel1_2;
  lowp vec4 cubeColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _MainTexInetnsity);
  lowp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD2.x;
  tmpvar_5[0].y = xlv_TEXCOORD3.x;
  tmpvar_5[0].z = xlv_TEXCOORD4.x;
  tmpvar_5[1].x = xlv_TEXCOORD2.y;
  tmpvar_5[1].y = xlv_TEXCOORD3.y;
  tmpvar_5[1].z = xlv_TEXCOORD4.y;
  tmpvar_5[2].x = xlv_TEXCOORD2.z;
  tmpvar_5[2].y = xlv_TEXCOORD3.z;
  tmpvar_5[2].z = xlv_TEXCOORD4.z;
  lowp vec3 tmpvar_6;
  tmpvar_6 = normalize((tmpvar_5 * (texture2D (_NrmTex, xlv_TEXCOORD0).xyz - 0.5)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = (clamp (dot (tmpvar_6, _WorldSpaceLightPos0.xyz), 0.0, 1.0) * _LightColor0.xyz);
  lowp float tmpvar_8;
  tmpvar_8 = clamp ((1.0 - dot (xlv_TEXCOORD1.xyz, tmpvar_6)), 0.0, 1.0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = (_RimColor * (clamp ((tmpvar_8 - xlv_TEXCOORD1.w), 0.0, 1.0) * xlv_TEXCOORD6.w));
  lowp vec3 i_10;
  i_10 = -(xlv_TEXCOORD1.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = textureCube (_CubeTex, (i_10 - (2.0 * (dot (tmpvar_6, i_10) * tmpvar_6))));
  cubeColor_3.w = tmpvar_11.w;
  lowp vec3 tmpvar_12;
  tmpvar_12 = mix (_GroundColor, _SkyColor, vec3(((tmpvar_6.y + 1.0) * 0.5)));
  mediump float tmpvar_13;
  tmpvar_13 = pow (tmpvar_8, _FresnelPower);
  fresnel1_2 = tmpvar_13;
  cubeColor_3.xyz = ((tmpvar_11.xyz * fresnel1_2) * _CubeAlpha);
  color_1 = tmpvar_4;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (color_1 * _CharaColor);
  color_1.w = tmpvar_14.w;
  color_1.xyz = (tmpvar_14.xyz * ((tmpvar_12 + tmpvar_7) + xlv_TEXCOORD5));
  color_1.xyz = (color_1.xyz + (tmpvar_9 + cubeColor_3.xyz));
  gl_FragData[0] = color_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp float _RimRange;
uniform mediump vec4 _MainTex_ST;
uniform highp vec4 unity_Scale;
uniform highp mat4 _Object2World;

uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  mediump vec3 binormal_3;
  mediump vec3 posW_4;
  mediump vec4 tmpvar_5;
  lowp vec2 tmpvar_6;
  lowp vec4 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp vec3 tmpvar_10;
  lowp vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_5 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Object2World * _glesVertex).xyz;
  posW_4 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((_WorldSpaceCameraPos - posW_4));
  tmpvar_7.xyz = tmpvar_15;
  tmpvar_11.xyz = normalize((tmpvar_7.xyz + _WorldSpaceLightPos0.xyz));
  tmpvar_11.w = (1.0/((1.0 - _RimRange)));
  tmpvar_7.w = _RimRange;
  highp vec3 tmpvar_16;
  tmpvar_16 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  binormal_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_17 = tmpvar_1.xyz;
  tmpvar_18 = binormal_3;
  highp mat3 tmpvar_19;
  tmpvar_19[0].x = tmpvar_17.x;
  tmpvar_19[0].y = tmpvar_18.x;
  tmpvar_19[0].z = tmpvar_2.x;
  tmpvar_19[1].x = tmpvar_17.y;
  tmpvar_19[1].y = tmpvar_18.y;
  tmpvar_19[1].z = tmpvar_2.y;
  tmpvar_19[2].x = tmpvar_17.z;
  tmpvar_19[2].y = tmpvar_18.z;
  tmpvar_19[2].z = tmpvar_2.z;
  vec4 v_20;
  v_20.x = _Object2World[0].x;
  v_20.y = _Object2World[1].x;
  v_20.z = _Object2World[2].x;
  v_20.w = _Object2World[3].x;
  highp vec3 tmpvar_21;
  tmpvar_21 = ((tmpvar_19 * v_20.xyz) * unity_Scale.w);
  tmpvar_8 = tmpvar_21;
  vec4 v_22;
  v_22.x = _Object2World[0].y;
  v_22.y = _Object2World[1].y;
  v_22.z = _Object2World[2].y;
  v_22.w = _Object2World[3].y;
  highp vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * v_22.xyz) * unity_Scale.w);
  tmpvar_9 = tmpvar_23;
  vec4 v_24;
  v_24.x = _Object2World[0].z;
  v_24.y = _Object2World[1].z;
  v_24.z = _Object2World[2].z;
  v_24.w = _Object2World[3].z;
  highp vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_19 * v_24.xyz) * unity_Scale.w);
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = unity_4LightPosX0.x;
  tmpvar_26.y = unity_4LightPosY0.x;
  tmpvar_26.z = unity_4LightPosZ0.x;
  mat3 tmpvar_27;
  tmpvar_27[0] = _Object2World[0].xyz;
  tmpvar_27[1] = _Object2World[1].xyz;
  tmpvar_27[2] = _Object2World[2].xyz;
  mediump vec3 lightPos_28;
  lightPos_28 = tmpvar_26;
  lowp vec3 lightColor0_29;
  lightColor0_29 = unity_LightColor[0].xyz;
  mediump float lightAttenSq_30;
  lightAttenSq_30 = unity_4LightAtten0.x;
  lowp vec3 normal_31;
  normal_31 = (tmpvar_27 * (tmpvar_2 * unity_Scale.w));
  lowp vec3 col_32;
  lowp float atten_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (lightPos_28 - posW_4);
  mediump vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  mediump float tmpvar_36;
  tmpvar_36 = ((tmpvar_35.x + tmpvar_35.y) + tmpvar_35.z);
  mediump vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_34 * normal_31);
  mediump float tmpvar_38;
  tmpvar_38 = (1.0/((1.0 + (tmpvar_36 * lightAttenSq_30))));
  atten_33 = tmpvar_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (lightColor0_29 * (max (0.0, (((tmpvar_37.x + tmpvar_37.y) + tmpvar_37.z) * inversesqrt(tmpvar_36))) * atten_33));
  col_32 = tmpvar_39;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_10;
  xlv_TEXCOORD5 = col_32;
  xlv_TEXCOORD6 = tmpvar_11;
}



#endif
#ifdef FRAGMENT

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp vec3 _GroundColor;
uniform lowp vec3 _SkyColor;
uniform lowp vec3 _RimColor;
uniform mediump float _FresnelPower;
uniform lowp float _CubeAlpha;
uniform mediump vec4 _CharaColor;
uniform lowp float _MainTexInetnsity;
uniform samplerCube _CubeTex;
uniform sampler2D _NrmTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _WorldSpaceLightPos0;
void main ()
{
  mediump vec4 color_1;
  lowp float fresnel1_2;
  lowp vec4 cubeColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _MainTexInetnsity);
  lowp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD2.x;
  tmpvar_5[0].y = xlv_TEXCOORD3.x;
  tmpvar_5[0].z = xlv_TEXCOORD4.x;
  tmpvar_5[1].x = xlv_TEXCOORD2.y;
  tmpvar_5[1].y = xlv_TEXCOORD3.y;
  tmpvar_5[1].z = xlv_TEXCOORD4.y;
  tmpvar_5[2].x = xlv_TEXCOORD2.z;
  tmpvar_5[2].y = xlv_TEXCOORD3.z;
  tmpvar_5[2].z = xlv_TEXCOORD4.z;
  lowp vec3 tmpvar_6;
  tmpvar_6 = normalize((tmpvar_5 * (texture2D (_NrmTex, xlv_TEXCOORD0).xyz - 0.5)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = (clamp (dot (tmpvar_6, _WorldSpaceLightPos0.xyz), 0.0, 1.0) * _LightColor0.xyz);
  lowp float tmpvar_8;
  tmpvar_8 = clamp ((1.0 - dot (xlv_TEXCOORD1.xyz, tmpvar_6)), 0.0, 1.0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = (_RimColor * (clamp ((tmpvar_8 - xlv_TEXCOORD1.w), 0.0, 1.0) * xlv_TEXCOORD6.w));
  lowp vec3 i_10;
  i_10 = -(xlv_TEXCOORD1.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = textureCube (_CubeTex, (i_10 - (2.0 * (dot (tmpvar_6, i_10) * tmpvar_6))));
  cubeColor_3.w = tmpvar_11.w;
  lowp vec3 tmpvar_12;
  tmpvar_12 = mix (_GroundColor, _SkyColor, vec3(((tmpvar_6.y + 1.0) * 0.5)));
  mediump float tmpvar_13;
  tmpvar_13 = pow (tmpvar_8, _FresnelPower);
  fresnel1_2 = tmpvar_13;
  cubeColor_3.xyz = ((tmpvar_11.xyz * fresnel1_2) * _CubeAlpha);
  color_1 = tmpvar_4;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (color_1 * _CharaColor);
  color_1.w = tmpvar_14.w;
  color_1.xyz = (tmpvar_14.xyz * ((tmpvar_12 + tmpvar_7) + xlv_TEXCOORD5));
  color_1.xyz = (color_1.xyz + (tmpvar_9 + cubeColor_3.xyz));
  gl_FragData[0] = color_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp float _RimRange;
uniform mediump vec4 _MainTex_ST;
uniform highp vec4 unity_Scale;
uniform highp mat4 _Object2World;

uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  mediump vec3 binormal_3;
  mediump vec3 posW_4;
  mediump vec4 tmpvar_5;
  lowp vec2 tmpvar_6;
  lowp vec4 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp vec3 tmpvar_10;
  lowp vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_5 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Object2World * _glesVertex).xyz;
  posW_4 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((_WorldSpaceCameraPos - posW_4));
  tmpvar_7.xyz = tmpvar_15;
  tmpvar_11.xyz = normalize((tmpvar_7.xyz + _WorldSpaceLightPos0.xyz));
  tmpvar_11.w = (1.0/((1.0 - _RimRange)));
  tmpvar_7.w = _RimRange;
  highp vec3 tmpvar_16;
  tmpvar_16 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  binormal_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_17 = tmpvar_1.xyz;
  tmpvar_18 = binormal_3;
  highp mat3 tmpvar_19;
  tmpvar_19[0].x = tmpvar_17.x;
  tmpvar_19[0].y = tmpvar_18.x;
  tmpvar_19[0].z = tmpvar_2.x;
  tmpvar_19[1].x = tmpvar_17.y;
  tmpvar_19[1].y = tmpvar_18.y;
  tmpvar_19[1].z = tmpvar_2.y;
  tmpvar_19[2].x = tmpvar_17.z;
  tmpvar_19[2].y = tmpvar_18.z;
  tmpvar_19[2].z = tmpvar_2.z;
  vec4 v_20;
  v_20.x = _Object2World[0].x;
  v_20.y = _Object2World[1].x;
  v_20.z = _Object2World[2].x;
  v_20.w = _Object2World[3].x;
  highp vec3 tmpvar_21;
  tmpvar_21 = ((tmpvar_19 * v_20.xyz) * unity_Scale.w);
  tmpvar_8 = tmpvar_21;
  vec4 v_22;
  v_22.x = _Object2World[0].y;
  v_22.y = _Object2World[1].y;
  v_22.z = _Object2World[2].y;
  v_22.w = _Object2World[3].y;
  highp vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * v_22.xyz) * unity_Scale.w);
  tmpvar_9 = tmpvar_23;
  vec4 v_24;
  v_24.x = _Object2World[0].z;
  v_24.y = _Object2World[1].z;
  v_24.z = _Object2World[2].z;
  v_24.w = _Object2World[3].z;
  highp vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_19 * v_24.xyz) * unity_Scale.w);
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = unity_4LightPosX0.x;
  tmpvar_26.y = unity_4LightPosY0.x;
  tmpvar_26.z = unity_4LightPosZ0.x;
  mat3 tmpvar_27;
  tmpvar_27[0] = _Object2World[0].xyz;
  tmpvar_27[1] = _Object2World[1].xyz;
  tmpvar_27[2] = _Object2World[2].xyz;
  mediump vec3 lightPos_28;
  lightPos_28 = tmpvar_26;
  lowp vec3 lightColor0_29;
  lightColor0_29 = unity_LightColor[0].xyz;
  mediump float lightAttenSq_30;
  lightAttenSq_30 = unity_4LightAtten0.x;
  lowp vec3 normal_31;
  normal_31 = (tmpvar_27 * (tmpvar_2 * unity_Scale.w));
  lowp vec3 col_32;
  lowp float atten_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (lightPos_28 - posW_4);
  mediump vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  mediump float tmpvar_36;
  tmpvar_36 = ((tmpvar_35.x + tmpvar_35.y) + tmpvar_35.z);
  mediump vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_34 * normal_31);
  mediump float tmpvar_38;
  tmpvar_38 = (1.0/((1.0 + (tmpvar_36 * lightAttenSq_30))));
  atten_33 = tmpvar_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (lightColor0_29 * (max (0.0, (((tmpvar_37.x + tmpvar_37.y) + tmpvar_37.z) * inversesqrt(tmpvar_36))) * atten_33));
  col_32 = tmpvar_39;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_10;
  xlv_TEXCOORD5 = col_32;
  xlv_TEXCOORD6 = tmpvar_11;
}



#endif
#ifdef FRAGMENT

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp vec3 _GroundColor;
uniform lowp vec3 _SkyColor;
uniform lowp vec3 _RimColor;
uniform mediump float _FresnelPower;
uniform lowp float _CubeAlpha;
uniform mediump vec4 _CharaColor;
uniform lowp float _MainTexInetnsity;
uniform samplerCube _CubeTex;
uniform sampler2D _NrmTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _WorldSpaceLightPos0;
void main ()
{
  mediump vec4 color_1;
  lowp float fresnel1_2;
  lowp vec4 cubeColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _MainTexInetnsity);
  lowp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD2.x;
  tmpvar_5[0].y = xlv_TEXCOORD3.x;
  tmpvar_5[0].z = xlv_TEXCOORD4.x;
  tmpvar_5[1].x = xlv_TEXCOORD2.y;
  tmpvar_5[1].y = xlv_TEXCOORD3.y;
  tmpvar_5[1].z = xlv_TEXCOORD4.y;
  tmpvar_5[2].x = xlv_TEXCOORD2.z;
  tmpvar_5[2].y = xlv_TEXCOORD3.z;
  tmpvar_5[2].z = xlv_TEXCOORD4.z;
  lowp vec3 tmpvar_6;
  tmpvar_6 = normalize((tmpvar_5 * (texture2D (_NrmTex, xlv_TEXCOORD0).xyz - 0.5)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = (clamp (dot (tmpvar_6, _WorldSpaceLightPos0.xyz), 0.0, 1.0) * _LightColor0.xyz);
  lowp float tmpvar_8;
  tmpvar_8 = clamp ((1.0 - dot (xlv_TEXCOORD1.xyz, tmpvar_6)), 0.0, 1.0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = (_RimColor * (clamp ((tmpvar_8 - xlv_TEXCOORD1.w), 0.0, 1.0) * xlv_TEXCOORD6.w));
  lowp vec3 i_10;
  i_10 = -(xlv_TEXCOORD1.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = textureCube (_CubeTex, (i_10 - (2.0 * (dot (tmpvar_6, i_10) * tmpvar_6))));
  cubeColor_3.w = tmpvar_11.w;
  lowp vec3 tmpvar_12;
  tmpvar_12 = mix (_GroundColor, _SkyColor, vec3(((tmpvar_6.y + 1.0) * 0.5)));
  mediump float tmpvar_13;
  tmpvar_13 = pow (tmpvar_8, _FresnelPower);
  fresnel1_2 = tmpvar_13;
  cubeColor_3.xyz = ((tmpvar_11.xyz * fresnel1_2) * _CubeAlpha);
  color_1 = tmpvar_4;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (color_1 * _CharaColor);
  color_1.w = tmpvar_14.w;
  color_1.xyz = (tmpvar_14.xyz * ((tmpvar_12 + tmpvar_7) + xlv_TEXCOORD5));
  color_1.xyz = (color_1.xyz + (tmpvar_9 + cubeColor_3.xyz));
  gl_FragData[0] = color_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp float _RimRange;
uniform mediump vec4 _MainTex_ST;
uniform highp vec4 unity_Scale;
uniform highp mat4 _Object2World;

uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  mediump vec3 binormal_3;
  mediump vec3 posW_4;
  mediump vec4 tmpvar_5;
  lowp vec2 tmpvar_6;
  lowp vec4 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp vec3 tmpvar_10;
  lowp vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_5 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Object2World * _glesVertex).xyz;
  posW_4 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((_WorldSpaceCameraPos - posW_4));
  tmpvar_7.xyz = tmpvar_15;
  tmpvar_11.xyz = normalize((tmpvar_7.xyz + _WorldSpaceLightPos0.xyz));
  tmpvar_11.w = (1.0/((1.0 - _RimRange)));
  tmpvar_7.w = _RimRange;
  highp vec3 tmpvar_16;
  tmpvar_16 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  binormal_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_17 = tmpvar_1.xyz;
  tmpvar_18 = binormal_3;
  highp mat3 tmpvar_19;
  tmpvar_19[0].x = tmpvar_17.x;
  tmpvar_19[0].y = tmpvar_18.x;
  tmpvar_19[0].z = tmpvar_2.x;
  tmpvar_19[1].x = tmpvar_17.y;
  tmpvar_19[1].y = tmpvar_18.y;
  tmpvar_19[1].z = tmpvar_2.y;
  tmpvar_19[2].x = tmpvar_17.z;
  tmpvar_19[2].y = tmpvar_18.z;
  tmpvar_19[2].z = tmpvar_2.z;
  vec4 v_20;
  v_20.x = _Object2World[0].x;
  v_20.y = _Object2World[1].x;
  v_20.z = _Object2World[2].x;
  v_20.w = _Object2World[3].x;
  highp vec3 tmpvar_21;
  tmpvar_21 = ((tmpvar_19 * v_20.xyz) * unity_Scale.w);
  tmpvar_8 = tmpvar_21;
  vec4 v_22;
  v_22.x = _Object2World[0].y;
  v_22.y = _Object2World[1].y;
  v_22.z = _Object2World[2].y;
  v_22.w = _Object2World[3].y;
  highp vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * v_22.xyz) * unity_Scale.w);
  tmpvar_9 = tmpvar_23;
  vec4 v_24;
  v_24.x = _Object2World[0].z;
  v_24.y = _Object2World[1].z;
  v_24.z = _Object2World[2].z;
  v_24.w = _Object2World[3].z;
  highp vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_19 * v_24.xyz) * unity_Scale.w);
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = unity_4LightPosX0.x;
  tmpvar_26.y = unity_4LightPosY0.x;
  tmpvar_26.z = unity_4LightPosZ0.x;
  mat3 tmpvar_27;
  tmpvar_27[0] = _Object2World[0].xyz;
  tmpvar_27[1] = _Object2World[1].xyz;
  tmpvar_27[2] = _Object2World[2].xyz;
  mediump vec3 lightPos_28;
  lightPos_28 = tmpvar_26;
  lowp vec3 lightColor0_29;
  lightColor0_29 = unity_LightColor[0].xyz;
  mediump float lightAttenSq_30;
  lightAttenSq_30 = unity_4LightAtten0.x;
  lowp vec3 normal_31;
  normal_31 = (tmpvar_27 * (tmpvar_2 * unity_Scale.w));
  lowp vec3 col_32;
  lowp float atten_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (lightPos_28 - posW_4);
  mediump vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  mediump float tmpvar_36;
  tmpvar_36 = ((tmpvar_35.x + tmpvar_35.y) + tmpvar_35.z);
  mediump vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_34 * normal_31);
  mediump float tmpvar_38;
  tmpvar_38 = (1.0/((1.0 + (tmpvar_36 * lightAttenSq_30))));
  atten_33 = tmpvar_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (lightColor0_29 * (max (0.0, (((tmpvar_37.x + tmpvar_37.y) + tmpvar_37.z) * inversesqrt(tmpvar_36))) * atten_33));
  col_32 = tmpvar_39;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_10;
  xlv_TEXCOORD5 = col_32;
  xlv_TEXCOORD6 = tmpvar_11;
}



#endif
#ifdef FRAGMENT

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp vec3 _GroundColor;
uniform lowp vec3 _SkyColor;
uniform lowp vec3 _RimColor;
uniform mediump float _FresnelPower;
uniform lowp float _CubeAlpha;
uniform mediump vec4 _CharaColor;
uniform lowp float _MainTexInetnsity;
uniform samplerCube _CubeTex;
uniform sampler2D _NrmTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _WorldSpaceLightPos0;
void main ()
{
  mediump vec4 color_1;
  lowp float fresnel1_2;
  lowp vec4 cubeColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _MainTexInetnsity);
  lowp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD2.x;
  tmpvar_5[0].y = xlv_TEXCOORD3.x;
  tmpvar_5[0].z = xlv_TEXCOORD4.x;
  tmpvar_5[1].x = xlv_TEXCOORD2.y;
  tmpvar_5[1].y = xlv_TEXCOORD3.y;
  tmpvar_5[1].z = xlv_TEXCOORD4.y;
  tmpvar_5[2].x = xlv_TEXCOORD2.z;
  tmpvar_5[2].y = xlv_TEXCOORD3.z;
  tmpvar_5[2].z = xlv_TEXCOORD4.z;
  lowp vec3 tmpvar_6;
  tmpvar_6 = normalize((tmpvar_5 * (texture2D (_NrmTex, xlv_TEXCOORD0).xyz - 0.5)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = (clamp (dot (tmpvar_6, _WorldSpaceLightPos0.xyz), 0.0, 1.0) * _LightColor0.xyz);
  lowp float tmpvar_8;
  tmpvar_8 = clamp ((1.0 - dot (xlv_TEXCOORD1.xyz, tmpvar_6)), 0.0, 1.0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = (_RimColor * (clamp ((tmpvar_8 - xlv_TEXCOORD1.w), 0.0, 1.0) * xlv_TEXCOORD6.w));
  lowp vec3 i_10;
  i_10 = -(xlv_TEXCOORD1.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = textureCube (_CubeTex, (i_10 - (2.0 * (dot (tmpvar_6, i_10) * tmpvar_6))));
  cubeColor_3.w = tmpvar_11.w;
  lowp vec3 tmpvar_12;
  tmpvar_12 = mix (_GroundColor, _SkyColor, vec3(((tmpvar_6.y + 1.0) * 0.5)));
  mediump float tmpvar_13;
  tmpvar_13 = pow (tmpvar_8, _FresnelPower);
  fresnel1_2 = tmpvar_13;
  cubeColor_3.xyz = ((tmpvar_11.xyz * fresnel1_2) * _CubeAlpha);
  color_1 = tmpvar_4;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (color_1 * _CharaColor);
  color_1.w = tmpvar_14.w;
  color_1.xyz = (tmpvar_14.xyz * ((tmpvar_12 + tmpvar_7) + xlv_TEXCOORD5));
  color_1.xyz = (color_1.xyz + (tmpvar_9 + cubeColor_3.xyz));
  gl_FragData[0] = color_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp float _RimRange;
uniform mediump vec4 _MainTex_ST;
uniform highp vec4 unity_Scale;
uniform highp mat4 _Object2World;

uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  mediump vec3 binormal_3;
  mediump vec3 posW_4;
  mediump vec4 tmpvar_5;
  lowp vec2 tmpvar_6;
  lowp vec4 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp vec3 tmpvar_10;
  lowp vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_5 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Object2World * _glesVertex).xyz;
  posW_4 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((_WorldSpaceCameraPos - posW_4));
  tmpvar_7.xyz = tmpvar_15;
  tmpvar_11.xyz = normalize((tmpvar_7.xyz + _WorldSpaceLightPos0.xyz));
  tmpvar_11.w = (1.0/((1.0 - _RimRange)));
  tmpvar_7.w = _RimRange;
  highp vec3 tmpvar_16;
  tmpvar_16 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  binormal_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_17 = tmpvar_1.xyz;
  tmpvar_18 = binormal_3;
  highp mat3 tmpvar_19;
  tmpvar_19[0].x = tmpvar_17.x;
  tmpvar_19[0].y = tmpvar_18.x;
  tmpvar_19[0].z = tmpvar_2.x;
  tmpvar_19[1].x = tmpvar_17.y;
  tmpvar_19[1].y = tmpvar_18.y;
  tmpvar_19[1].z = tmpvar_2.y;
  tmpvar_19[2].x = tmpvar_17.z;
  tmpvar_19[2].y = tmpvar_18.z;
  tmpvar_19[2].z = tmpvar_2.z;
  vec4 v_20;
  v_20.x = _Object2World[0].x;
  v_20.y = _Object2World[1].x;
  v_20.z = _Object2World[2].x;
  v_20.w = _Object2World[3].x;
  highp vec3 tmpvar_21;
  tmpvar_21 = ((tmpvar_19 * v_20.xyz) * unity_Scale.w);
  tmpvar_8 = tmpvar_21;
  vec4 v_22;
  v_22.x = _Object2World[0].y;
  v_22.y = _Object2World[1].y;
  v_22.z = _Object2World[2].y;
  v_22.w = _Object2World[3].y;
  highp vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * v_22.xyz) * unity_Scale.w);
  tmpvar_9 = tmpvar_23;
  vec4 v_24;
  v_24.x = _Object2World[0].z;
  v_24.y = _Object2World[1].z;
  v_24.z = _Object2World[2].z;
  v_24.w = _Object2World[3].z;
  highp vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_19 * v_24.xyz) * unity_Scale.w);
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = unity_4LightPosX0.x;
  tmpvar_26.y = unity_4LightPosY0.x;
  tmpvar_26.z = unity_4LightPosZ0.x;
  mat3 tmpvar_27;
  tmpvar_27[0] = _Object2World[0].xyz;
  tmpvar_27[1] = _Object2World[1].xyz;
  tmpvar_27[2] = _Object2World[2].xyz;
  mediump vec3 lightPos_28;
  lightPos_28 = tmpvar_26;
  lowp vec3 lightColor0_29;
  lightColor0_29 = unity_LightColor[0].xyz;
  mediump float lightAttenSq_30;
  lightAttenSq_30 = unity_4LightAtten0.x;
  lowp vec3 normal_31;
  normal_31 = (tmpvar_27 * (tmpvar_2 * unity_Scale.w));
  lowp vec3 col_32;
  lowp float atten_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (lightPos_28 - posW_4);
  mediump vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  mediump float tmpvar_36;
  tmpvar_36 = ((tmpvar_35.x + tmpvar_35.y) + tmpvar_35.z);
  mediump vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_34 * normal_31);
  mediump float tmpvar_38;
  tmpvar_38 = (1.0/((1.0 + (tmpvar_36 * lightAttenSq_30))));
  atten_33 = tmpvar_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (lightColor0_29 * (max (0.0, (((tmpvar_37.x + tmpvar_37.y) + tmpvar_37.z) * inversesqrt(tmpvar_36))) * atten_33));
  col_32 = tmpvar_39;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_10;
  xlv_TEXCOORD5 = col_32;
  xlv_TEXCOORD6 = tmpvar_11;
}



#endif
#ifdef FRAGMENT

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp vec3 _GroundColor;
uniform lowp vec3 _SkyColor;
uniform lowp vec3 _RimColor;
uniform mediump float _FresnelPower;
uniform lowp float _CubeAlpha;
uniform mediump vec4 _CharaColor;
uniform lowp float _MainTexInetnsity;
uniform samplerCube _CubeTex;
uniform sampler2D _NrmTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _WorldSpaceLightPos0;
void main ()
{
  mediump vec4 color_1;
  lowp float fresnel1_2;
  lowp vec4 cubeColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _MainTexInetnsity);
  lowp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD2.x;
  tmpvar_5[0].y = xlv_TEXCOORD3.x;
  tmpvar_5[0].z = xlv_TEXCOORD4.x;
  tmpvar_5[1].x = xlv_TEXCOORD2.y;
  tmpvar_5[1].y = xlv_TEXCOORD3.y;
  tmpvar_5[1].z = xlv_TEXCOORD4.y;
  tmpvar_5[2].x = xlv_TEXCOORD2.z;
  tmpvar_5[2].y = xlv_TEXCOORD3.z;
  tmpvar_5[2].z = xlv_TEXCOORD4.z;
  lowp vec3 tmpvar_6;
  tmpvar_6 = normalize((tmpvar_5 * (texture2D (_NrmTex, xlv_TEXCOORD0).xyz - 0.5)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = (clamp (dot (tmpvar_6, _WorldSpaceLightPos0.xyz), 0.0, 1.0) * _LightColor0.xyz);
  lowp float tmpvar_8;
  tmpvar_8 = clamp ((1.0 - dot (xlv_TEXCOORD1.xyz, tmpvar_6)), 0.0, 1.0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = (_RimColor * (clamp ((tmpvar_8 - xlv_TEXCOORD1.w), 0.0, 1.0) * xlv_TEXCOORD6.w));
  lowp vec3 i_10;
  i_10 = -(xlv_TEXCOORD1.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = textureCube (_CubeTex, (i_10 - (2.0 * (dot (tmpvar_6, i_10) * tmpvar_6))));
  cubeColor_3.w = tmpvar_11.w;
  lowp vec3 tmpvar_12;
  tmpvar_12 = mix (_GroundColor, _SkyColor, vec3(((tmpvar_6.y + 1.0) * 0.5)));
  mediump float tmpvar_13;
  tmpvar_13 = pow (tmpvar_8, _FresnelPower);
  fresnel1_2 = tmpvar_13;
  cubeColor_3.xyz = ((tmpvar_11.xyz * fresnel1_2) * _CubeAlpha);
  color_1 = tmpvar_4;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (color_1 * _CharaColor);
  color_1.w = tmpvar_14.w;
  color_1.xyz = (tmpvar_14.xyz * ((tmpvar_12 + tmpvar_7) + xlv_TEXCOORD5));
  color_1.xyz = (color_1.xyz + (tmpvar_9 + cubeColor_3.xyz));
  gl_FragData[0] = color_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp float _RimRange;
uniform mediump vec4 _MainTex_ST;
uniform highp vec4 unity_Scale;
uniform highp mat4 _Object2World;

uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  mediump vec3 binormal_3;
  mediump vec3 posW_4;
  mediump vec4 tmpvar_5;
  lowp vec2 tmpvar_6;
  lowp vec4 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp vec3 tmpvar_10;
  lowp vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_5 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Object2World * _glesVertex).xyz;
  posW_4 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((_WorldSpaceCameraPos - posW_4));
  tmpvar_7.xyz = tmpvar_15;
  tmpvar_11.xyz = normalize((tmpvar_7.xyz + _WorldSpaceLightPos0.xyz));
  tmpvar_11.w = (1.0/((1.0 - _RimRange)));
  tmpvar_7.w = _RimRange;
  highp vec3 tmpvar_16;
  tmpvar_16 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  binormal_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_17 = tmpvar_1.xyz;
  tmpvar_18 = binormal_3;
  highp mat3 tmpvar_19;
  tmpvar_19[0].x = tmpvar_17.x;
  tmpvar_19[0].y = tmpvar_18.x;
  tmpvar_19[0].z = tmpvar_2.x;
  tmpvar_19[1].x = tmpvar_17.y;
  tmpvar_19[1].y = tmpvar_18.y;
  tmpvar_19[1].z = tmpvar_2.y;
  tmpvar_19[2].x = tmpvar_17.z;
  tmpvar_19[2].y = tmpvar_18.z;
  tmpvar_19[2].z = tmpvar_2.z;
  vec4 v_20;
  v_20.x = _Object2World[0].x;
  v_20.y = _Object2World[1].x;
  v_20.z = _Object2World[2].x;
  v_20.w = _Object2World[3].x;
  highp vec3 tmpvar_21;
  tmpvar_21 = ((tmpvar_19 * v_20.xyz) * unity_Scale.w);
  tmpvar_8 = tmpvar_21;
  vec4 v_22;
  v_22.x = _Object2World[0].y;
  v_22.y = _Object2World[1].y;
  v_22.z = _Object2World[2].y;
  v_22.w = _Object2World[3].y;
  highp vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * v_22.xyz) * unity_Scale.w);
  tmpvar_9 = tmpvar_23;
  vec4 v_24;
  v_24.x = _Object2World[0].z;
  v_24.y = _Object2World[1].z;
  v_24.z = _Object2World[2].z;
  v_24.w = _Object2World[3].z;
  highp vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_19 * v_24.xyz) * unity_Scale.w);
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = unity_4LightPosX0.x;
  tmpvar_26.y = unity_4LightPosY0.x;
  tmpvar_26.z = unity_4LightPosZ0.x;
  mat3 tmpvar_27;
  tmpvar_27[0] = _Object2World[0].xyz;
  tmpvar_27[1] = _Object2World[1].xyz;
  tmpvar_27[2] = _Object2World[2].xyz;
  mediump vec3 lightPos_28;
  lightPos_28 = tmpvar_26;
  lowp vec3 lightColor0_29;
  lightColor0_29 = unity_LightColor[0].xyz;
  mediump float lightAttenSq_30;
  lightAttenSq_30 = unity_4LightAtten0.x;
  lowp vec3 normal_31;
  normal_31 = (tmpvar_27 * (tmpvar_2 * unity_Scale.w));
  lowp vec3 col_32;
  lowp float atten_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (lightPos_28 - posW_4);
  mediump vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  mediump float tmpvar_36;
  tmpvar_36 = ((tmpvar_35.x + tmpvar_35.y) + tmpvar_35.z);
  mediump vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_34 * normal_31);
  mediump float tmpvar_38;
  tmpvar_38 = (1.0/((1.0 + (tmpvar_36 * lightAttenSq_30))));
  atten_33 = tmpvar_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (lightColor0_29 * (max (0.0, (((tmpvar_37.x + tmpvar_37.y) + tmpvar_37.z) * inversesqrt(tmpvar_36))) * atten_33));
  col_32 = tmpvar_39;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_10;
  xlv_TEXCOORD5 = col_32;
  xlv_TEXCOORD6 = tmpvar_11;
}



#endif
#ifdef FRAGMENT

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp vec3 _GroundColor;
uniform lowp vec3 _SkyColor;
uniform lowp vec3 _RimColor;
uniform mediump float _FresnelPower;
uniform lowp float _CubeAlpha;
uniform mediump vec4 _CharaColor;
uniform lowp float _MainTexInetnsity;
uniform samplerCube _CubeTex;
uniform sampler2D _NrmTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _WorldSpaceLightPos0;
void main ()
{
  mediump vec4 color_1;
  lowp float fresnel1_2;
  lowp vec4 cubeColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _MainTexInetnsity);
  lowp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD2.x;
  tmpvar_5[0].y = xlv_TEXCOORD3.x;
  tmpvar_5[0].z = xlv_TEXCOORD4.x;
  tmpvar_5[1].x = xlv_TEXCOORD2.y;
  tmpvar_5[1].y = xlv_TEXCOORD3.y;
  tmpvar_5[1].z = xlv_TEXCOORD4.y;
  tmpvar_5[2].x = xlv_TEXCOORD2.z;
  tmpvar_5[2].y = xlv_TEXCOORD3.z;
  tmpvar_5[2].z = xlv_TEXCOORD4.z;
  lowp vec3 tmpvar_6;
  tmpvar_6 = normalize((tmpvar_5 * (texture2D (_NrmTex, xlv_TEXCOORD0).xyz - 0.5)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = (clamp (dot (tmpvar_6, _WorldSpaceLightPos0.xyz), 0.0, 1.0) * _LightColor0.xyz);
  lowp float tmpvar_8;
  tmpvar_8 = clamp ((1.0 - dot (xlv_TEXCOORD1.xyz, tmpvar_6)), 0.0, 1.0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = (_RimColor * (clamp ((tmpvar_8 - xlv_TEXCOORD1.w), 0.0, 1.0) * xlv_TEXCOORD6.w));
  lowp vec3 i_10;
  i_10 = -(xlv_TEXCOORD1.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = textureCube (_CubeTex, (i_10 - (2.0 * (dot (tmpvar_6, i_10) * tmpvar_6))));
  cubeColor_3.w = tmpvar_11.w;
  lowp vec3 tmpvar_12;
  tmpvar_12 = mix (_GroundColor, _SkyColor, vec3(((tmpvar_6.y + 1.0) * 0.5)));
  mediump float tmpvar_13;
  tmpvar_13 = pow (tmpvar_8, _FresnelPower);
  fresnel1_2 = tmpvar_13;
  cubeColor_3.xyz = ((tmpvar_11.xyz * fresnel1_2) * _CubeAlpha);
  color_1 = tmpvar_4;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (color_1 * _CharaColor);
  color_1.w = tmpvar_14.w;
  color_1.xyz = (tmpvar_14.xyz * ((tmpvar_12 + tmpvar_7) + xlv_TEXCOORD5));
  color_1.xyz = (color_1.xyz + (tmpvar_9 + cubeColor_3.xyz));
  gl_FragData[0] = color_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp float _RimRange;
uniform mediump vec4 _MainTex_ST;
uniform highp vec4 unity_Scale;
uniform highp mat4 _Object2World;

uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  mediump vec3 binormal_3;
  mediump vec3 posW_4;
  mediump vec4 tmpvar_5;
  lowp vec2 tmpvar_6;
  lowp vec4 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp vec3 tmpvar_10;
  lowp vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_5 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Object2World * _glesVertex).xyz;
  posW_4 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((_WorldSpaceCameraPos - posW_4));
  tmpvar_7.xyz = tmpvar_15;
  tmpvar_11.xyz = normalize((tmpvar_7.xyz + _WorldSpaceLightPos0.xyz));
  tmpvar_11.w = (1.0/((1.0 - _RimRange)));
  tmpvar_7.w = _RimRange;
  highp vec3 tmpvar_16;
  tmpvar_16 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  binormal_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_17 = tmpvar_1.xyz;
  tmpvar_18 = binormal_3;
  highp mat3 tmpvar_19;
  tmpvar_19[0].x = tmpvar_17.x;
  tmpvar_19[0].y = tmpvar_18.x;
  tmpvar_19[0].z = tmpvar_2.x;
  tmpvar_19[1].x = tmpvar_17.y;
  tmpvar_19[1].y = tmpvar_18.y;
  tmpvar_19[1].z = tmpvar_2.y;
  tmpvar_19[2].x = tmpvar_17.z;
  tmpvar_19[2].y = tmpvar_18.z;
  tmpvar_19[2].z = tmpvar_2.z;
  vec4 v_20;
  v_20.x = _Object2World[0].x;
  v_20.y = _Object2World[1].x;
  v_20.z = _Object2World[2].x;
  v_20.w = _Object2World[3].x;
  highp vec3 tmpvar_21;
  tmpvar_21 = ((tmpvar_19 * v_20.xyz) * unity_Scale.w);
  tmpvar_8 = tmpvar_21;
  vec4 v_22;
  v_22.x = _Object2World[0].y;
  v_22.y = _Object2World[1].y;
  v_22.z = _Object2World[2].y;
  v_22.w = _Object2World[3].y;
  highp vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * v_22.xyz) * unity_Scale.w);
  tmpvar_9 = tmpvar_23;
  vec4 v_24;
  v_24.x = _Object2World[0].z;
  v_24.y = _Object2World[1].z;
  v_24.z = _Object2World[2].z;
  v_24.w = _Object2World[3].z;
  highp vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_19 * v_24.xyz) * unity_Scale.w);
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = unity_4LightPosX0.x;
  tmpvar_26.y = unity_4LightPosY0.x;
  tmpvar_26.z = unity_4LightPosZ0.x;
  mat3 tmpvar_27;
  tmpvar_27[0] = _Object2World[0].xyz;
  tmpvar_27[1] = _Object2World[1].xyz;
  tmpvar_27[2] = _Object2World[2].xyz;
  mediump vec3 lightPos_28;
  lightPos_28 = tmpvar_26;
  lowp vec3 lightColor0_29;
  lightColor0_29 = unity_LightColor[0].xyz;
  mediump float lightAttenSq_30;
  lightAttenSq_30 = unity_4LightAtten0.x;
  lowp vec3 normal_31;
  normal_31 = (tmpvar_27 * (tmpvar_2 * unity_Scale.w));
  lowp vec3 col_32;
  lowp float atten_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (lightPos_28 - posW_4);
  mediump vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  mediump float tmpvar_36;
  tmpvar_36 = ((tmpvar_35.x + tmpvar_35.y) + tmpvar_35.z);
  mediump vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_34 * normal_31);
  mediump float tmpvar_38;
  tmpvar_38 = (1.0/((1.0 + (tmpvar_36 * lightAttenSq_30))));
  atten_33 = tmpvar_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (lightColor0_29 * (max (0.0, (((tmpvar_37.x + tmpvar_37.y) + tmpvar_37.z) * inversesqrt(tmpvar_36))) * atten_33));
  col_32 = tmpvar_39;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_10;
  xlv_TEXCOORD5 = col_32;
  xlv_TEXCOORD6 = tmpvar_11;
}



#endif
#ifdef FRAGMENT

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp vec3 _GroundColor;
uniform lowp vec3 _SkyColor;
uniform lowp vec3 _RimColor;
uniform mediump float _FresnelPower;
uniform lowp float _CubeAlpha;
uniform mediump vec4 _CharaColor;
uniform lowp float _MainTexInetnsity;
uniform samplerCube _CubeTex;
uniform sampler2D _NrmTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _WorldSpaceLightPos0;
void main ()
{
  mediump vec4 color_1;
  lowp float fresnel1_2;
  lowp vec4 cubeColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _MainTexInetnsity);
  lowp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD2.x;
  tmpvar_5[0].y = xlv_TEXCOORD3.x;
  tmpvar_5[0].z = xlv_TEXCOORD4.x;
  tmpvar_5[1].x = xlv_TEXCOORD2.y;
  tmpvar_5[1].y = xlv_TEXCOORD3.y;
  tmpvar_5[1].z = xlv_TEXCOORD4.y;
  tmpvar_5[2].x = xlv_TEXCOORD2.z;
  tmpvar_5[2].y = xlv_TEXCOORD3.z;
  tmpvar_5[2].z = xlv_TEXCOORD4.z;
  lowp vec3 tmpvar_6;
  tmpvar_6 = normalize((tmpvar_5 * (texture2D (_NrmTex, xlv_TEXCOORD0).xyz - 0.5)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = (clamp (dot (tmpvar_6, _WorldSpaceLightPos0.xyz), 0.0, 1.0) * _LightColor0.xyz);
  lowp float tmpvar_8;
  tmpvar_8 = clamp ((1.0 - dot (xlv_TEXCOORD1.xyz, tmpvar_6)), 0.0, 1.0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = (_RimColor * (clamp ((tmpvar_8 - xlv_TEXCOORD1.w), 0.0, 1.0) * xlv_TEXCOORD6.w));
  lowp vec3 i_10;
  i_10 = -(xlv_TEXCOORD1.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = textureCube (_CubeTex, (i_10 - (2.0 * (dot (tmpvar_6, i_10) * tmpvar_6))));
  cubeColor_3.w = tmpvar_11.w;
  lowp vec3 tmpvar_12;
  tmpvar_12 = mix (_GroundColor, _SkyColor, vec3(((tmpvar_6.y + 1.0) * 0.5)));
  mediump float tmpvar_13;
  tmpvar_13 = pow (tmpvar_8, _FresnelPower);
  fresnel1_2 = tmpvar_13;
  cubeColor_3.xyz = ((tmpvar_11.xyz * fresnel1_2) * _CubeAlpha);
  color_1 = tmpvar_4;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (color_1 * _CharaColor);
  color_1.w = tmpvar_14.w;
  color_1.xyz = (tmpvar_14.xyz * ((tmpvar_12 + tmpvar_7) + xlv_TEXCOORD5));
  color_1.xyz = (color_1.xyz + (tmpvar_9 + cubeColor_3.xyz));
  gl_FragData[0] = color_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp float _RimRange;
uniform mediump vec4 _MainTex_ST;
uniform highp vec4 unity_Scale;
uniform highp mat4 _Object2World;

uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  mediump vec3 binormal_3;
  mediump vec3 posW_4;
  mediump vec4 tmpvar_5;
  lowp vec2 tmpvar_6;
  lowp vec4 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp vec3 tmpvar_10;
  lowp vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_5 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Object2World * _glesVertex).xyz;
  posW_4 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((_WorldSpaceCameraPos - posW_4));
  tmpvar_7.xyz = tmpvar_15;
  tmpvar_11.xyz = normalize((tmpvar_7.xyz + _WorldSpaceLightPos0.xyz));
  tmpvar_11.w = (1.0/((1.0 - _RimRange)));
  tmpvar_7.w = _RimRange;
  highp vec3 tmpvar_16;
  tmpvar_16 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  binormal_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_17 = tmpvar_1.xyz;
  tmpvar_18 = binormal_3;
  highp mat3 tmpvar_19;
  tmpvar_19[0].x = tmpvar_17.x;
  tmpvar_19[0].y = tmpvar_18.x;
  tmpvar_19[0].z = tmpvar_2.x;
  tmpvar_19[1].x = tmpvar_17.y;
  tmpvar_19[1].y = tmpvar_18.y;
  tmpvar_19[1].z = tmpvar_2.y;
  tmpvar_19[2].x = tmpvar_17.z;
  tmpvar_19[2].y = tmpvar_18.z;
  tmpvar_19[2].z = tmpvar_2.z;
  vec4 v_20;
  v_20.x = _Object2World[0].x;
  v_20.y = _Object2World[1].x;
  v_20.z = _Object2World[2].x;
  v_20.w = _Object2World[3].x;
  highp vec3 tmpvar_21;
  tmpvar_21 = ((tmpvar_19 * v_20.xyz) * unity_Scale.w);
  tmpvar_8 = tmpvar_21;
  vec4 v_22;
  v_22.x = _Object2World[0].y;
  v_22.y = _Object2World[1].y;
  v_22.z = _Object2World[2].y;
  v_22.w = _Object2World[3].y;
  highp vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * v_22.xyz) * unity_Scale.w);
  tmpvar_9 = tmpvar_23;
  vec4 v_24;
  v_24.x = _Object2World[0].z;
  v_24.y = _Object2World[1].z;
  v_24.z = _Object2World[2].z;
  v_24.w = _Object2World[3].z;
  highp vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_19 * v_24.xyz) * unity_Scale.w);
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = unity_4LightPosX0.x;
  tmpvar_26.y = unity_4LightPosY0.x;
  tmpvar_26.z = unity_4LightPosZ0.x;
  mat3 tmpvar_27;
  tmpvar_27[0] = _Object2World[0].xyz;
  tmpvar_27[1] = _Object2World[1].xyz;
  tmpvar_27[2] = _Object2World[2].xyz;
  mediump vec3 lightPos_28;
  lightPos_28 = tmpvar_26;
  lowp vec3 lightColor0_29;
  lightColor0_29 = unity_LightColor[0].xyz;
  mediump float lightAttenSq_30;
  lightAttenSq_30 = unity_4LightAtten0.x;
  lowp vec3 normal_31;
  normal_31 = (tmpvar_27 * (tmpvar_2 * unity_Scale.w));
  lowp vec3 col_32;
  lowp float atten_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (lightPos_28 - posW_4);
  mediump vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  mediump float tmpvar_36;
  tmpvar_36 = ((tmpvar_35.x + tmpvar_35.y) + tmpvar_35.z);
  mediump vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_34 * normal_31);
  mediump float tmpvar_38;
  tmpvar_38 = (1.0/((1.0 + (tmpvar_36 * lightAttenSq_30))));
  atten_33 = tmpvar_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (lightColor0_29 * (max (0.0, (((tmpvar_37.x + tmpvar_37.y) + tmpvar_37.z) * inversesqrt(tmpvar_36))) * atten_33));
  col_32 = tmpvar_39;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_10;
  xlv_TEXCOORD5 = col_32;
  xlv_TEXCOORD6 = tmpvar_11;
}



#endif
#ifdef FRAGMENT

varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp vec3 _GroundColor;
uniform lowp vec3 _SkyColor;
uniform lowp vec3 _RimColor;
uniform mediump float _FresnelPower;
uniform lowp float _CubeAlpha;
uniform mediump vec4 _CharaColor;
uniform lowp float _MainTexInetnsity;
uniform samplerCube _CubeTex;
uniform sampler2D _NrmTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _WorldSpaceLightPos0;
void main ()
{
  mediump vec4 color_1;
  lowp float fresnel1_2;
  lowp vec4 cubeColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _MainTexInetnsity);
  lowp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD2.x;
  tmpvar_5[0].y = xlv_TEXCOORD3.x;
  tmpvar_5[0].z = xlv_TEXCOORD4.x;
  tmpvar_5[1].x = xlv_TEXCOORD2.y;
  tmpvar_5[1].y = xlv_TEXCOORD3.y;
  tmpvar_5[1].z = xlv_TEXCOORD4.y;
  tmpvar_5[2].x = xlv_TEXCOORD2.z;
  tmpvar_5[2].y = xlv_TEXCOORD3.z;
  tmpvar_5[2].z = xlv_TEXCOORD4.z;
  lowp vec3 tmpvar_6;
  tmpvar_6 = normalize((tmpvar_5 * (texture2D (_NrmTex, xlv_TEXCOORD0).xyz - 0.5)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = (clamp (dot (tmpvar_6, _WorldSpaceLightPos0.xyz), 0.0, 1.0) * _LightColor0.xyz);
  lowp float tmpvar_8;
  tmpvar_8 = clamp ((1.0 - dot (xlv_TEXCOORD1.xyz, tmpvar_6)), 0.0, 1.0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = (_RimColor * (clamp ((tmpvar_8 - xlv_TEXCOORD1.w), 0.0, 1.0) * xlv_TEXCOORD6.w));
  lowp vec3 i_10;
  i_10 = -(xlv_TEXCOORD1.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = textureCube (_CubeTex, (i_10 - (2.0 * (dot (tmpvar_6, i_10) * tmpvar_6))));
  cubeColor_3.w = tmpvar_11.w;
  lowp vec3 tmpvar_12;
  tmpvar_12 = mix (_GroundColor, _SkyColor, vec3(((tmpvar_6.y + 1.0) * 0.5)));
  mediump float tmpvar_13;
  tmpvar_13 = pow (tmpvar_8, _FresnelPower);
  fresnel1_2 = tmpvar_13;
  cubeColor_3.xyz = ((tmpvar_11.xyz * fresnel1_2) * _CubeAlpha);
  color_1 = tmpvar_4;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (color_1 * _CharaColor);
  color_1.w = tmpvar_14.w;
  color_1.xyz = (tmpvar_14.xyz * ((tmpvar_12 + tmpvar_7) + xlv_TEXCOORD5));
  color_1.xyz = (color_1.xyz + (tmpvar_9 + cubeColor_3.xyz));
  gl_FragData[0] = color_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;
varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp float _RimRange;
uniform mediump vec4 _MainTex_ST;
uniform highp vec4 unity_Scale;
uniform highp mat4 _Object2World;

uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  mediump vec3 binormal_3;
  mediump vec3 posW_4;
  mediump vec4 tmpvar_5;
  lowp vec2 tmpvar_6;
  lowp vec4 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp vec3 tmpvar_10;
  lowp vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_5 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Object2World * _glesVertex).xyz;
  posW_4 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((_WorldSpaceCameraPos - posW_4));
  tmpvar_7.xyz = tmpvar_15;
  tmpvar_11.xyz = normalize((tmpvar_7.xyz + _WorldSpaceLightPos0.xyz));
  tmpvar_11.w = (1.0/((1.0 - _RimRange)));
  tmpvar_7.w = _RimRange;
  highp vec3 tmpvar_16;
  tmpvar_16 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  binormal_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_17 = tmpvar_1.xyz;
  tmpvar_18 = binormal_3;
  highp mat3 tmpvar_19;
  tmpvar_19[0].x = tmpvar_17.x;
  tmpvar_19[0].y = tmpvar_18.x;
  tmpvar_19[0].z = tmpvar_2.x;
  tmpvar_19[1].x = tmpvar_17.y;
  tmpvar_19[1].y = tmpvar_18.y;
  tmpvar_19[1].z = tmpvar_2.y;
  tmpvar_19[2].x = tmpvar_17.z;
  tmpvar_19[2].y = tmpvar_18.z;
  tmpvar_19[2].z = tmpvar_2.z;
  vec4 v_20;
  v_20.x = _Object2World[0].x;
  v_20.y = _Object2World[1].x;
  v_20.z = _Object2World[2].x;
  v_20.w = _Object2World[3].x;
  highp vec3 tmpvar_21;
  tmpvar_21 = ((tmpvar_19 * v_20.xyz) * unity_Scale.w);
  tmpvar_8 = tmpvar_21;
  vec4 v_22;
  v_22.x = _Object2World[0].y;
  v_22.y = _Object2World[1].y;
  v_22.z = _Object2World[2].y;
  v_22.w = _Object2World[3].y;
  highp vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * v_22.xyz) * unity_Scale.w);
  tmpvar_9 = tmpvar_23;
  vec4 v_24;
  v_24.x = _Object2World[0].z;
  v_24.y = _Object2World[1].z;
  v_24.z = _Object2World[2].z;
  v_24.w = _Object2World[3].z;
  highp vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_19 * v_24.xyz) * unity_Scale.w);
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = unity_4LightPosX0.x;
  tmpvar_26.y = unity_4LightPosY0.x;
  tmpvar_26.z = unity_4LightPosZ0.x;
  mat3 tmpvar_27;
  tmpvar_27[0] = _Object2World[0].xyz;
  tmpvar_27[1] = _Object2World[1].xyz;
  tmpvar_27[2] = _Object2World[2].xyz;
  mediump vec3 lightPos_28;
  lightPos_28 = tmpvar_26;
  lowp vec3 lightColor0_29;
  lightColor0_29 = unity_LightColor[0].xyz;
  mediump float lightAttenSq_30;
  lightAttenSq_30 = unity_4LightAtten0.x;
  lowp vec3 normal_31;
  normal_31 = (tmpvar_27 * (tmpvar_2 * unity_Scale.w));
  lowp vec3 col_32;
  lowp float atten_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (lightPos_28 - posW_4);
  mediump vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  mediump float tmpvar_36;
  tmpvar_36 = ((tmpvar_35.x + tmpvar_35.y) + tmpvar_35.z);
  mediump vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_34 * normal_31);
  mediump float tmpvar_38;
  tmpvar_38 = (1.0/((1.0 + (tmpvar_36 * lightAttenSq_30))));
  atten_33 = tmpvar_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (lightColor0_29 * (max (0.0, (((tmpvar_37.x + tmpvar_37.y) + tmpvar_37.z) * inversesqrt(tmpvar_36))) * atten_33));
  col_32 = tmpvar_39;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_10;
  xlv_TEXCOORD5 = col_32;
  xlv_TEXCOORD6 = tmpvar_11;
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp vec3 _GroundColor;
uniform lowp vec3 _SkyColor;
uniform lowp vec3 _RimColor;
uniform mediump float _FresnelPower;
uniform lowp float _CubeAlpha;
uniform mediump vec4 _CharaColor;
uniform lowp float _MainTexInetnsity;
uniform samplerCube _CubeTex;
uniform sampler2D _NrmTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _WorldSpaceLightPos0;
void main ()
{
  mediump vec4 color_1;
  lowp float fresnel1_2;
  lowp vec4 cubeColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _MainTexInetnsity);
  lowp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD2.x;
  tmpvar_5[0].y = xlv_TEXCOORD3.x;
  tmpvar_5[0].z = xlv_TEXCOORD4.x;
  tmpvar_5[1].x = xlv_TEXCOORD2.y;
  tmpvar_5[1].y = xlv_TEXCOORD3.y;
  tmpvar_5[1].z = xlv_TEXCOORD4.y;
  tmpvar_5[2].x = xlv_TEXCOORD2.z;
  tmpvar_5[2].y = xlv_TEXCOORD3.z;
  tmpvar_5[2].z = xlv_TEXCOORD4.z;
  lowp vec3 tmpvar_6;
  tmpvar_6 = normalize((tmpvar_5 * (texture2D (_NrmTex, xlv_TEXCOORD0).xyz - 0.5)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = (clamp (dot (tmpvar_6, _WorldSpaceLightPos0.xyz), 0.0, 1.0) * _LightColor0.xyz);
  lowp float tmpvar_8;
  tmpvar_8 = clamp ((1.0 - dot (xlv_TEXCOORD1.xyz, tmpvar_6)), 0.0, 1.0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = (_RimColor * (clamp ((tmpvar_8 - xlv_TEXCOORD1.w), 0.0, 1.0) * xlv_TEXCOORD6.w));
  lowp vec3 i_10;
  i_10 = -(xlv_TEXCOORD1.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = textureCube (_CubeTex, (i_10 - (2.0 * (dot (tmpvar_6, i_10) * tmpvar_6))));
  cubeColor_3.w = tmpvar_11.w;
  lowp vec3 tmpvar_12;
  tmpvar_12 = mix (_GroundColor, _SkyColor, vec3(((tmpvar_6.y + 1.0) * 0.5)));
  mediump float tmpvar_13;
  tmpvar_13 = pow (tmpvar_8, _FresnelPower);
  fresnel1_2 = tmpvar_13;
  cubeColor_3.xyz = ((tmpvar_11.xyz * fresnel1_2) * _CubeAlpha);
  color_1 = tmpvar_4;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (color_1 * _CharaColor);
  color_1.w = tmpvar_14.w;
  color_1.xyz = (tmpvar_14.xyz * ((tmpvar_12 + tmpvar_7) + xlv_TEXCOORD5));
  color_1.xyz = (color_1.xyz + (tmpvar_9 + cubeColor_3.xyz));
  gl_FragData[0] = color_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;
varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp float _RimRange;
uniform mediump vec4 _MainTex_ST;
uniform highp vec4 unity_Scale;
uniform highp mat4 _Object2World;

uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  mediump vec3 binormal_3;
  mediump vec3 posW_4;
  mediump vec4 tmpvar_5;
  lowp vec2 tmpvar_6;
  lowp vec4 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp vec3 tmpvar_10;
  lowp vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_5 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Object2World * _glesVertex).xyz;
  posW_4 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((_WorldSpaceCameraPos - posW_4));
  tmpvar_7.xyz = tmpvar_15;
  tmpvar_11.xyz = normalize((tmpvar_7.xyz + _WorldSpaceLightPos0.xyz));
  tmpvar_11.w = (1.0/((1.0 - _RimRange)));
  tmpvar_7.w = _RimRange;
  highp vec3 tmpvar_16;
  tmpvar_16 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  binormal_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_17 = tmpvar_1.xyz;
  tmpvar_18 = binormal_3;
  highp mat3 tmpvar_19;
  tmpvar_19[0].x = tmpvar_17.x;
  tmpvar_19[0].y = tmpvar_18.x;
  tmpvar_19[0].z = tmpvar_2.x;
  tmpvar_19[1].x = tmpvar_17.y;
  tmpvar_19[1].y = tmpvar_18.y;
  tmpvar_19[1].z = tmpvar_2.y;
  tmpvar_19[2].x = tmpvar_17.z;
  tmpvar_19[2].y = tmpvar_18.z;
  tmpvar_19[2].z = tmpvar_2.z;
  vec4 v_20;
  v_20.x = _Object2World[0].x;
  v_20.y = _Object2World[1].x;
  v_20.z = _Object2World[2].x;
  v_20.w = _Object2World[3].x;
  highp vec3 tmpvar_21;
  tmpvar_21 = ((tmpvar_19 * v_20.xyz) * unity_Scale.w);
  tmpvar_8 = tmpvar_21;
  vec4 v_22;
  v_22.x = _Object2World[0].y;
  v_22.y = _Object2World[1].y;
  v_22.z = _Object2World[2].y;
  v_22.w = _Object2World[3].y;
  highp vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * v_22.xyz) * unity_Scale.w);
  tmpvar_9 = tmpvar_23;
  vec4 v_24;
  v_24.x = _Object2World[0].z;
  v_24.y = _Object2World[1].z;
  v_24.z = _Object2World[2].z;
  v_24.w = _Object2World[3].z;
  highp vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_19 * v_24.xyz) * unity_Scale.w);
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = unity_4LightPosX0.x;
  tmpvar_26.y = unity_4LightPosY0.x;
  tmpvar_26.z = unity_4LightPosZ0.x;
  mat3 tmpvar_27;
  tmpvar_27[0] = _Object2World[0].xyz;
  tmpvar_27[1] = _Object2World[1].xyz;
  tmpvar_27[2] = _Object2World[2].xyz;
  mediump vec3 lightPos_28;
  lightPos_28 = tmpvar_26;
  lowp vec3 lightColor0_29;
  lightColor0_29 = unity_LightColor[0].xyz;
  mediump float lightAttenSq_30;
  lightAttenSq_30 = unity_4LightAtten0.x;
  lowp vec3 normal_31;
  normal_31 = (tmpvar_27 * (tmpvar_2 * unity_Scale.w));
  lowp vec3 col_32;
  lowp float atten_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (lightPos_28 - posW_4);
  mediump vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  mediump float tmpvar_36;
  tmpvar_36 = ((tmpvar_35.x + tmpvar_35.y) + tmpvar_35.z);
  mediump vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_34 * normal_31);
  mediump float tmpvar_38;
  tmpvar_38 = (1.0/((1.0 + (tmpvar_36 * lightAttenSq_30))));
  atten_33 = tmpvar_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (lightColor0_29 * (max (0.0, (((tmpvar_37.x + tmpvar_37.y) + tmpvar_37.z) * inversesqrt(tmpvar_36))) * atten_33));
  col_32 = tmpvar_39;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_10;
  xlv_TEXCOORD5 = col_32;
  xlv_TEXCOORD6 = tmpvar_11;
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp vec3 _GroundColor;
uniform lowp vec3 _SkyColor;
uniform lowp vec3 _RimColor;
uniform mediump float _FresnelPower;
uniform lowp float _CubeAlpha;
uniform mediump vec4 _CharaColor;
uniform lowp float _MainTexInetnsity;
uniform samplerCube _CubeTex;
uniform sampler2D _NrmTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _WorldSpaceLightPos0;
void main ()
{
  mediump vec4 color_1;
  lowp float fresnel1_2;
  lowp vec4 cubeColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _MainTexInetnsity);
  lowp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD2.x;
  tmpvar_5[0].y = xlv_TEXCOORD3.x;
  tmpvar_5[0].z = xlv_TEXCOORD4.x;
  tmpvar_5[1].x = xlv_TEXCOORD2.y;
  tmpvar_5[1].y = xlv_TEXCOORD3.y;
  tmpvar_5[1].z = xlv_TEXCOORD4.y;
  tmpvar_5[2].x = xlv_TEXCOORD2.z;
  tmpvar_5[2].y = xlv_TEXCOORD3.z;
  tmpvar_5[2].z = xlv_TEXCOORD4.z;
  lowp vec3 tmpvar_6;
  tmpvar_6 = normalize((tmpvar_5 * (texture2D (_NrmTex, xlv_TEXCOORD0).xyz - 0.5)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = (clamp (dot (tmpvar_6, _WorldSpaceLightPos0.xyz), 0.0, 1.0) * _LightColor0.xyz);
  lowp float tmpvar_8;
  tmpvar_8 = clamp ((1.0 - dot (xlv_TEXCOORD1.xyz, tmpvar_6)), 0.0, 1.0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = (_RimColor * (clamp ((tmpvar_8 - xlv_TEXCOORD1.w), 0.0, 1.0) * xlv_TEXCOORD6.w));
  lowp vec3 i_10;
  i_10 = -(xlv_TEXCOORD1.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = textureCube (_CubeTex, (i_10 - (2.0 * (dot (tmpvar_6, i_10) * tmpvar_6))));
  cubeColor_3.w = tmpvar_11.w;
  lowp vec3 tmpvar_12;
  tmpvar_12 = mix (_GroundColor, _SkyColor, vec3(((tmpvar_6.y + 1.0) * 0.5)));
  mediump float tmpvar_13;
  tmpvar_13 = pow (tmpvar_8, _FresnelPower);
  fresnel1_2 = tmpvar_13;
  cubeColor_3.xyz = ((tmpvar_11.xyz * fresnel1_2) * _CubeAlpha);
  color_1 = tmpvar_4;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (color_1 * _CharaColor);
  color_1.w = tmpvar_14.w;
  color_1.xyz = (tmpvar_14.xyz * ((tmpvar_12 + tmpvar_7) + xlv_TEXCOORD5));
  color_1.xyz = (color_1.xyz + (tmpvar_9 + cubeColor_3.xyz));
  gl_FragData[0] = color_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;
varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp float _RimRange;
uniform mediump vec4 _MainTex_ST;
uniform highp vec4 unity_Scale;
uniform highp mat4 _Object2World;

uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  mediump vec3 binormal_3;
  mediump vec3 posW_4;
  mediump vec4 tmpvar_5;
  lowp vec2 tmpvar_6;
  lowp vec4 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp vec3 tmpvar_10;
  lowp vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_5 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Object2World * _glesVertex).xyz;
  posW_4 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((_WorldSpaceCameraPos - posW_4));
  tmpvar_7.xyz = tmpvar_15;
  tmpvar_11.xyz = normalize((tmpvar_7.xyz + _WorldSpaceLightPos0.xyz));
  tmpvar_11.w = (1.0/((1.0 - _RimRange)));
  tmpvar_7.w = _RimRange;
  highp vec3 tmpvar_16;
  tmpvar_16 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  binormal_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_17 = tmpvar_1.xyz;
  tmpvar_18 = binormal_3;
  highp mat3 tmpvar_19;
  tmpvar_19[0].x = tmpvar_17.x;
  tmpvar_19[0].y = tmpvar_18.x;
  tmpvar_19[0].z = tmpvar_2.x;
  tmpvar_19[1].x = tmpvar_17.y;
  tmpvar_19[1].y = tmpvar_18.y;
  tmpvar_19[1].z = tmpvar_2.y;
  tmpvar_19[2].x = tmpvar_17.z;
  tmpvar_19[2].y = tmpvar_18.z;
  tmpvar_19[2].z = tmpvar_2.z;
  vec4 v_20;
  v_20.x = _Object2World[0].x;
  v_20.y = _Object2World[1].x;
  v_20.z = _Object2World[2].x;
  v_20.w = _Object2World[3].x;
  highp vec3 tmpvar_21;
  tmpvar_21 = ((tmpvar_19 * v_20.xyz) * unity_Scale.w);
  tmpvar_8 = tmpvar_21;
  vec4 v_22;
  v_22.x = _Object2World[0].y;
  v_22.y = _Object2World[1].y;
  v_22.z = _Object2World[2].y;
  v_22.w = _Object2World[3].y;
  highp vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * v_22.xyz) * unity_Scale.w);
  tmpvar_9 = tmpvar_23;
  vec4 v_24;
  v_24.x = _Object2World[0].z;
  v_24.y = _Object2World[1].z;
  v_24.z = _Object2World[2].z;
  v_24.w = _Object2World[3].z;
  highp vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_19 * v_24.xyz) * unity_Scale.w);
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = unity_4LightPosX0.x;
  tmpvar_26.y = unity_4LightPosY0.x;
  tmpvar_26.z = unity_4LightPosZ0.x;
  mat3 tmpvar_27;
  tmpvar_27[0] = _Object2World[0].xyz;
  tmpvar_27[1] = _Object2World[1].xyz;
  tmpvar_27[2] = _Object2World[2].xyz;
  mediump vec3 lightPos_28;
  lightPos_28 = tmpvar_26;
  lowp vec3 lightColor0_29;
  lightColor0_29 = unity_LightColor[0].xyz;
  mediump float lightAttenSq_30;
  lightAttenSq_30 = unity_4LightAtten0.x;
  lowp vec3 normal_31;
  normal_31 = (tmpvar_27 * (tmpvar_2 * unity_Scale.w));
  lowp vec3 col_32;
  lowp float atten_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (lightPos_28 - posW_4);
  mediump vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  mediump float tmpvar_36;
  tmpvar_36 = ((tmpvar_35.x + tmpvar_35.y) + tmpvar_35.z);
  mediump vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_34 * normal_31);
  mediump float tmpvar_38;
  tmpvar_38 = (1.0/((1.0 + (tmpvar_36 * lightAttenSq_30))));
  atten_33 = tmpvar_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (lightColor0_29 * (max (0.0, (((tmpvar_37.x + tmpvar_37.y) + tmpvar_37.z) * inversesqrt(tmpvar_36))) * atten_33));
  col_32 = tmpvar_39;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_10;
  xlv_TEXCOORD5 = col_32;
  xlv_TEXCOORD6 = tmpvar_11;
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp vec3 _GroundColor;
uniform lowp vec3 _SkyColor;
uniform lowp vec3 _RimColor;
uniform mediump float _FresnelPower;
uniform lowp float _CubeAlpha;
uniform mediump vec4 _CharaColor;
uniform lowp float _MainTexInetnsity;
uniform samplerCube _CubeTex;
uniform sampler2D _NrmTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _WorldSpaceLightPos0;
void main ()
{
  mediump vec4 color_1;
  lowp float fresnel1_2;
  lowp vec4 cubeColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _MainTexInetnsity);
  lowp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD2.x;
  tmpvar_5[0].y = xlv_TEXCOORD3.x;
  tmpvar_5[0].z = xlv_TEXCOORD4.x;
  tmpvar_5[1].x = xlv_TEXCOORD2.y;
  tmpvar_5[1].y = xlv_TEXCOORD3.y;
  tmpvar_5[1].z = xlv_TEXCOORD4.y;
  tmpvar_5[2].x = xlv_TEXCOORD2.z;
  tmpvar_5[2].y = xlv_TEXCOORD3.z;
  tmpvar_5[2].z = xlv_TEXCOORD4.z;
  lowp vec3 tmpvar_6;
  tmpvar_6 = normalize((tmpvar_5 * (texture2D (_NrmTex, xlv_TEXCOORD0).xyz - 0.5)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = (clamp (dot (tmpvar_6, _WorldSpaceLightPos0.xyz), 0.0, 1.0) * _LightColor0.xyz);
  lowp float tmpvar_8;
  tmpvar_8 = clamp ((1.0 - dot (xlv_TEXCOORD1.xyz, tmpvar_6)), 0.0, 1.0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = (_RimColor * (clamp ((tmpvar_8 - xlv_TEXCOORD1.w), 0.0, 1.0) * xlv_TEXCOORD6.w));
  lowp vec3 i_10;
  i_10 = -(xlv_TEXCOORD1.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = textureCube (_CubeTex, (i_10 - (2.0 * (dot (tmpvar_6, i_10) * tmpvar_6))));
  cubeColor_3.w = tmpvar_11.w;
  lowp vec3 tmpvar_12;
  tmpvar_12 = mix (_GroundColor, _SkyColor, vec3(((tmpvar_6.y + 1.0) * 0.5)));
  mediump float tmpvar_13;
  tmpvar_13 = pow (tmpvar_8, _FresnelPower);
  fresnel1_2 = tmpvar_13;
  cubeColor_3.xyz = ((tmpvar_11.xyz * fresnel1_2) * _CubeAlpha);
  color_1 = tmpvar_4;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (color_1 * _CharaColor);
  color_1.w = tmpvar_14.w;
  color_1.xyz = (tmpvar_14.xyz * ((tmpvar_12 + tmpvar_7) + xlv_TEXCOORD5));
  color_1.xyz = (color_1.xyz + (tmpvar_9 + cubeColor_3.xyz));
  gl_FragData[0] = color_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;
varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp float _RimRange;
uniform mediump vec4 _MainTex_ST;
uniform highp vec4 unity_Scale;
uniform highp mat4 _Object2World;

uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  mediump vec3 binormal_3;
  mediump vec3 posW_4;
  mediump vec4 tmpvar_5;
  lowp vec2 tmpvar_6;
  lowp vec4 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp vec3 tmpvar_10;
  lowp vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_5 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_6 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (_Object2World * _glesVertex).xyz;
  posW_4 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((_WorldSpaceCameraPos - posW_4));
  tmpvar_7.xyz = tmpvar_15;
  tmpvar_11.xyz = normalize((tmpvar_7.xyz + _WorldSpaceLightPos0.xyz));
  tmpvar_11.w = (1.0/((1.0 - _RimRange)));
  tmpvar_7.w = _RimRange;
  highp vec3 tmpvar_16;
  tmpvar_16 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  binormal_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_17 = tmpvar_1.xyz;
  tmpvar_18 = binormal_3;
  highp mat3 tmpvar_19;
  tmpvar_19[0].x = tmpvar_17.x;
  tmpvar_19[0].y = tmpvar_18.x;
  tmpvar_19[0].z = tmpvar_2.x;
  tmpvar_19[1].x = tmpvar_17.y;
  tmpvar_19[1].y = tmpvar_18.y;
  tmpvar_19[1].z = tmpvar_2.y;
  tmpvar_19[2].x = tmpvar_17.z;
  tmpvar_19[2].y = tmpvar_18.z;
  tmpvar_19[2].z = tmpvar_2.z;
  vec4 v_20;
  v_20.x = _Object2World[0].x;
  v_20.y = _Object2World[1].x;
  v_20.z = _Object2World[2].x;
  v_20.w = _Object2World[3].x;
  highp vec3 tmpvar_21;
  tmpvar_21 = ((tmpvar_19 * v_20.xyz) * unity_Scale.w);
  tmpvar_8 = tmpvar_21;
  vec4 v_22;
  v_22.x = _Object2World[0].y;
  v_22.y = _Object2World[1].y;
  v_22.z = _Object2World[2].y;
  v_22.w = _Object2World[3].y;
  highp vec3 tmpvar_23;
  tmpvar_23 = ((tmpvar_19 * v_22.xyz) * unity_Scale.w);
  tmpvar_9 = tmpvar_23;
  vec4 v_24;
  v_24.x = _Object2World[0].z;
  v_24.y = _Object2World[1].z;
  v_24.z = _Object2World[2].z;
  v_24.w = _Object2World[3].z;
  highp vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_19 * v_24.xyz) * unity_Scale.w);
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = unity_4LightPosX0.x;
  tmpvar_26.y = unity_4LightPosY0.x;
  tmpvar_26.z = unity_4LightPosZ0.x;
  mat3 tmpvar_27;
  tmpvar_27[0] = _Object2World[0].xyz;
  tmpvar_27[1] = _Object2World[1].xyz;
  tmpvar_27[2] = _Object2World[2].xyz;
  mediump vec3 lightPos_28;
  lightPos_28 = tmpvar_26;
  lowp vec3 lightColor0_29;
  lightColor0_29 = unity_LightColor[0].xyz;
  mediump float lightAttenSq_30;
  lightAttenSq_30 = unity_4LightAtten0.x;
  lowp vec3 normal_31;
  normal_31 = (tmpvar_27 * (tmpvar_2 * unity_Scale.w));
  lowp vec3 col_32;
  lowp float atten_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (lightPos_28 - posW_4);
  mediump vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  mediump float tmpvar_36;
  tmpvar_36 = ((tmpvar_35.x + tmpvar_35.y) + tmpvar_35.z);
  mediump vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_34 * normal_31);
  mediump float tmpvar_38;
  tmpvar_38 = (1.0/((1.0 + (tmpvar_36 * lightAttenSq_30))));
  atten_33 = tmpvar_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (lightColor0_29 * (max (0.0, (((tmpvar_37.x + tmpvar_37.y) + tmpvar_37.z) * inversesqrt(tmpvar_36))) * atten_33));
  col_32 = tmpvar_39;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_10;
  xlv_TEXCOORD5 = col_32;
  xlv_TEXCOORD6 = tmpvar_11;
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
varying lowp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying lowp vec2 xlv_TEXCOORD0;
uniform lowp vec3 _GroundColor;
uniform lowp vec3 _SkyColor;
uniform lowp vec3 _RimColor;
uniform mediump float _FresnelPower;
uniform lowp float _CubeAlpha;
uniform mediump vec4 _CharaColor;
uniform lowp float _MainTexInetnsity;
uniform samplerCube _CubeTex;
uniform sampler2D _NrmTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _WorldSpaceLightPos0;
void main ()
{
  mediump vec4 color_1;
  lowp float fresnel1_2;
  lowp vec4 cubeColor_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = (texture2D (_MainTex, xlv_TEXCOORD0) * _MainTexInetnsity);
  lowp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD2.x;
  tmpvar_5[0].y = xlv_TEXCOORD3.x;
  tmpvar_5[0].z = xlv_TEXCOORD4.x;
  tmpvar_5[1].x = xlv_TEXCOORD2.y;
  tmpvar_5[1].y = xlv_TEXCOORD3.y;
  tmpvar_5[1].z = xlv_TEXCOORD4.y;
  tmpvar_5[2].x = xlv_TEXCOORD2.z;
  tmpvar_5[2].y = xlv_TEXCOORD3.z;
  tmpvar_5[2].z = xlv_TEXCOORD4.z;
  lowp vec3 tmpvar_6;
  tmpvar_6 = normalize((tmpvar_5 * (texture2D (_NrmTex, xlv_TEXCOORD0).xyz - 0.5)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = (clamp (dot (tmpvar_6, _WorldSpaceLightPos0.xyz), 0.0, 1.0) * _LightColor0.xyz);
  lowp float tmpvar_8;
  tmpvar_8 = clamp ((1.0 - dot (xlv_TEXCOORD1.xyz, tmpvar_6)), 0.0, 1.0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = (_RimColor * (clamp ((tmpvar_8 - xlv_TEXCOORD1.w), 0.0, 1.0) * xlv_TEXCOORD6.w));
  lowp vec3 i_10;
  i_10 = -(xlv_TEXCOORD1.xyz);
  lowp vec4 tmpvar_11;
  tmpvar_11 = textureCube (_CubeTex, (i_10 - (2.0 * (dot (tmpvar_6, i_10) * tmpvar_6))));
  cubeColor_3.w = tmpvar_11.w;
  lowp vec3 tmpvar_12;
  tmpvar_12 = mix (_GroundColor, _SkyColor, vec3(((tmpvar_6.y + 1.0) * 0.5)));
  mediump float tmpvar_13;
  tmpvar_13 = pow (tmpvar_8, _FresnelPower);
  fresnel1_2 = tmpvar_13;
  cubeColor_3.xyz = ((tmpvar_11.xyz * fresnel1_2) * _CubeAlpha);
  color_1 = tmpvar_4;
  mediump vec4 tmpvar_14;
  tmpvar_14 = (color_1 * _CharaColor);
  color_1.w = tmpvar_14.w;
  color_1.xyz = (tmpvar_14.xyz * ((tmpvar_12 + tmpvar_7) + xlv_TEXCOORD5));
  color_1.xyz = (color_1.xyz + (tmpvar_9 + cubeColor_3.xyz));
  gl_FragData[0] = color_1;
}



#endif"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
}
 }
 Pass {
  Tags { "LIGHTMODE"="SHADOWCASTER" "QUEUE"="Geometry" "RenderType"="Opaque" }
Program "vp" {
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;


uniform highp vec4 unity_LightShadowBias;
attribute vec4 _glesVertex;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_1.xyw = tmpvar_2.xyw;
  tmpvar_1.z = (tmpvar_2.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_2.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;


uniform highp vec4 unity_LightShadowBias;
attribute vec4 _glesVertex;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_1.xyw = tmpvar_2.xyw;
  tmpvar_1.z = (tmpvar_2.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_2.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;


uniform highp vec4 unity_LightShadowBias;
attribute vec4 _glesVertex;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_1.xyw = tmpvar_2.xyw;
  tmpvar_1.z = (tmpvar_2.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_2.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;


uniform highp vec4 unity_LightShadowBias;
attribute vec4 _glesVertex;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_1.xyw = tmpvar_2.xyw;
  tmpvar_1.z = (tmpvar_2.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_2.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;


uniform highp vec4 unity_LightShadowBias;
attribute vec4 _glesVertex;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_1.xyw = tmpvar_2.xyw;
  tmpvar_1.z = (tmpvar_2.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_2.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;


uniform highp vec4 unity_LightShadowBias;
attribute vec4 _glesVertex;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_1.xyw = tmpvar_2.xyw;
  tmpvar_1.z = (tmpvar_2.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_2.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;


uniform highp vec4 unity_LightShadowBias;
attribute vec4 _glesVertex;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_1.xyw = tmpvar_2.xyw;
  tmpvar_1.z = (tmpvar_2.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_2.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;


uniform highp vec4 unity_LightShadowBias;
attribute vec4 _glesVertex;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_1.xyw = tmpvar_2.xyw;
  tmpvar_1.z = (tmpvar_2.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_2.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable

#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightShadowBias;
attribute vec4 _glesVertex;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_1.xyw = tmpvar_2.xyw;
  tmpvar_1.z = (tmpvar_2.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_2.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable

#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightShadowBias;
attribute vec4 _glesVertex;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_1.xyw = tmpvar_2.xyw;
  tmpvar_1.z = (tmpvar_2.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_2.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable

#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightShadowBias;
attribute vec4 _glesVertex;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_1.xyw = tmpvar_2.xyw;
  tmpvar_1.z = (tmpvar_2.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_2.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable

#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightShadowBias;
attribute vec4 _glesVertex;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_1.xyw = tmpvar_2.xyw;
  tmpvar_1.z = (tmpvar_2.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_2.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
}
 }
}
Fallback "lv5Common/Texture"
}
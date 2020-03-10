
import 'package:flutter/material.dart';

const _musicLightColor =  Color.fromRGBO(241, 243, 246, 1.0);

const _musicTextColor =   Color.fromRGBO(92, 122, 170, 1.0);

const _musicShadowColor =  Color.fromRGBO(225, 234, 242, 1.0);

const _musicGoldenColor =  Color.fromRGBO(170, 147, 92, 1.0);

const _musicDarkColor =  Color.fromRGBO(45, 52, 60, 1.0);

const _musicThemes = <Color>[

  _musicLightColor, //白天模式

  _musicDarkColor //暗黑模式

];


class MusicGlobal {


  static Color get light => _musicLightColor;

  static Color get dart => _musicDarkColor;

  //文本、icon 颜色
  static Color get textColor =>  _musicTextColor;

  //阴影颜色
  static Color get shadowColor =>  _musicShadowColor;

  //金色
  static Color get goldenColor =>  _musicGoldenColor;




  //可选主题列表
  static List<Color> get themes => _musicThemes;



}
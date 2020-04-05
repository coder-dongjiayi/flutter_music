
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_music/http_request/http_request_manager.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_music/models/user_model.dart';
export 'package:flutter_music/routers/router_page_name.dart';

const _musicLightColor =  Color.fromRGBO(241, 243, 246, 1.0);

const _lightMusicTextColor =   Color.fromRGBO(92, 122, 170, 1.0);
const _darkMusicTextColor =   Color.fromRGBO(179, 217, 226, 1.0);

const _musicSubTitleColor = Color.fromRGBO(162, 173, 190, 1.0);

const _lightMusicShadowColor =  Color.fromRGBO(225, 234, 242, 1.0);

const _darMusicShadowColor =  Color.fromRGBO(38, 43, 50, 1.0);

const _lightTopShadowColor = Color.fromRGBO(255, 255, 255, 1.0);

const _darkTopShadowColor  = Color.fromRGBO(54, 63, 69, 1.0);

const _musicGoldenColor =  Color.fromRGBO(170, 147, 92, 1.0);

const _musicDarkColor =  Color.fromRGBO(44, 53, 60, 1.0);

const _musicThemes = <Color>[

  _musicLightColor, //白天模式

  _musicDarkColor //暗黑模式

];


class MusicGlobal {

  static const String LOGIN_USERINFO_KEY = "login_userinfo_key";
  static const String THEME_COLOR_KEY ="theme_color_key";
  static const String VIBRATE_KEY = "vibrate_key";


  static Color get light => _musicLightColor;

  static Color get dark => _musicDarkColor;


  static bool isVibrate = true;

  static Color theme = light;

  //文本、icon 颜色
  static Color get lightTitleColor =>  _lightMusicTextColor;

  static Color get darkTitleColor => _darkMusicTextColor;

  //副标题
  static Color get subTitleColor => _musicSubTitleColor;

  //阴影颜色
  static Color get lightBottomShadowColor =>  _lightMusicShadowColor;

  static Color get lightTopShadowColor => _lightTopShadowColor;

  static Color get darkTopShadowColor => _darkTopShadowColor;
  
  static Color get darkBottomShadowColor =>  _darMusicShadowColor;


  //金色
  static Color get goldenColor =>  _musicGoldenColor;


  //可选主题列表
  static List<Color> get themes => _musicThemes;


  static SharedPreferences _userPreferences;

  static UserModel userModel;


    static Future init() async {


      _userPreferences = await SharedPreferences.getInstance();

      var userInfo = _userPreferences.getString(LOGIN_USERINFO_KEY);


      /// step1  读取用户信息
      if(userInfo != null){

       Map result = json.decode(userInfo);

        userModel = UserModel.fromJson(result);

        HttpRequestManager.instance.registerPublicParams(
            {"uid":userModel.userId,"token":userModel.token}
            );
      }
      String themeInfo = _userPreferences.getString(THEME_COLOR_KEY);

      /// step2 读取主题信息
      if(themeInfo != null){
        theme = themeInfo == "light" ? light : dark;
      }


      /// stpe3 是否有触摸反馈
      bool _isVibrate = _userPreferences.getBool(VIBRATE_KEY);
      if(_isVibrate != null){
        isVibrate =  _isVibrate;
      }

     }
     /// 保存主题信息
     static saveTheme(Color color){
       _userPreferences.setString(THEME_COLOR_KEY, color == light ? "light" : "dark");
     }

     /// 保存用户信息
    static saveUserInfo(UserModel userModel) {

      HttpRequestManager.instance.registerPublicParams(
          {"uid":userModel.userId,"token":userModel.token}
      );

      _userPreferences.setString(LOGIN_USERINFO_KEY, userModel.toJson()).whenComplete((){

       });

    }
    /// 保存震动反馈信息

    static saveVibrateInfo(bool vibrate){


      isVibrate = vibrate;
      _userPreferences.setBool(VIBRATE_KEY, vibrate).whenComplete((){

      });
    }

    /// 退出登录
    static logout(){
      userModel = null;
      _userPreferences.remove(LOGIN_USERINFO_KEY);
    }



}
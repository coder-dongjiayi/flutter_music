
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_music/common/music_global.dart';

class ThemeState extends ChangeNotifier{



  Color _theme = MusicGlobal.theme;

  bool  get isDarkTheme => _theme ==  MusicGlobal.light ? false : true;

  Color get theme => _theme;

  Color get indicatorColor{
    if(theme == MusicGlobal.light){
      return Color(0xFF3C3C44);
    }
    return Colors.white;
  }

  Color get titleColor{
    if(theme == MusicGlobal.light){
      return MusicGlobal.lightTitleColor;
    }
    return MusicGlobal.darkTitleColor;
  }

  Color get bottomShadowColor {
    if(theme== MusicGlobal.light){
      return MusicGlobal.lightBottomShadowColor;
    }
    return MusicGlobal.darkBottomShadowColor;
  }

  Color get topShadowColor{
    if(theme == MusicGlobal.light){
      return MusicGlobal.lightTopShadowColor;
    }
    return MusicGlobal.darkTopShadowColor;
  }
  Color get textFieldColor{
    if(theme == MusicGlobal.light){
      return Color.fromRGBO(0, 0, 0, 1.0);
    }
    return Color.fromRGBO(255, 255, 255, 1.0);
  }


  Color get tabItemNormalColor{
    if(theme == MusicGlobal.light){
      return Color.fromRGBO(222, 227, 233, 1.0);
    }
    return MusicGlobal.darkTitleColor;
  }

  Color get tabItemSelectedColor{
    if(theme == MusicGlobal.light){
       return MusicGlobal.lightTitleColor;
    }
    return MusicGlobal.goldenColor;
  }

  Color get sliderColor{
    if(theme == MusicGlobal.light){
      return Color.fromRGBO(151, 160, 235, 1.0);
    }
    return Colors.red;
  }
  Color get sliderThemeColor{
    if(theme == MusicGlobal.light){
      return Color.fromRGBO(151, 160, 235, 1.0);
    }
    return Colors.white;
  }
  Color get sliderOverlayColor{
    if(theme == MusicGlobal.light){
      return Colors.white;
    }
    return Colors.red;
  }
  Color get subtTitleColor =>  MusicGlobal.subTitleColor;

  Color get goldenColor =>  MusicGlobal.goldenColor;


  switchTheme(){
    if(_theme == MusicGlobal.light){
      _theme = MusicGlobal.dark;
    }else{
      _theme = MusicGlobal.light;
    }
    MusicGlobal.saveTheme(_theme);

    notifyListeners();
  }




  static ThemeState of(context){

        return Provider.of<ThemeState>(context,listen: false);
  }

}
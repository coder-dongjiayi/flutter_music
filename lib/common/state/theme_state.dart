import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_music/common/profile_change_notifier.dart';
import 'package:flutter_music/common/music_global.dart';

class ThemeState extends ProfileChangeNotifiter{



  Color get theme => profile.theme ?? MusicGlobal.light;

  Color get titleColor => profile.titleColor ?? MusicGlobal.titleColor;

  Color get shadowColor => profile.shadowColor ?? MusicGlobal.shadowColor;

  Color get subtTitleColor => profile.subtTitleColor ?? MusicGlobal.subTitleColor;

  Color get goldenColor => profile.goldenColor ?? MusicGlobal.goldenColor;

  setTheme(Color color){
    if(color != theme){
         profile.theme = color;
    }
    notifyListeners();
  }



   ThemeState of(context,{bool listen = true}){

        return Provider.of<ThemeState>(context,listen: listen);
  }

}
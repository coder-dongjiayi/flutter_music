
import 'package:flutter/cupertino.dart';

import 'package:flutter_music/common/music_profile.dart';
import 'package:flutter_music/common/music_global.dart';
class ProfileChangeNotifiter extends ChangeNotifier{

  MusicProfile get profile =>  MusicGlobal.profile;
  @override
  void notifyListeners() {

    MusicGlobal.saveProfile();

    super.notifyListeners();
  }

}
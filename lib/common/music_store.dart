

import 'package:flutter/cupertino.dart';
import 'package:flutter_music/common/music_global.dart';
import 'package:flutter_music/common/state/music_global_play_list_state.dart';
import 'package:flutter_music/common/state/theme_state.dart';
import 'package:flutter_music/common/state/user_state.dart';
export 'package:provider/provider.dart';

export 'package:cached_network_image/cached_network_image.dart';
export 'package:flutter_music/common/screen_adapter.dart';
export 'package:flutter_music/public_widget/music_gestureDetector.dart';
export 'package:flutter_music/common/state/music_global_play_list_state.dart';
export 'package:flutter_music/base_music/music_scaffold.dart';
export 'package:flutter_music/routers/router_page_name.dart';
export 'package:flutter_music/common/state/music_global_play_list_state.dart';
export 'package:flutter_music/common/dialog/loading_dialog.dart';
export 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
export 'package:flutter_music/common/state/user_state.dart';


class MusicStore {

  static  ThemeState  Theme(context) =>  ThemeState.of(context);

  static  UserSate User(context) => UserSate.of(context);


  static  bool get isVibrate => MusicGlobal.isVibrate;

  static saveVibrate(bool isVibrate){
    MusicGlobal.saveVibrateInfo(isVibrate);
  }

  static List<BoxShadow> boxShow(BuildContext context,
      double top,

      double bottom){
    return [
      BoxShadow(
          color: MusicStore.Theme(context).bottomShadowColor,
          offset: Offset(bottom,bottom),
          blurRadius: bottom),
      BoxShadow(color: MusicStore.Theme(context).topShadowColor, offset: Offset(top,top), blurRadius:top.abs()*2+1.0)
    ];
  }


}
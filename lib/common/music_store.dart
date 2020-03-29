

import 'package:flutter_music/common/state/theme_state.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:flutter_music/common/screen_adapter.dart';
export 'package:flutter_music/public_widget/music_gestureDetector.dart';
export 'package:flutter_music/pages/music_play_media_page/state/music_play_list_state.dart';
export 'package:flutter_music/base_music/music_scaffold.dart';
export 'package:flutter_music/routers/router_page_name.dart';
import 'package:flutter_music/pages/music_play_media_page/state/music_play_list_state.dart';
class MusicStore {

  static  ThemeState Theme =  ThemeState();

  static MusicPlayListState   GlobalPlayList =  MusicPlayListState();


}
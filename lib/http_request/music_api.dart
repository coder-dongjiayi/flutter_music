
import 'package:flutter_music/http_request/http_request_manager.dart';
import 'package:flutter_music/models/play_list_model.dart';
import 'package:flutter_music/models/song_list_model.dart';
import 'package:flutter_music/models/track_list_model.dart';

export  'package:flutter_music/models/play_list_model.dart';
export 'package:flutter_music/models/track_list_model.dart';
export 'package:flutter_music/public_widget/future_builder_widget.dart';
class MusicApi{

/// 我的歌单
 static Future<List<PlayItemModel>>  requestPlayList() async{

    final response = await HttpRequestManager.request("/user/playlist");

    return PlayListModel.fromJson(response,"playlist").playlist;


  }


  /// 推荐更多歌单
  static Future<List<SongItemModel>> recommendMoreSongList() async{

   final response = await HttpRequestManager.request("/personalized",params: {"limit":5});

   return SongListModel.fromJson(response).songList;
 }

 /// 最新歌单
 static Future<List<PlayItemModel>> recommendNewSongList() async{

   final response = await HttpRequestManager.request(
       "/top/playlist/highquality",
       params: {"limit":2,"before":DateTime.now().millisecondsSinceEpoch
       });

   return PlayListModel.fromJson(response,"playlists").playlist;

 }

 /// 精选歌单 最热歌单
 static Future<List<PlayItemModel>> choicenessSongList({String order="new" ,int limit = 2}) async{
   final response  = await HttpRequestManager.request("/top/playlist",
     params: {"limit":limit,"order": "$order"}
   );

   return PlayListModel.fromJson(response,"playlists").playlist;
 }


 /// 新歌列表

 static Future<List<TrackItemModel>> newSongList() async{
   final response = await HttpRequestManager.request(
       "/top/list",
       params: {"idx":"0"}
       );

   return TrackListModel.fromJson(response).trackList;
 }
 ///playlist/hot





}

import 'package:flutter_music/http_request/http_request_manager.dart';
import 'package:flutter_music/models/play_list_model.dart';
import 'package:flutter_music/models/song_list_model.dart';
import 'package:flutter_music/models/track_list_model.dart';
import 'package:flutter_music/models/song_detail_model.dart';

export  'package:flutter_music/models/play_list_model.dart';
export 'package:flutter_music/models/track_list_model.dart';
export 'package:flutter_music/models/song_detail_model.dart';

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

 /// 歌单详情
 static Future<SongDetailModel> songDetail(id) async{
   final response  = await HttpRequestManager.request("/playlist/detail",
     params: {"id":id}

   );
   return SongDetailModel.fromJson(response["playlist"]);
 }

 /// 获取音乐的mp3路径
  static Future<List<TrackItemModel>> musicMp3Item(List<TrackItemModel> trackItemList) async{

    /// 1. 这个接口是 传入一组id 返回这组id 对应的歌曲url
    /// 2. 但是存在一个问题 就是返回数据的顺序不一定是按照 你传入id的顺序
    /// 3. 为了把返回的歌曲url跟歌曲信息对应上 这里使用了 map 为了最后能够 降低实际复杂度 提高效率
   Map<String,TrackItemModel> trackMap = Map();

   List<String> trackIdList = trackItemList.map((value){
     String trackId =  value.id.toString();
      trackMap[trackId] = value;
     return trackId;

    }).toList();


    String trackIds  = trackIdList.join(",");
    
    final response = await HttpRequestManager.request("/song/url",
        params: {"id":trackIds}
        );

    if(response["data"] != null){
      response["data"].forEach((v){
        MusicItemModel itemModel = MusicItemModel.fromJson(v);
        TrackItemModel trackItemModel = trackMap[itemModel.id.toString()];
        trackItemModel.musicItemModel = itemModel;
      });
    }



    return trackItemList;

  }






}
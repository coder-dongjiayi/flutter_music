
import 'package:flutter_music/http_request/http_request_manager.dart';
import 'package:flutter_music/models/play_list_model.dart';
import 'package:flutter_music/models/song_list_model.dart';
import 'package:flutter_music/models/track_list_model.dart';
import 'package:flutter_music/models/song_detail_model.dart';
import 'package:flutter_music/models/user_model.dart';
import 'package:flutter_music/models/search_hot_model.dart';
export 'package:flutter_music/models/search_hot_model.dart';

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


 /// 验证手机号是否已经注册 如果已经注册了返回nickName 否则 为null
 static Future<String> existenceMobile(String mobile) async{

   final response = await HttpRequestManager.request("/cellphone/existence/check",
       params: {"phone":mobile}
   );
   int exist = response["exist"];

   return exist == 1 ? response["nickname"] : null;

 }





 ///搜索建议
 static Future<List<Map<String,dynamic>>> searchSuggest(keyword) async{
   final response = await HttpRequestManager.request("/search/suggest",
       params: {"keywords":keyword,"type":"mobile"});

   return response["result"]["allMatch"];
 }


 /// 热搜列表
 static Future<List<SearchHotItemModel>> searchHot() async{
   final response = await HttpRequestManager.request("/search/hot/detail");

   List<SearchHotItemModel> list = SearchHotListModel.fromJson(response).hotList;

   return  list;
 }
 /// 退出登录

   static Future<int> logout() async{
      final response = await HttpRequestManager.request("/logout");
      if(response["code"] != 200){
        return 0;
      }
      return 1;
   
    }

 /// 登录接口
 static Future<UserModel> login(String mobile,String password) async {

      final response = await HttpRequestManager.request("/login/cellphone",
          params: {"phone":mobile,"password":password}
      );

      if(response["code"] != 200){
        return null;
      }
      UserModel userModel = UserModel.fromJson(response);


      return userModel;
    }
    //http://47.94.5.242:3000/search?keywords=%20%E6%B5%B7%E9%98%94%E5%A4%A9%E7%A9%BA&type=1018

 /// 获取音乐的mp3路径
  static Future<List<TrackItemModel>> musicMp3Item(List<TrackItemModel> trackItemList) async{

    /// 1. 这个接口是 传入一组id 返回这组id 对应的歌曲url
    /// 2. 但是存在一个问题 就是返回数据的顺序不一定是按照 你传入id的顺序
    /// 3. 为了把返回的歌曲url跟歌曲信息对应上 这里使用了 map 为了最后能够降低时间复杂度 提高效率
   Map<String,TrackItemModel> trackMap = Map();

   List<String> trackIdList = List<String>();

  List<TrackItemModel> exitList =   trackItemList.where((value){

    String trackId =  value.id.toString();

    trackMap[trackId] = value;

    trackIdList.add(trackId);

     return value.musicItemModel != null;
   }).toList();

  if(exitList.length == trackItemList.length){
    return trackItemList;
  }


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
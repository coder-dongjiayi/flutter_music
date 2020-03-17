
import 'package:flutter_music/http_request/http_request_manager.dart';
import 'package:flutter_music/library/play_list_model.dart';

class MusicApi{

 static Future<List<PlayItemModel>>  requestPlayList() async{

    final response = await HttpRequestManager.request("/user/playlist");

    return PlayListModel.fromJson(response).playlist;

  }
}
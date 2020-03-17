

import 'package:flutter/cupertino.dart';
import 'package:flutter_music/http_request/http_request_manager.dart';
import 'package:flutter_music/library/play_list_model.dart';
import 'package:provider/provider.dart';
class LibraryState extends ChangeNotifier{


  List<PlayItemModel> playList = [];

   Future<void>  requestPlayList() async{

     HttpRequestManager.request("/user/playlist").then((response){

       List<PlayItemModel> list =  PlayListModel.fromJson(response).playlist;
       playList = list;

     }).catchError((error){
       print("这是一个错误信息");
       print(error);
     });

  }

  //返回歌单列表
  static List<PlayItemModel> dataSource (context){

    return Provider.of<LibraryState>(context,listen: false).playList ;
  }


}
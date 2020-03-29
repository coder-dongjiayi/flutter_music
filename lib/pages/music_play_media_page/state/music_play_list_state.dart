import 'package:flutter/material.dart';
import 'package:flutter_music/models/track_list_model.dart';
import 'package:provider/provider.dart';
class MusicPlayListState extends ChangeNotifier{

  /// 当前播放列表
  List<TrackItemModel> _currentPlayList = List<TrackItemModel>();

  int _currentIndex = 0;


  int get currentIndex => _currentIndex;

  List<TrackItemModel> get currentPlayList => _currentPlayList;

  void updatePlayList(List<TrackItemModel> list,int currentIndex){

    _currentPlayList = list;
    _currentIndex  = currentIndex;
    notifyListeners();
  }



  /// 下一曲
  void nextTrack(){

    notifyListeners();
  }
  ///上一曲
  void previousTrack(){

    notifyListeners();
  }


  static MusicPlayListState musicPlayState (BuildContext context){
    return  Provider.of<MusicPlayListState>(context,listen: false);
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_music/models/track_list_model.dart';
import 'package:provider/provider.dart';
export 'package:flutter_music/models/track_list_model.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicGlobalPlayListState extends ChangeNotifier{

  AudioPlayer _advancedPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  int _currentPlayId;
  /// 当前播放列表
  List<TrackItemModel> _currentPlayList = List<TrackItemModel>();

  int _currentIndex = 0;


  int get currentIndex => _currentIndex;

  List<TrackItemModel> get currentPlayList => _currentPlayList;

  TrackItemModel get currentTrackItem => _currentPlayList[_currentIndex];


  void updatePlayList(List<TrackItemModel> list,int currentIndex){

    _currentPlayList = list;
    _currentIndex  = currentIndex;
    notifyListeners();
  }


  ///播放当前的歌曲
  void music_play(){
    _play();
  }

  /// 暂停歌曲
  void music_pause(){
    _pause();
  }
  /// 继续歌曲
  void music_resume(){
    _resume();
  }


  void _resume() async {
    int result =  await _advancedPlayer.resume();
    print(result);
  }

  void _pause() async{

    int result =  await _advancedPlayer.pause();
    print(result);
  }

  void _play() async{
    if(_currentPlayId == currentTrackItem.id) return;
    var audioUrl = currentTrackItem.musicItemModel.url;
    _currentPlayId = currentTrackItem.musicItemModel.id;
    _advancedPlayer.stop();

    int result = await _advancedPlayer.play(audioUrl,isLocal: false);
    print(result);
  }



  ///下一曲
  void music_next(){
    _nextTrack();
  }

  ///上一曲
  void music_previous(){
    _previousTrack();
  }

  void _nextTrack(){
    print("下一曲");

  }

  void _previousTrack(){

    print("上一曲");

  }


  static MusicGlobalPlayListState musicPlayState (BuildContext context){
    return  Provider.of<MusicGlobalPlayListState>(context,listen: false);
  }

}
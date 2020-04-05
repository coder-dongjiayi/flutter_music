
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_music/models/track_list_model.dart';
import 'package:provider/provider.dart';
export 'package:flutter_music/models/track_list_model.dart';
import 'package:audioplayers/audioplayers.dart';
export 'package:audioplayers/audioplayers.dart';

class MusicGlobalPlayListState extends ChangeNotifier{


  AudioPlayer _audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);


  int _currentIndex = 0;
  int _currentPlayId = 0;

  /// 当前播放列表
  List<TrackItemModel> _currentPlayList = List<TrackItemModel>();
  /// 歌曲总时长
  Duration _duration;

  /// 当前播放进度
  Duration _position;

  TargetPlatform platform;



  List<TrackItemModel> get currentPlayList => _currentPlayList;

  TrackItemModel get currentTrackItem => _currentPlayList[_currentIndex];

  var _durationText = "00:00";

  var _positionText = "00:00";


  get durationText => _durationText;

  get positionText => _positionText;

  int get currentIndex => _currentIndex;

  AudioPlayerState playerState;

  ///进度
  double  playProgress = 0.0;

  final StreamController<int> _currentIndexController = StreamController<int>.broadcast();

  final StreamController<AudioPlayerState> _playerStateController =
  StreamController<AudioPlayerState>.broadcast();

  Stream<int> get onUpdateCurrentIndex => _currentIndexController.stream;

  Stream<AudioPlayerState> get onPlayerStateChanged =>
      _playerStateController.stream;

  @override
  void dispose() {
    // TODO: implement dispose
    _playerStateController.close();
    _currentIndexController.close();
    super.dispose();
  }
  MusicGlobalPlayListState({this.platform}){

    _listenDurationChanged();

    _listenPositionChanged();

    _listenPlayerStateChanged();
  }


  void _listenPlayerStateChanged(){
    _audioPlayer.onPlayerStateChanged.listen((state) {
      playerState = state;
      _playerStateController.add(state);
     if(state == AudioPlayerState.COMPLETED){
       music_control_next();
     }
    });
  }


  void _listenDurationChanged(){
    _audioPlayer.onDurationChanged.listen((duration){
      _duration = duration;
      var durationResult = _duration?.toString()?.split('.')?.first ?? '';
      List<String> durationList =  durationResult.split(":");
      _durationText = durationList[1] + ":" + durationList[2];

      if (platform == TargetPlatform.iOS) {

        _audioPlayer.startHeadlessService();

        _audioPlayer.setNotification(
            title: currentTrackItem.name,
            artist: currentTrackItem.arList.first.name,
            albumTitle: currentTrackItem.name,
            imageUrl: currentTrackItem.al.picUrl,
            forwardSkipInterval: const Duration(seconds: 30), // default is 30s
            backwardSkipInterval: const Duration(seconds: 30), // default is 30s
            duration: duration,
            elapsedTime: Duration(seconds: 0));
      }

      notifyListeners();
    });
  }


  /// 监听播放进度
  void _listenPositionChanged(){
    _audioPlayer.onAudioPositionChanged.listen((position){
      _position = position;
      var positionResult = _position?.toString()?.split('.')?.first ?? '';
      List<String> durationList =  positionResult.split(":");
      _positionText = durationList[1] + ":" + durationList[2];

      if(_position != null && _duration != null){
        playProgress =  _position.inMilliseconds / _duration.inMilliseconds;
        playProgress = playProgress > 1.0 ? 1.0 : playProgress;
      }

      notifyListeners();

    });
  }

  void updatePlayList(List<TrackItemModel> list,int currentIndex){

    _currentPlayList = list;
    _currentIndex  = currentIndex;

  }
  void  updatePlayItem(int index){
    _currentIndex = index;
    _currentIndexController.add(_currentIndex);
    music_play();

  }

  void music_clear(){
    music_stop();

    _currentPlayList = null;
    _currentIndex = 0;
    _currentPlayId = 0;
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

  /// 停止播放
  void music_stop(){
    _stop();
  }
  /// 更新播放进度
  void music_seek(double value){

    final position = value * _duration.inMilliseconds;
    _seek(position);
  }

  void _seek(position){
    _audioPlayer.seek(Duration(milliseconds: position.round()));

  }

  void _resume() async {
    int result =  await _audioPlayer.resume();

  }

  void _pause() async{

    int result =  await _audioPlayer.pause();

  }
  void _stop() async{
    int result = await _audioPlayer.stop();
  }

  void _play() async{
    if(_currentPlayId == currentTrackItem.id) return;

    var audioUrl = currentTrackItem.musicItemModel.url;

    _currentPlayId = currentTrackItem.musicItemModel.id;
    _audioPlayer.stop();

    if(audioUrl != null){
      int result = await _audioPlayer.play(audioUrl,isLocal: false);
    }


  }



  void music_next_index(){
    int index = currentIndex + 1;
    index = index == _currentPlayList.length ? 0 : index;

    _currentIndex = index;

  }
  void music_previous_index(){
    int index = currentIndex - 1;
    index = index < 0 ? _currentPlayList.length-1 : index;
    _currentIndex = index;

  }

  void music_control_next(){
    music_next_index();
    _play();

  }
  void music_control_previous(){
    music_previous_index();
    _play();

  }





  static MusicGlobalPlayListState musicPlayState (BuildContext context){
    return  Provider.of<MusicGlobalPlayListState>(context,listen: false);
  }

}
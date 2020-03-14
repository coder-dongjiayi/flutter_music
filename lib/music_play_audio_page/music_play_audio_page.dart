import 'package:flutter/material.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/music_play_audio_page/music_play_slider_widget.dart';
import 'package:flutter_music/music_play_audio_page/music_play_info_widget.dart';
import 'package:flutter_music/music_play_audio_page/music_play_control_widget.dart';
import 'package:flutter_music/music_play_audio_page/music_play_bottom_widget.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayAudioPage extends StatefulWidget {
  @override
  _MusicPlayAudioPageState createState() => _MusicPlayAudioPageState();
}

class _MusicPlayAudioPageState extends State<MusicPlayAudioPage> {

  var mp3Url = "https://m7.music.126.net/20200314221758/32596cde74ee053ccef4800c8913b87a/ymusic/6082/fe9d/74e5/3e2118b63ebe06bc7136ff53fd803035.mp3";
  MusicPlayInfoController _musicPlayInfoController;
  AudioPlayer _audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _musicPlayInfoController = MusicPlayInfoController();
    _audioPlayer = AudioPlayer();
    _play();

  }


  void _play() async{
    int result = await _audioPlayer.play("$mp3Url");
    if (result == 1) {

    }else{
      print("播放失败");
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: MusicStore.Theme.of(context).theme,
        appBar: MusicAppBar(
          title: "",
          leftIconData: Icons.keyboard_arrow_left,
          rightIconData: Icons.more_horiz,
          leftOnTap: (){
            Navigator.of(context).pop();
          },

        ),

        body: SafeArea(
          child: Stack(
            children: <Widget>[
              _playMusicInfo(),
              Positioned(
                bottom: 40,
                right: 0,
                left: 0,
                child: MusicPlayBottomWidget(),
              )
            ],
          ),
        )
    );
  }

  Widget _playMusicInfo(){
    return  Padding(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MusicPlayInfoWidget(
            musicController: _musicPlayInfoController,
          ),
          MusicPlayControlWidget(
            previousTap: (){

            },
            stateTap: (selected){
              if(selected == true){
                _musicPlayInfoController.pauseAnimation();
                _audioPlayer.pause();

              }else{
                _musicPlayInfoController.resumeAnimation();
                _audioPlayer.resume();


              }
            },
            nextTap: (){

            },
          ),
          MusicPlaySliderWidget()
        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _musicPlayInfoController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}




import 'package:flutter/material.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/music_play_audio_page/music_play_slider_widget.dart';
import 'package:flutter_music/music_play_audio_page/music_play_info_widget.dart';
import 'package:flutter_music/music_play_audio_page/music_play_control_widget.dart';
import 'package:flutter_music/music_play_audio_page/music_play_bottom_widget.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayAudioPage extends StatefulWidget {
  MusicPlayAudioPage({
    Key key,
    this.heroTagName,
    this.songName,
    this.artist,
    this.coverImageUrl
  }) : super(key : key);

  final String heroTagName;

  final String songName;

  final String artist;

  final String coverImageUrl;

  @override
  _MusicPlayAudioPageState createState() => _MusicPlayAudioPageState();
}

class _MusicPlayAudioPageState extends State<MusicPlayAudioPage>  with TickerProviderStateMixin {

  var mp3Url = "https://m7.music.126.net/20200314221758/32596cde74ee053ccef4800c8913b87a/ymusic/6082/fe9d/74e5/3e2118b63ebe06bc7136ff53fd803035.mp3";
  MusicPlayInfoController _musicPlayInfoController;
  AudioPlayer _audioPlayer;

  AnimationController _animationController;

  Animation _shiftAnimation;
  Animation _bottomAniamtion;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _musicPlayInfoController = MusicPlayInfoController();
    _initAnimation();

  }


 void _initAnimation(){

    _animationController = AnimationController(duration: Duration(milliseconds: 200),vsync: this);

     _shiftAnimation = Tween<double>(begin: 40.0,end: 0.0).animate(_animationController);

    _bottomAniamtion =  Tween<double>(begin: 0.0,end: 40.0).animate(_animationController);

    _animationController.forward();

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
              AnimatedBuilder(
               animation: _bottomAniamtion,
               builder: (context,_){
                 return Positioned(
                   bottom: _bottomAniamtion.value,
                   right: 0,
                   left: 0,
                   child: MusicPlayBottomWidget(),
                 );
               },
              )
            ],
          ),
        )
    );
  }

  Widget _playMusicInfo(){
    return  Padding(
      padding: EdgeInsets.only(top: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MusicPlayInfoWidget(
            heroTagName: widget.heroTagName,

            musicController: _musicPlayInfoController,
            songName: widget.songName,
            artist: widget.artist,
            coverImageUrl: widget.coverImageUrl,
          ),

         AnimatedBuilder(
           animation: Listenable.merge([_shiftAnimation]),
           builder: (context,_){

             return Padding(
               padding: EdgeInsets.only(top: _shiftAnimation.value),
               child:  MusicPlayControlWidget(
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
             );
           },
         ),
          MusicPlaySliderWidget()
        ],
      ),
    );
  }

  @override
  void dispose() {
    //_audioPlayer.dispose();
    _musicPlayInfoController.dispose();
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}




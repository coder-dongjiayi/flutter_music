
import 'package:flutter/material.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_slider_widget.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_info_widget.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_control_widget.dart';
import 'package:flutter_music/pages/music_play_media_page/animation/music_translation_animation.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_bottom_widget.dart';
import 'package:flutter_music/pages/music_play_media_page/animation/music_bottom_animation.dart';

class MusicPlayMeidaPage extends StatefulWidget {
  MusicPlayMeidaPage({
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
  _MusicPlayMeidaPageState createState() => _MusicPlayMeidaPageState();
}

class _MusicPlayMeidaPageState extends State<MusicPlayMeidaPage>  with TickerProviderStateMixin {

  var mp3Url = "https://m7.music.126.net/20200314221758/32596cde74ee053ccef4800c8913b87a/ymusic/6082/fe9d/74e5/3e2118b63ebe06bc7136ff53fd803035.mp3";
  MusicPlayInfoController _musicPlayInfoController;
  AudioPlayer _audioPlayer;

  AnimationController _animationController;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _musicPlayInfoController = MusicPlayInfoController();

    _animationController = AnimationController(duration: Duration(milliseconds: 300),vsync: this)..forward();

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
              _bottomGroup()
            ],
          ),
        )
    );
  }

  Widget _bottomGroup(){
    return MusicBottomAnimation(
      animationController: _animationController,
      child:  MusicPlayBottomWidget(),
    );
  }
  Widget _playMusicInfo(){
    return  Padding(
      padding: EdgeInsets.only(top: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MusicPlayInfoWidget(
            translationAnimation: _animationController,
            heroTagName: widget.heroTagName,
            musicController: _musicPlayInfoController,
            songName: widget.songName,
            artist: widget.artist,
            coverImageUrl: widget.coverImageUrl,

          ),

         MusicTranslationAnimation(
           animationController: _animationController,

           child: MusicPlayControlWidget(
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
         ),
          MusicPlaySliderWidget()
        ],
      ),
    );
  }



  @override
  void dispose() {

    _animationController.dispose();
    _musicPlayInfoController.dispose();

    // TODO: implement dispose
    super.dispose();
  }
}




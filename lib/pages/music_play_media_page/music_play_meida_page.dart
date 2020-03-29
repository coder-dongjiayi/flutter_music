
import 'package:flutter/material.dart';
import 'package:flutter_music/base_music/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/pages/library_page/library_state/library_list_state.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_slider_widget.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_info_widget.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_control_widget.dart';
import 'package:flutter_music/pages/music_play_media_page/animation/music_translation_animation.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_bottom_widget.dart';
import 'package:flutter_music/pages/music_play_media_page/animation/music_bottom_animation.dart';
import 'package:flutter_music/common/music_play_list_state.dart';

class MusicPlayMeidaPage extends StatefulWidget {
  MusicPlayMeidaPage({
    Key key,
    this.heroTagName,

  }) : super(key : key);

  final String heroTagName;



  @override
  _MusicPlayMeidaPageState createState() => _MusicPlayMeidaPageState();
}

class _MusicPlayMeidaPageState extends State<MusicPlayMeidaPage>  with TickerProviderStateMixin {

  AudioPlayer _audioPlayer;

  AnimationController _animationController;


  Future _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<TrackItemModel> trackList =   MusicPlayListState.musicPlayState(context).currentPlayList;

    _future = MusicApi.musicMp3Item(trackList);

    _animationController = AnimationController(duration: Duration(milliseconds: 300),vsync: this)..forward();

  }



  @override
  Widget build(BuildContext context) {

    return  MusicScaffold(
        showFloatingActionButton: false,
        appBar: MusicAppBar(
          title: "",
          leftIconData: Icons.keyboard_arrow_left,
          rightIconData: Icons.more_horiz,
          leftOnTap: (){
            Navigator.of(context).pop();
          },
        ),

        body: SafeArea(
            child: FutureBuilderWidget<List<TrackItemModel>>(
              future: _future,
              successBuilder: (BuildContext context, AsyncSnapshot<List<TrackItemModel>> snapshot){
                return _musicBody();
              },
            )
        )
    );


  }

  Widget _musicBody(){
    return ChangeNotifierProvider.value(
      value: MusicPlayListState.musicPlayState(context),
      child: Consumer<MusicPlayListState>(
        builder: (context,state,_){

          return Stack(
            children: <Widget>[
              _playMusicInfo(),
              _bottomGroup()
            ],
          );
        },
      ),
    );
  }

  /// 底部两个按钮
  Widget _bottomGroup(){
    return MusicBottomAnimation(
      animationController: _animationController,
      child:  MusicPlayBottomWidget(),
    );
  }
  /// 播放控制 封面图
  Widget _playMusicInfo(){
    return  Padding(
      padding: EdgeInsets.only(top: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MusicPlayInfoWidget(

            translationAnimation: _animationController,
          ),

         MusicTranslationAnimation(
           animationController: _animationController,
           child: MusicPlayControlWidget(
             previousTap: (){
             MusicPlayListState.musicPlayState(context).previousTrack();

             },
             stateTap: (selected){

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
    // TODO: implement dispose
    super.dispose();
  }
}




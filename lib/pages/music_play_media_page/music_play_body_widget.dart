import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/pages/library_page/library_state/library_list_state.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_slider_widget.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_info_widget.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_control_widget.dart';
import 'package:flutter_music/pages/music_play_media_page/animation/music_translation_animation.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_bottom_widget.dart';
import 'package:flutter_music/pages/music_play_media_page/animation/music_bottom_animation.dart';

class MusicPlayBodyWidget extends StatefulWidget {
  @override
  _MusicPlayBodyWidget createState() => _MusicPlayBodyWidget();
}

class _MusicPlayBodyWidget extends State<MusicPlayBodyWidget> with TickerProviderStateMixin{
  AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(duration: Duration(milliseconds: 200),vsync: this)..forward();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return _musicBody();
  }

  Widget _musicBody(){

    return ChangeNotifierProvider.value(
      value: MusicGlobalPlayListState.musicPlayState(context),
      child: Consumer<MusicGlobalPlayListState>(
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
    MusicGlobalPlayListState musicGlobalPlayListState =   MusicGlobalPlayListState.musicPlayState(context);
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
                musicGlobalPlayListState.music_previous();

              },
              stateTap: (selected){

                 if(selected == true){
                   musicGlobalPlayListState.music_pause();
                 } else{
                   musicGlobalPlayListState.music_resume();
                 }
              },
              nextTap: (){
                musicGlobalPlayListState.music_next();

              },
            ),
          ),
          MusicPlaySliderWidget()
        ],
      ),
    );
  }


}

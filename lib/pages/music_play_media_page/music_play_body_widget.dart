import 'package:audioplayers/audioplayers.dart';
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

  AnimationController _rotationAnimationController;

  PageController _pageController;

  MusicGlobalPlayListState _musicGlobalPlayListState;

  double _screenWidth = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _musicGlobalPlayListState =  MusicGlobalPlayListState.musicPlayState(context);


    _animationController = AnimationController(duration: Duration(milliseconds: 200),vsync: this)..forward();



    _rotationAnimationController = AnimationController(duration: Duration(seconds: 25),vsync: this);

    if(_musicGlobalPlayListState.playerState == AudioPlayerState.PAUSED){
      _rotationAnimationController.stop();
    }else{
      _rotationAnimationController.repeat();
    }



  /// 这个state 执行dispose() 会释放相关的资源 但是onPlayerStateChanged的监听还继续
    /// 这个时候 _rotationAnimationController 已经执行dispose
    /// 所以不行再调用相关方法了
    _musicGlobalPlayListState.onPlayerStateChanged.listen((state){

      if(this.mounted == false)return;

      _rotationAnimationController.repeat();

      if(state == AudioPlayerState.COMPLETED){
        _musicGlobalPlayListState.music_control_next();
        _pageViewAnimatePage();

      }else if(state == AudioPlayerState.PAUSED){
        _rotationAnimationController.stop();
      }

    });


    _musicGlobalPlayListState.onUpdateCurrentIndex.listen((currentIndex){
      if(this.mounted == false)return;
      _pageViewAnimatePage();
    });


    _pageController = PageController(initialPage:_musicGlobalPlayListState.currentIndex);


    _pageController.addListener((){

      if(_pageController.offset == _musicGlobalPlayListState.currentIndex * _screenWidth){
        _rotationAnimationController.repeat();
      }else{
        _rotationAnimationController.stop();
      }

    });
  }
  @override
  void didUpdateWidget(MusicPlayBodyWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

  }
  @override
  void dispose() {
    // TODO: implement dispose

    _rotationAnimationController.dispose();

    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;

    return _musicBody();
  }

  Widget _musicBody(){

    return Stack(
      children: <Widget>[
        _playMusicInfo(),
        _bottomGroup()
      ],
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

            pageController: _pageController,
            rotationAnimationController: _rotationAnimationController,
            translationAnimation: _animationController,
          ),

          MusicTranslationAnimation(
            animationController: _animationController,

            child: MusicPlayControlWidget(
              previousTap: (){

                _musicGlobalPlayListState.music_control_previous();

                _pageViewAnimatePage();
              },
              stateTap: (selected){

                 if(selected == true){
                   _rotationAnimationController.stop();
                   musicGlobalPlayListState.music_pause();
                 } else{
                   _rotationAnimationController.repeat();
                   musicGlobalPlayListState.music_resume();
                 }
              },
              nextTap: (){
                _musicGlobalPlayListState.music_control_next();

                _pageViewAnimatePage();
              },
            ),
          ),
          MusicPlaySliderWidget()
        ],
      ),
    );
  }

  void _pageViewAnimatePage(){
    _pageController.animateToPage(_musicGlobalPlayListState.currentIndex,
        duration:  Duration(milliseconds: 250), curve: Curves.ease);
  }

}

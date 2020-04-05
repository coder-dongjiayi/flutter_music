
import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

import 'package:flutter_music/common/screen_adapter.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/pages/music_play_media_page/animation/music_translation_animation.dart';
import 'package:flutter_music/pages/music_play_media_page/music_paly_coverimage_widget.dart';
import 'dart:ui';


class MusicPlayInfoWidget extends StatelessWidget {

  MusicPlayInfoWidget({
    Key key,


    this.translationAnimation,

    this.rotationAnimationController,
    this.pageController

  }) : super (key : key);




  final  AnimationController      rotationAnimationController;

  final AnimationController translationAnimation;

  var _playerNameTop = 35.0;
  var _playerArtistTop = 5.0;
  var _playCovermarginTop = 20.0;


  final PageController pageController;


  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);

    List<TrackItemModel>  _tracks = MusicGlobalPlayListState.musicPlayState(context).currentPlayList;

    double _containerHeight =  ScreenAdapter.getScreenWidth()/3.0
        + _playCovermarginTop *2
        + _playerNameTop
        + _playerArtistTop
        + 20
        + 10;

    return Container(

      height: _containerHeight,

      child: PageView.builder(
          onPageChanged: (index){

            if(index < MusicGlobalPlayListState.musicPlayState(context).currentIndex){
              MusicGlobalPlayListState.musicPlayState(context).music_control_previous();

            }else if(index > MusicGlobalPlayListState.musicPlayState(context).currentIndex){
              MusicGlobalPlayListState.musicPlayState(context).music_control_next();
            }

          },
          controller: pageController,
          itemCount: _tracks.length,
          itemBuilder: (BuildContext context, int index){
            TrackItemModel itemModel = _tracks[index];
            return _pageItem(itemModel.name,itemModel.arList.first.name,itemModel.al.picUrl);
          }),
    );

  }

  Widget _pageItem(name,artist,coverImageUrl){
    return Builder(
      builder: (context){
        return Column(
          children: <Widget>[

            _playCover(context,coverImageUrl),
            _playerName(context,name),
            _playerArtist(context,artist)
          ],
        );
      },
    );
  }

  Widget _playerName(context,name){

    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: MusicTranslationAnimation(
              animationController: translationAnimation,
              begin: 0,
              end: _playerNameTop,
              child: Text(
                name,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: MusicStore.Theme(context).titleColor,fontSize: 17,fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ],
    );
  }
  Widget _playerArtist(context,artist){
    return Padding(
      padding: EdgeInsets.only(top: _playerArtistTop),
      child: Text(artist,
        style: TextStyle(color: MusicStore.Theme(context).subtTitleColor,fontSize: 12),
      ),
    );
  }
  Widget _playCover(context,coverImageUrl){
    double _width =  ScreenAdapter.getScreenWidth()/3.0;

    return MusicPlayCoverimageWidget(

      width: _width,
      coverImageUrl: coverImageUrl,
      marginTop: _playCovermarginTop,
      animationController: rotationAnimationController,
    );

  }
}





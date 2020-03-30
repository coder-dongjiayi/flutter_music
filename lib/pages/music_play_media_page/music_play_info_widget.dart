import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

import 'package:flutter_music/common/screen_adapter.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/pages/music_play_media_page/animation/music_translation_animation.dart';
import 'package:flutter_music/pages/music_play_media_page/music_paly_coverimage_widget.dart';

class MusicPlayInfoController extends ChangeNotifier{

  static const int MUSIC_STATE_RESUME = 1;


  static const int MUSIC_STATE_PAUSE = 2;

  int state;
  void resumeAnimation(){
    state = MUSIC_STATE_RESUME;
    notifyListeners();
  }

  void pauseAnimation(){
    state =  MUSIC_STATE_PAUSE;
    notifyListeners();
  }
}

class MusicPlayInfoWidget extends StatefulWidget {
  MusicPlayInfoWidget({
    Key key,

    this.heroTagName,

    this.translationAnimation,

}) : super (key : key);

  final String heroTagName;

  final AnimationController translationAnimation;

  @override
  _MusicPlayInfoWidgetState createState() => _MusicPlayInfoWidgetState();
}

class _MusicPlayInfoWidgetState extends State<MusicPlayInfoWidget>  with TickerProviderStateMixin{



  var _playerNameTop = 35.0;
  var _playerArtistTop = 5.0;
  var _playCovermarginTop = 20.0;


  PageController          _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    int index = MusicGlobalPlayListState.musicPlayState(context).currentIndex;

   _pageController = PageController(initialPage: index);


  }


  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();

    super.dispose();
    
  }

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
            print(_tracks[index].musicItemModel.url);
          },
          controller: _pageController,
          itemCount: _tracks.length,
          itemBuilder: (BuildContext context, int index){
            TrackItemModel itemModel = _tracks[index];
            return _pageItem(itemModel.name,itemModel.arList.first.name,itemModel.al.picUrl);
          }),
    );

  }

  Widget _pageItem(name,artist,coverImageUrl){
    return Column(
      children: <Widget>[

        _playCover(context,coverImageUrl),
        _playerName(context,name),
        _playerArtist(context,artist)
      ],
    );
  }

  Widget _playerName(context,name){

    return MusicTranslationAnimation(
      animationController: widget.translationAnimation,
      begin: 0,
      end: _playerNameTop,
      child: Text(name,
        style: TextStyle(color: MusicStore.Theme.of(context).titleColor,fontSize: 17,fontWeight: FontWeight.w600),
      ),
    );
  }
  Widget _playerArtist(context,artist){
    return Padding(
      padding: EdgeInsets.only(top: _playerArtistTop),
      child: Text(artist,
        style: TextStyle(color: MusicStore.Theme.of(context).subtTitleColor,fontSize: 12),
      ),
    );
  }
  Widget _playCover(context,coverImageUrl){
    double _width =  ScreenAdapter.getScreenWidth()/3.0;

    return MusicPlayCoverimageWidget(
      width: _width,
      coverImageUrl: coverImageUrl,
      marginTop: _playCovermarginTop,
      animationController: null,
    );

  }
}



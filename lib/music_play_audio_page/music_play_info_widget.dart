import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_music/common/screen_adapter.dart';
import 'package:flutter_music/music_play_audio_page/animation/music_translation_animation.dart';

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
    this.musicController,
    this.heroTagName,
    this.songName,
    this.artist,
    this.coverImageUrl,
    this.translationAnimation


}) : super (key : key);

  final MusicPlayInfoController musicController;
  final String heroTagName;
  final String songName;
  final String artist;
  final String coverImageUrl;
  final AnimationController translationAnimation;
  @override
  _MusicPlayInfoWidgetState createState() => _MusicPlayInfoWidgetState();
}

class _MusicPlayInfoWidgetState extends State<MusicPlayInfoWidget>  with TickerProviderStateMixin{



  var _playerNameTop = 35.0;
  var _playerArtistTop = 5.0;
  var _playCovermarginTop = 20.0;

  AnimationController _animationController;

  MusicPlayInfoController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = widget.musicController;
    if (_controller != null) {
     // _controller.addListener(_addLister);
    }


    _animationController = AnimationController(duration: Duration(seconds: 25),vsync: this);

    _animationController.addStatusListener((state){
      if(state == AnimationStatus.completed){
        _animationController.reset();
        _animationController.forward();
      }

    });

    _animationController.forward();

  }

//  void _addLister(){
//      if(_controller.state == MusicPlayInfoController.MUSIC_STATE_RESUME){
//
//        _animationController.forward();
//      }
//      if(_controller.state == MusicPlayInfoController.MUSIC_STATE_PAUSE){
//        _animationController.stop();
//      }
//  }
  @override
  void dispose() {
    // TODO: implement dispose

    _animationController.dispose();

    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);

    double _containerHeight =  ScreenAdapter.getScreenWidth()/3.0
                              + _playCovermarginTop *2
                              + _playerNameTop
                              + _playerArtistTop
                              + 20
                              + 10;



    return Container(

      height: _containerHeight,

      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index){
            return _pageItem();
          }),
    );

  }

  Widget _pageItem(){
    return Column(
      children: <Widget>[
        Hero(
          tag: widget.heroTagName,
          child:  _playCover(context),
        ),
        _playerName(context),
        _playerArtist(context)
      ],
    );
  }

  Widget _playerName(context){

    return MusicTranslationAnimation(
      animationController: widget.translationAnimation,
      begin: 0,
      end: _playerNameTop,
      child: Text(widget.songName,
        style: TextStyle(color: MusicStore.Theme.of(context).titleColor,fontSize: 17,fontWeight: FontWeight.w600),
      ),
    );
  }
  Widget _playerArtist(context){
    return Padding(
      padding: EdgeInsets.only(top: _playerArtistTop),
      child: Text(widget.artist,
        style: TextStyle(color: MusicStore.Theme.of(context).subtTitleColor,fontSize: 12),
      ),
    );
  }
  Widget _playCover(context){
    double _width =  ScreenAdapter.getScreenWidth()/3.0;

    return Container(
      width: _width,
      height: _width,
      margin: EdgeInsets.only(top: _playCovermarginTop),

      decoration: ShapeDecoration(
          color: Colors.white,
          shape: CircleBorder(),
          shadows: [
            BoxShadow(color: MusicStore.Theme
                .of(context)
                .shadowColor, offset: Offset(10, 10), blurRadius: 20),
            BoxShadow(
                color: MusicStore.Theme
                    .of(context)
                    .shadowColor, offset: Offset(-10, -10), blurRadius: 20)
          ]
      ),
      //margin: EdgeInsets.fromLTRB(60, 60, 60, 60),

      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: RotationTransition(
        alignment: Alignment.center,
        turns: _animationController,
        child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: widget.coverImageUrl,
              fit: BoxFit.cover,
              placeholder: (context,url){
                return Icon(Icons.music_note,size: _width,color:MusicStore.Theme.of(context).shadowColor);
              },
            )

        ),
      )

    );
  }
}



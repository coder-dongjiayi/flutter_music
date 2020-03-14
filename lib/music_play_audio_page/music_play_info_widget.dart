import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MusicPlayInfoWidget extends StatefulWidget {
  @override
  _MusicPlayInfoWidgetState createState() => _MusicPlayInfoWidgetState();
}

class _MusicPlayInfoWidgetState extends State<MusicPlayInfoWidget>  with TickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 25),vsync: this);

    _animationController.addStatusListener((state){
      if(state == AnimationStatus.completed){
        _animationController.reset();
        _animationController.forward();
      }

    });

    _animationController.forward();

  }
  
  @override
  void dispose() {
    // TODO: implement dispose

    _animationController.dispose();
    super.dispose();


    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _playCover(context),
        _playerName(context),
        _playerArtist(context)
      ],
    );

  }

  Widget _playerName(context){
    return Padding(
      padding: EdgeInsets.only(top: 35),
      child: Text("光年之外",
        style: TextStyle(color: MusicStore.Theme.of(context).titleColor,fontSize: 17,fontWeight: FontWeight.w600),
      ),
    );
  }
  Widget _playerArtist(context){
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Text("邓紫棋",
        style: TextStyle(color: MusicStore.Theme.of(context).subtTitleColor,fontSize: 12),
      ),
    );
  }
  Widget _playCover(context){
    return Container(
      margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
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
              imageUrl: "https://pic.xiami.net/images/album/img29/59/586525ffc9905_2961929_1483023871.jpg?x-oss-process=image/quality,q_80",
              fit: BoxFit.cover,
              placeholder: (context,url){
                return Icon(Icons.music_note,size: 200,color:MusicStore.Theme.of(context).shadowColor);
              },
            )

        ),
      )

    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:vibrate/vibrate.dart';
import 'package:flutter_music/public_widget/music_button.dart';

import 'package:flutter_music/music_play_audio_page/music_play_audio_page.dart';
typedef GestureTapCallback = void Function();

class MusicItemWidget extends StatelessWidget {

  MusicItemWidget({
    Key key,
    this.title,
    this.subtTitle,
    this.coverImageUrl,
    this.heroTageName,
    this.onTap
}):super(key:key);

  final String title;
  final String subtTitle;
  final String coverImageUrl;

  final String heroTageName;

  final GestureTapCallback onTap;

  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Vibrate.feedback(FeedbackType.selection);
        if (onTap != null){
          onTap();
        }else{
          _animationPush(context);
        }


      },

      child: Container(
        color: MusicStore.Theme.of(context).theme,
        margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),

        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _itemCover(context),
            Expanded(
              flex: 1,
              child:  _itemTitle(context),
            ),
          MusicButton(
            normalIconData: Icons.play_arrow,
            isEnable: false,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          )
//            _itemPlay(context)
          ],
        ),
      ),
    );
  }



  Widget _itemCover(context){
    return  Hero(

      tag: "$heroTageName",
      child: Container(

          width: 60,
          height: 60,
          padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow:[
                BoxShadow(color:MusicStore.Theme.of(context).shadowColor,offset: Offset(10,10),blurRadius: 10),
                BoxShadow(color: Colors.white,offset: Offset(-10,-10),blurRadius: 26)
              ]
          ),

          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: "$coverImageUrl",
                fit: BoxFit.cover,
              )
          )
      ),
    );

  }

  Widget _itemTitle(context){
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$title",
              maxLines: 2,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500, color: MusicStore.Theme.of(context).titleColor),overflow: TextOverflow.ellipsis,),

          Padding(
              padding: EdgeInsets.only(top: 3,right: 60),
              child: Text("$subtTitle",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10,color: MusicStore.Theme.of(context).subtTitleColor),)

          )
        ],
      ),
    );
  }

  void _animationPush(context){

    Navigator.of(context).push(PageRouteBuilder<void>(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
          return AnimatedBuilder(
            animation: animation,
            builder:  (BuildContext context, Widget child){
              return Opacity(
                  opacity: opacityCurve.transform(animation.value),
                  child: MusicPlayAudioPage(
                    heroTagName: heroTageName,
                    songName: title,
                    artist: subtTitle,
                    coverImageUrl: coverImageUrl,
                  )
              );
            },
          );
        }

    ));
  }

}

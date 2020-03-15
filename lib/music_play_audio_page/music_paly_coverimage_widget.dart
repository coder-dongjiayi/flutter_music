import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
class MusicPlayCoverimageWidget extends StatelessWidget {

  MusicPlayCoverimageWidget({
    Key key,
    this.width,
    this.marginTop : 0,
    this.animationController,
    this.coverImageUrl
}) : super (key : key);

  final double width;
  final double marginTop;
  final AnimationController animationController;
  final String coverImageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: width,
        margin: EdgeInsets.only(top: marginTop),

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
        child: animationController == null ? _clipOval() : RotationTransition(
          alignment: Alignment.center,
          turns: animationController,
          child: _clipOval()
        )

    );
  }

  Widget _clipOval(){
    return ClipOval(
        child: CachedNetworkImage(
          imageUrl: coverImageUrl,
          fit: BoxFit.cover,
          placeholder: (context,url){
            return Icon(Icons.music_note,size: width,color:MusicStore.Theme.of(context).shadowColor);
          },
        )

    );
  }
}

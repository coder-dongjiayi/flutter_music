import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:vibrate/vibrate.dart';
import 'package:cached_network_image/cached_network_image.dart';

typedef GestureTapCallback = void Function(bool selected);


class MusicButton extends StatefulWidget {
  MusicButton({
    Key key,
    this.selected: false,
    @required this.normalIconData,
    this.showLayer:true,
    this.selectedIconData,
    this.onTap,
    this.isEnable : true,
    this.padding : const EdgeInsets.fromLTRB(10, 10, 10, 10),
    this.margin :  const EdgeInsets.fromLTRB(0, 0, 0, 0),
    this.size : 25,
    this.imageURL
  }): super(key:key);

  final IconData normalIconData;
  final IconData selectedIconData;
  final GestureTapCallback onTap;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool isEnable;
  final  double size;
  final bool showLayer;
  final String imageURL;
   bool selected;
  @override
  _MusicButtonState createState() => _MusicButtonState();
}

class _MusicButtonState extends State<MusicButton> {


  @override
  Widget build(BuildContext context) {


    return GestureDetector(



      onTap:  widget.isEnable == false ? null : (){
        if(MusicStore.isVibrate == true){
          Vibrate.feedback(FeedbackType.impact);
        }

        if (widget.selectedIconData != null){
         setState(() {

           widget.selected = !widget.selected;
         });
        }
        if(widget.onTap != null){
          widget.onTap(widget.selected);
        }


      },
      child: _musicButton(context),
    );
  }

  Widget _musicButton(BuildContext context) {

    return Container(
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MusicStore.Theme
              .of(context)
              .theme,
          boxShadow: widget.showLayer == false ? null : MusicStore.boxShow(context, -5, 5),
        gradient: widget.selected == false ? null : LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            MusicStore.Theme.of(context).bottomShadowColor,
            MusicStore.Theme.of(context).topShadowColor
          ],

        )
      ),

      child: widget.imageURL != null ? _image() : Icon(_iconData(), size: widget.size, color: MusicStore.Theme
          .of(context)
          .titleColor),
    );
  }

  Widget _image(){
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: widget.imageURL,
          fit: BoxFit.cover,
        ));
  }

  IconData _iconData(){

    if(widget.selectedIconData != null){
      return widget.selected == true ? widget.selectedIconData : widget.normalIconData;
    }
    return widget.normalIconData;
  }
}



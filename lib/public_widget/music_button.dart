import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:vibrate/vibrate.dart';

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
    this.size : 20
  }): super(key:key);

  final IconData normalIconData;
  final IconData selectedIconData;
  final GestureTapCallback onTap;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool isEnable;
  final  double size;
  final bool showLayer;
   bool selected;
  @override
  _MusicButtonState createState() => _MusicButtonState();
}

class _MusicButtonState extends State<MusicButton> {


  @override
  Widget build(BuildContext context) {


    return GestureDetector(



      onTap:  widget.isEnable == false ? null : (){
        Vibrate.feedback(FeedbackType.impact);
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
          borderRadius: BorderRadius.circular(10),
          color: MusicStore.Theme
              .of(context)
              .theme,
          boxShadow: widget.showLayer == false ? null : [
            BoxShadow(color: MusicStore.Theme.of(context).shadowColor,
                spreadRadius: 2,
                offset: Offset(5, 5), blurRadius: 11),
            BoxShadow(
                color: Colors.white, offset: Offset(-5, -5), blurRadius: 11)

          ],
        gradient: widget.selected == false ? null : LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            MusicStore.Theme.of(context).shadowColor,
            Colors.white
          ],

        )
      ),

      child: Icon(_iconData(), size: widget.size, color: MusicStore.Theme
          .of(context)
          .titleColor),
    );
  }

  IconData _iconData(){

    if(widget.selectedIconData != null){
      return widget.selected == true ? widget.selectedIconData : widget.normalIconData;
    }
    return widget.normalIconData;
  }
}



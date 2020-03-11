import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

typedef GestureTapCallback = void Function();

class MusicAppBar extends StatefulWidget implements PreferredSizeWidget{

  MusicAppBar({
    Key key,
    this.title,
    this.leftIconData,
    this.rightIconData,
    this.leftOnTap,
    this.rightOnTap
  }) : preferredSize = Size.fromHeight(kToolbarHeight), super(key:key);


  final GestureTapCallback leftOnTap;
  final GestureTapCallback rightOnTap;

  final Size preferredSize;
  final String title;
  final IconData leftIconData;
  final IconData rightIconData;

  @override
  _MusicAppBarState createState() => _MusicAppBarState();
}

class _MusicAppBarState extends State<MusicAppBar> {
  @override
  Widget build(BuildContext context) {

    List<Widget> _list = List();
    if(widget.leftIconData != null){
      _list.add(_leftItem());
    }
    if(widget.title != null){
      _list.add(_title());
    }
    if(widget.rightIconData != null){
      _list.add(_rightItem());
    }

    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        color: MusicStore.Theme.of(context).theme,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _list
        ),
      ),
    );


  }
  //keyboard_arrow_left

  Widget _leftItem(){

    if(widget.leftIconData == null){
      return Text("");
    }
    return InkWell(
      onTap: (){
        if(widget.leftIconData != null){
          widget.leftOnTap();
        }
      },
      child: _icon(widget.leftIconData),
    );
  }
  Widget _rightItem(){
    if (widget.rightIconData == null){
      return Text("");
    }
    return InkWell(
      onTap: (){
        if(widget.rightOnTap != null){
          widget.rightOnTap();
        }
      },
      child: _icon(widget.rightIconData),
    );
  }

  Widget _icon(IconData iconData){
    return Container(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MusicStore.Theme.of(context).theme,
          boxShadow: [
            BoxShadow(color:MusicStore.Theme.of(context).shadowColor ,offset: Offset(6,6),blurRadius: 3),
            BoxShadow(color: Colors.white,offset: Offset(-5,-5),blurRadius: 26)
          ]
      ),
      child: Icon(iconData,size: 20,color: MusicStore.Theme.of(context).titleColor),
    );
  }


  Widget _title(){
    return Text("${widget.title}",style: TextStyle(fontSize: 24,color: MusicStore.Theme.of(context).titleColor,fontWeight: FontWeight.w500),);
  }
}

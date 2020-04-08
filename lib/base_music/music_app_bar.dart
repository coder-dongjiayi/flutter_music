import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/public_widget/music_button.dart';


typedef GestureTapCallback = void Function();

class MusicAppBar extends StatefulWidget implements PreferredSizeWidget{

  MusicAppBar({
    Key key,
    this.title,

    this.leftIconData,
    this.rightIconData,
    this.rightSelectedIconData,
    this.leftOnTap,
    this.rightOnTap,
    this.rightImageURL
  }) : preferredSize = Size.fromHeight(kToolbarHeight), super(key:key);


  final GestureTapCallback leftOnTap;
  final GestureTapCallback rightOnTap;

  final Size preferredSize;
  final String title;
  final IconData leftIconData;
  final IconData rightIconData;

  final IconData rightSelectedIconData;
  final String rightImageURL;


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
    if(widget.rightImageURL != null){
      _list.add(_image());
    }

    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        color: MusicStore.Theme(context).theme,
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
    return MusicButton(
      normalIconData: widget.leftIconData,
      onTap: (selected){
        if(widget.leftIconData != null){
          widget.leftOnTap();
        }
      },
    );
  }

  Widget _image(){
    return MusicGestureDetector(
      onTap: (){
        if(widget.rightOnTap != null){
          widget.rightOnTap();
        }
      },
      child: Container(
        width: ScreenAdapter.setWidth(80),
        height: ScreenAdapter.setHeight(80),
        margin: EdgeInsets.fromLTRB(6, 6, 6, 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          color: MusicStore.Theme(context).theme,
          boxShadow: MusicStore.boxShow(context, -5, 5)
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(37),
            child: CachedNetworkImage(
              imageUrl: widget.rightImageURL,
              fit: BoxFit.cover,
            ))
      )
    );
  }

  Widget _rightItem(){
    if (widget.rightIconData == null && widget.rightImageURL == null){
      return Text("");
    }
    return MusicButton(
      imageURL: widget.rightImageURL,
      normalIconData: widget.rightIconData,
      selectedIconData: widget.rightSelectedIconData,
      onTap: (selected){
        if(widget.rightOnTap != null){
          widget.rightOnTap();
        }
      },
    );
  }


  Widget _title(){
    return Text("${widget.title}",style: TextStyle(fontSize: 25,color: MusicStore.Theme(context).titleColor,fontWeight: FontWeight.w500),);
  }
}

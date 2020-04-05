import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/public_widget/music_title_widget.dart';
import 'package:flutter_music/public_widget/music_gestureDetector.dart';
typedef GestureTapCallback = void Function();

class CommentItemWidget extends StatelessWidget {

  CommentItemWidget({
    Key key,
    this.title,
    this.imageUrl1,
    this.imageUrl2,
    this.leftOnTap,
    this.rightOnTap

  }): super(key:key);

  final String title;
  final String imageUrl1;
  final String imageUrl2;

  final GestureTapCallback leftOnTap;
  final GestureTapCallback rightOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30,left: 20,right: 20),
      child: Column(
        children: <Widget>[
          MusicTitleWidget(
            title: title,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          ),
          _itemList(context)
        ],
      ),
    );
  }

  Widget _itemList(BuildContext context){

    return Row(
      children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(right:6),
              child: MusicGestureDetector(
                onTap: (){
                  leftOnTap();
                },
                child: _item(context,imageUrl1),
              ),
            )
          ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 6),
            child: MusicGestureDetector(
              onTap: (){
                rightOnTap();
              },
              child: _item(context,imageUrl2),
            ),
          ),
        )
      ],
    );
  }

  Widget _item(BuildContext context,imageUrl){
    return Container(

      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.fromLTRB(3, 3, 3, 3),

      decoration: BoxDecoration(
        
          borderRadius: BorderRadius.circular(10),
          color:  MusicStore.Theme.of(context).topShadowColor,
          boxShadow: MusicStore.boxShow(context, -10, 10)
      ),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl: "$imageUrl",
            fit: BoxFit.cover,
          )
        ),
      ),

    );
  }

}

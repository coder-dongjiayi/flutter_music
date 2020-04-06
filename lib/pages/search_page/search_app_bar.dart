import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
class SearchAppBar extends StatelessWidget implements PreferredSizeWidget{
  SearchAppBar({
    Key key,

}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key :key);

  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          color: MusicStore.Theme(context).theme,
            boxShadow: MusicStore.boxShow(context, -5, 5),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                MusicStore.Theme(context).bottomShadowColor,
                MusicStore.Theme(context).topShadowColor
              ],

            )
        ),
        child: TextField(
            decoration:InputDecoration(
              border: InputBorder.none
            )
        ),
      ),
    );
  }
}

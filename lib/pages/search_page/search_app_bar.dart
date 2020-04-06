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
          color: Colors.transparent,
          boxShadow: [
             BoxShadow(
              color: MusicStore.Theme(context).topShadowColor,
              offset: const Offset(0.0, 0.0),
            ),
             BoxShadow(
              color: MusicStore.Theme(context).theme,
              offset: const Offset(0.0, 0.0),
              spreadRadius: -2.0,
              blurRadius: 2.0,
            ),
          ],
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

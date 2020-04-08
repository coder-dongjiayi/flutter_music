import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/common/inner_shadow.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget{
  SearchAppBar({
    Key key,

}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key :key);

  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return SafeArea(
      child: Container(

        decoration: BoxDecoration(
          color: MusicStore.Theme(context).theme,
          border: Border.all(color: Colors.white,width: 2),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
             Colors.black,
              Colors.white
            ],

          )
        ),
        height: ScreenAdapter.setHeight(88),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),


      ),
    );
  }
}

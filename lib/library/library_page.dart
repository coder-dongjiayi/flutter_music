import 'package:flutter/material.dart';

import 'package:flutter_music/common/music_store.dart';

import 'package:flutter_music/music_app_bar/music_app_bar.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MusicStore.Theme.of(context).theme,
   appBar: MusicAppBar(
     title: "播放列表",
     rightIconData: Icons.edit,
     rightOnTap: (){
       print("这是右边按钮");
     },
   ),
     body: Center(
       child: GestureDetector(
         onTap: (){




           },
       )
     ),
    );
  }
}

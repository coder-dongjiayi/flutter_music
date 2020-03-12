import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';

import 'package:flutter_music/library/new_library/new_library_title_widget.dart';

class NewLibraryPage extends StatefulWidget {
  @override
  _NewLibraryPageState createState() => _NewLibraryPageState();
}

class _NewLibraryPageState extends State<NewLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MusicStore.Theme.of(context).theme,
      appBar: MusicAppBar(
        leftIconData: Icons.arrow_back_ios,
        rightIconData: Icons.check,
        leftOnTap: (){
          Navigator.of(context).pop();
        },
        title: "新建歌单",
      ),
      body: NewLibraryTitleWidget(),
    );
  }
}


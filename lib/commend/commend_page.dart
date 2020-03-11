import 'package:flutter/material.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
class CommendPage extends StatefulWidget {
  @override
  _CommendPageState createState() => _CommendPageState();
}

class _CommendPageState extends State<CommendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:MusicStore.Theme.of(context).theme,
      appBar: MusicAppBar(
        title: "推荐",
        rightIconData: Icons.person_pin,
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';

class BrowsePage extends StatefulWidget {
  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MusicStore.Theme.of(context).theme,
      appBar: MusicAppBar(
        title: "浏览",
        rightIconData: Icons.search,
      ),
    );
  }
}

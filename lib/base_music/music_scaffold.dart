import 'package:flutter/material.dart';
import 'package:flutter_music/common/screen_adapter.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/base_music/music_bottom_play.dart';

class MusicScaffold extends StatefulWidget {
  MusicScaffold({
        Key key,
        this.appBar,
        this.body,
        this.bottomNavigationBar,
        this.showFloatingActionButton : true
      }):super(key: key);

  final Widget body;
  final Widget bottomNavigationBar;
  final PreferredSizeWidget appBar;
  //是否显示最下面的播放条 默认是显示的
  final bool showFloatingActionButton;
  @override
  _MusicScaffoldState createState() => _MusicScaffoldState();
}

class _MusicScaffoldState extends State<MusicScaffold> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);

    return Scaffold(
      backgroundColor: MusicStore.Theme.of(context).theme,
      appBar: widget.appBar,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0,widget.showFloatingActionButton==true ? ScreenAdapter.setHeight(90) : 0),
        child: widget.body,
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.showFloatingActionButton == true ? MusicBottomPlay() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }


}

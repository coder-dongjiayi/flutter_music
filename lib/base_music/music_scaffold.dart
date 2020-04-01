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

class _MusicScaffoldState extends State<MusicScaffold> with TickerProviderStateMixin{

  AnimationController  _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 25),vsync: this);
   _animationController.repeat();
  }
  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);

    int listCount =   MusicGlobalPlayListState.musicPlayState(context).currentPlayList.length;
    return Scaffold(
      backgroundColor: MusicStore.Theme.of(context).theme,
      appBar: widget.appBar,
      body:  Padding(
        padding: EdgeInsets.only(bottom: (listCount == 0 || widget.bottomNavigationBar!= null) ? 0 : ScreenAdapter.setHeight(90)),
        child: widget.body,
      ),

      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: _floatingWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }

  Widget _floatingWidget(){

    if(MusicGlobalPlayListState.musicPlayState(context).currentPlayList.length == 0 || widget.showFloatingActionButton == false){
      return Text("");
    }

    return MusicBottomPlay(
      animationController: _animationController,
    );


  }


}

import 'package:flutter/material.dart';
import 'package:flutter_music/base_music/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/common/screen_adapter.dart';
import 'package:flutter_music/public_widget/music_item_widget.dart';
import 'package:flutter_music/pages/music_play_media_page/music_paly_coverimage_widget.dart';
class MusicListPage extends StatefulWidget {
  @override
  _MusicListPageState createState() => _MusicListPageState();
}

class _MusicListPageState extends State<MusicListPage>  with TickerProviderStateMixin{


  MusicGlobalPlayListState musicGlobalPlayListState;
  AnimationController _rotationAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _rotationAnimationController = AnimationController(duration: Duration(seconds: 25),vsync: this);
    _rotationAnimationController.repeat();

  }
  @override
  void dispose() {
    _rotationAnimationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    musicGlobalPlayListState = MusicGlobalPlayListState.musicPlayState(context);

    ScreenAdapter.init(context);
    double _width =  ScreenAdapter.getScreenWidth()/4.0;


    return Scaffold(
      backgroundColor: MusicStore.Theme.of(context).theme,
      appBar: MusicAppBar(
        title: "播放列表",
        leftIconData: Icons.keyboard_arrow_down,
        rightIconData: Icons.more_horiz,
        leftOnTap: (){
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _playCoverImage(_width),
            _playList(_width)
          ],
        ),
      )
    );
  }

  Widget _playList(top){
    return Container(
      margin: EdgeInsets.only(top: top+40),
      child: ListView.builder(

          itemCount: musicGlobalPlayListState.currentPlayList.length,
          itemBuilder: (context,index){
          TrackItemModel itemModel = musicGlobalPlayListState.currentPlayList[index];

          var  title = itemModel.name;
          var  subtTitle = itemModel.arList.first.name + itemModel.al.name;
          var  coverImageUrl = itemModel.al.picUrl;

            return MusicItemWidget(
              onTap: (index){

              },
              title: title,
              subtTitle: subtTitle,
              coverImageUrl: coverImageUrl,

            );
          }
      ),
    );
  }


  Widget _playCoverImage(width){

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Center(
        child:  MusicPlayCoverimageWidget(
          animationController: _rotationAnimationController,
          width: width,
          marginTop: 20,
          coverImageUrl: musicGlobalPlayListState.currentTrackItem.al.picUrl,
        ),
      ),
    );
  }
}

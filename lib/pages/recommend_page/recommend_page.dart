import 'package:flutter/material.dart';
import 'package:flutter_music/models/play_list_model.dart';
import 'package:flutter_music/models/song_list_model.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/pages/recommend_page/recomment_item_widget.dart';
import 'package:flutter_music/pages/recommend_page/recomment_more_item_widget.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/public_widget/music_title_widget.dart';
import 'package:flutter_music/public_widget/music_gestureDetector.dart';
import 'package:flutter_music/pages/album_page/album_page.dart';

class CommendPage extends StatefulWidget {
  @override
  _CommendPageState createState() => _CommendPageState();
}

class _CommendPageState extends State<CommendPage> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Future _recommendNewSongFuture = MusicApi.recommendNewSongList();

  Future _choicenessSongFuture   = MusicApi.choicenessSongList();

  Future _recommendMoreFuture =  MusicApi.recommendMoreSongList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:MusicStore.Theme.of(context).theme,
      appBar: MusicAppBar(
        title: "推荐",
        rightIconData: Icons.person_pin,
        rightOnTap: (){

        },
      ),

      body: ListView(
        children: <Widget>[
          _lastSongList("最新歌单",_recommendNewSongFuture),
          _lastSongList("精选歌单",_choicenessSongFuture),
          MusicTitleWidget(
            title: "更多",
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          ),
          _moreListView(context)

        ],
      ),

    );
  }

  /// 最新歌单 精选歌单
  Widget _lastSongList(String title,Future future){

    return FutureBuilderWidget<List<PlayItemModel>>(
      future:future,
      activityIndicator: Text(""),
      successBuilder: (BuildContext context,AsyncSnapshot<List<PlayItemModel>> snapshot){


        return CommentItemWidget(
          title: "$title",
          imageUrl1: snapshot.data.first.coverImgUrl,
          imageUrl2: snapshot.data.last.coverImgUrl,
          leftOnTap: (){
            _pushAlbumPage(snapshot.data.first.id);
          },
          rightOnTap: (){
            _pushAlbumPage(snapshot.data.last.id);
          },
        );
      },
    );
  }


  /// 更多列表
  Widget _moreListView(BuildContext context){
    return FutureBuilderWidget<List<SongItemModel>>(
      future: _recommendMoreFuture,

      successBuilder: (BuildContext context,AsyncSnapshot<List<SongItemModel>> snapshot){

        return Column(
          children: snapshot.data.map((value){

            return  MusicGestureDetector(
              child: CommentMoreItemWidget(title: value.name,),
              onTap: (){
                _pushAlbumPage(value.id);
              },
            );
            
              

          }).toList(),
        );
      },
    );
  }

  void _pushAlbumPage(id){
    Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return AlbumPage(id:id);
        }
    ));
  }


}

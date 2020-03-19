import 'package:flutter/material.dart';
import 'package:flutter_music/pages/album_page/album_header_widget.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/public_widget/music_item_widget.dart';
class AlbumPage extends StatefulWidget {
  AlbumPage({
    Key key,
    this.id
}) : super(key : key);
  final int id;
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {


  Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = MusicApi.songDetail(widget.id);
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: MusicStore.Theme.of(context).theme,
      appBar: MusicAppBar(
        leftIconData: Icons.keyboard_arrow_left,
        leftOnTap: (){
          Navigator.of(context).pop();
        },
        rightIconData: Icons.more_horiz,
        title: "歌单",
      ),
      body: FutureBuilderWidget<SongDetailModel>(
        future: _future,
        successBuilder: (BuildContext context, AsyncSnapshot<SongDetailModel> snapshot){
          SongDetailModel model  = snapshot.data;
          return ListView.builder(
            itemCount: model.tracks.length +1,
              itemBuilder: (context,index){
              if(index == 0){
                return AlbumHeaderWidget(
                  title: model.name,
                  desc: model.description,
                  coverImageUrl: model.coverImgUrl,
                );
              }

              return MusicItemWidget(
                title: model.tracks[index-1].name,
                subtTitle: model.tracks[index-1].arList.first.name + "-" + model.tracks[index-1].al.name,
                coverImageUrl: model.tracks[index-1].al.picUrl,
                heroTageName: model.tracks[index-1].id.toString(),
              );
            }
          );
        }
      )
    );
  }
}

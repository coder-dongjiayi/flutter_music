import 'package:flutter/material.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/pages/search_page/music_album_item_widget.dart';
import 'package:flutter_music/public_widget/music_item_widget.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/public_widget/music_title_widget.dart';
import 'package:flutter_music/pages/search_page/music_album_card_widget.dart';
class SearchResultWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  FutureBuilderWidget<Map>(
      future: MusicApi.search("海阔天空"),
      successBuilder: (BuildContext context, AsyncSnapshot<Map> snapshot){

        List songList = snapshot.data["song"]["songs"];
        List playList = snapshot.data["playList"]["playLists"];
        List albumList = snapshot.data["album"]["albums"];

        return ListView(

          children: <Widget>[
            MusicTitleWidget(
              title: "专辑",
            ),
            Container(
              width: double.infinity,
              height: ScreenAdapter.setWidth(340),
              child: ListView(
                padding: EdgeInsets.only(left: 20),
                scrollDirection:Axis.horizontal,
                children: _videoCarList(albumList)
              ),
            ),
            MusicTitleWidget(
              title: "单曲",
            ),
            Column(
              children: _songWidgetList(songList)
            ),
            MusicTitleWidget(
              title: "歌单",
            ),
            Column(
              children: _playWidgetList(playList),
            )
          ],
        );
      },
    );
  }


  ///单曲 列表
  List<MusicItemWidget> _songWidgetList(list){
    List<MusicItemWidget> songWidgetList =   List<MusicItemWidget>.generate(list.length, (index){
      TrackItemModel itemModel = TrackItemModel.fromJson(list[index]);

      return MusicItemWidget(
        onTap: (_){
          //   MusicStore.MusicPlayList(context).updatePlayList(snapshot.data, index-2);

//          Navigator.of(context).pushNamed(
//              RouterPageName.MusicPlayMeidaPage
//          );
        },
        index: itemModel.id,
        title: itemModel.name,
        subtTitle: itemModel.arList.first.name + "-" + itemModel.al.name,
        coverImageUrl: itemModel.al.picUrl,

      );

    });

    return  songWidgetList;
  }

  /// 歌单列表
  List<MusicAlbumItemWidget> _playWidgetList(list){

    List<MusicAlbumItemWidget> playWidgetList = List<MusicAlbumItemWidget>.generate(list.length, (index){
      PlayItemModel playItemModel =  PlayItemModel.fromJson(list[index]);
      return  MusicAlbumItemWidget(
        title: playItemModel.name,
        coverImageUrl: playItemModel.coverImgUrl,
        subTitle: playItemModel.trackCount.toString() + "首音乐，播放"+playItemModel.playCount.toString()+"次",

      );
    });
    return playWidgetList;
  }

  ///专辑列表
  List<MusicVideoCardWidget> _videoCarList(list){
    return   List<MusicVideoCardWidget>.generate(list.length, (index){
      PlayItemModel playItemModel =  PlayItemModel.fromJson(list[index]);
      return MusicVideoCardWidget(
        coverImageUrl: playItemModel.blurPicUrl,
        title: playItemModel.name,
      );
    });
  }
}

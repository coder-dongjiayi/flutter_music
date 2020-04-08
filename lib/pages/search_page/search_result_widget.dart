import 'package:flutter/material.dart';
import 'package:flutter_music/pages/search_page/music_album_item_widget.dart';
import 'package:flutter_music/public_widget/music_item_widget.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/public_widget/music_title_widget.dart';
import 'package:flutter_music/pages/search_page/music_album_card_widget.dart';
class SearchResultWidget extends StatelessWidget {
  String imageUrl = "http://p2.music.126.net/QHw-RuMwfQkmgtiyRpGs0Q==/102254581395219.jpg";

  @override
  Widget build(BuildContext context) {
    return  ListView(

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
            children: <Widget>[
              MusicVideoCardWidget(
                title: "这是专辑这是专辑这是专辑",
                coverImageUrl: imageUrl,
              ),
              MusicVideoCardWidget(
                title: "这是专辑",
                coverImageUrl: imageUrl,
              ),
              MusicVideoCardWidget(
                title: "这是专辑",
                coverImageUrl: imageUrl,
              ),
              MusicVideoCardWidget(
                title: "这是专辑",
                coverImageUrl: imageUrl,
              )
            ],
          ),
        ),
        MusicTitleWidget(
          title: "单曲",
        ),
        Column(
          children: <Widget>[
            MusicItemWidget(
              title: "我很快乐",
              subtTitle: "刘惜君-我很快乐",
              coverImageUrl: imageUrl,
            ),
            MusicItemWidget(
              title: "我很快乐",
              subtTitle: "刘惜君-我很快乐",
              coverImageUrl: imageUrl,
            ),
            MusicItemWidget(
              title: "我很快乐",
              subtTitle: "刘惜君-我很快乐",
              coverImageUrl: imageUrl,
            ),
            MusicItemWidget(
              title: "我很快乐",
              subtTitle: "刘惜君-我很快乐",
              coverImageUrl: imageUrl,
            )
          ],
        ),
        MusicTitleWidget(
          title: "歌单",
        ),
        Column(
          children: <Widget>[
            MusicAlbumItemWidget(
              coverImageUrl: imageUrl,
            ),
            MusicAlbumItemWidget(
              coverImageUrl: imageUrl,
            ),
            MusicAlbumItemWidget(
              coverImageUrl: imageUrl,
            ),
            MusicAlbumItemWidget(
              coverImageUrl: imageUrl,
            )
          ],
        )
      ],
    );
  }
}

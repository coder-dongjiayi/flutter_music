import 'package:flutter/material.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/browse/browse_banner_widget.dart';
import 'package:flutter_music/public_widget/music_item_widget.dart';

class BrowsePage extends StatefulWidget {
  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {

  var _itemList = [
    {
      "id":"1",
      "songName":"稀客",
      "artist":"杨千嬅 - 千嬅盛放",
      "coverImageUrl":"https://pic.xiami.net/images/collect/15510601/1132807781/2ddcdab6d5c140878aa211e29c366f84_e9d34e1fa0b64470a4791884b24e4d00.jpg?x-oss-process=image/quality,q_80"
    },
    {
      "id":"2",
      "songName":"Young For Tou",
      "artist":"GALA - 2的奉献",
      "coverImageUrl":"https://pic.xiami.net/images/collect/948/48/956234948_1565835648_FzHE.jpg?x-oss-process=image/quality,q_80"
    },
    {
      "id":"3",
      "songName":"我不是你的宋冬野",
      "artist":"林期得 - 我不是你的宋冬野",
      "coverImageUrl":"https://img.xiami.net/images/appv5/common/36051/5e5fca7378d94_LD8U_1583336051.jpg?x-oss-process=image/quality,q_80"
    },
    {
      "id":"4",
      "songName":"北京、北京",
      "artist":"郝云 - 北京",
      "coverImageUrl":"https://pic.xiami.net/images/album/img29/59/586525ffc9905_2961929_1483023871.jpg?x-oss-process=image/quality,q_80/format,jpg"
    },
    {
      "id":"5",
      "songName":"回到哈尔滨",
      "artist":"刘朋朋 - 刘同学",
      "coverImageUrl":"https://pic.xiami.net/images/album/img42/218842/2188421475218842.jpg?x-oss-process=image/quality,q_80/format,jpg"
    },
    {
      "id":"6",
      "songName":"你给我听好",
      "artist":"小鹿Morning",
      "coverImageUrl":"https://img.xiami.net/images/appv5/common/5599/5d2ee9cfb1e62_hWTU_1563355599.jpg?x-oss-process=image/quality,q_80"
    },
  ];


  @override
  Widget build(BuildContext context) {

    List<MusicItemWidget> _list = List<MusicItemWidget>.generate(_itemList.length, (int index){
      return MusicItemWidget(
        title: _itemList[index]["songName"],
        subtTitle: _itemList[index]["artist"],
        coverImageUrl: _itemList[index]["coverImageUrl"],
        heroTageName: _itemList[index]["id"],
      );
    });

    var _listView = <Widget>[];
    _listView.add(BrowseBannerWidget());
    _listView.add(_newSong(context));

    for(Widget widget in _list){
      _listView.add(widget);
    }

    return Scaffold(
      backgroundColor: MusicStore.Theme.of(context).theme,
      appBar: MusicAppBar(
        title: "浏览",
        rightIconData: Icons.search,
      ),
      body:  ListView(
        children: _listView
      )
    );
  }

  Widget _newSong(BuildContext context){

    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("新歌",

              style: TextStyle(color: MusicStore.Theme.of(context).titleColor,fontSize: 17)),
          Icon(Icons.arrow_forward,size: 20,color: MusicStore.Theme.of(context).goldenColor)
        ],
      ),
    );
  }
}

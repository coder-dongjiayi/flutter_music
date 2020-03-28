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

class _MusicListPageState extends State<MusicListPage> {
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
      "coverImageUrl":"https://pic.xiami.net/images/pages.album/img29/59/586525ffc9905_2961929_1483023871.jpg?x-oss-process=image/quality,q_80/format,jpg"
    },
    {
      "id":"5",
      "songName":"回到哈尔滨",
      "artist":"刘朋朋 - 刘同学",
      "coverImageUrl":"https://pic.xiami.net/images/pages.album/img42/218842/2188421475218842.jpg?x-oss-process=image/quality,q_80/format,jpg"
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
    ScreenAdapter.init(context);
    double _width =  ScreenAdapter.getScreenWidth()/4.0;


    return Scaffold(
      backgroundColor: MusicStore.Theme.of(context).theme,
      appBar: MusicAppBar(
        title: "播放列表",
        leftIconData: Icons.keyboard_arrow_left,
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

          itemCount: _itemList.length,
          itemBuilder: (context,index){

            return MusicItemWidget(
              onTap: (){

              },
              title: _itemList[index]["songName"],
              subtTitle: _itemList[index]["artist"],
              coverImageUrl: _itemList[index]["coverImageUrl"],
              heroTageName: _itemList[index]["id"],
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
          width: width,
          marginTop: 20,
          coverImageUrl: "https://pic.xiami.net/images/collect/15510601/1132807781/2ddcdab6d5c140878aa211e29c366f84_e9d34e1fa0b64470a4791884b24e4d00.jpg?x-oss-process=image/quality,q_80",
        ),
      ),
    );
  }
}

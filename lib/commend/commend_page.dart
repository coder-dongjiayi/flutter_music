import 'package:flutter/material.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';

import 'package:flutter_music/commend/comment_item_widget.dart';
import 'package:flutter_music/commend/comment_more_item_widget.dart';


class CommendPage extends StatefulWidget {
  @override
  _CommendPageState createState() => _CommendPageState();
}

class _CommendPageState extends State<CommendPage> {

  var _itemList = [
    {
      "title":"最新歌曲",
      "image1":"https://pic.xiami.net/images/album/img12/55712/240756431447234992.jpg?x-oss-process=image/quality,q_80/format,jpg",
      "image2":"https://pic.xiami.net/images/collect/736/36/48797736_55c3b39d7ffe2_tcuH_1438888861.jpg?x-oss-process=image/quality,q_80"
    },
    {
      "title":"你可能喜欢",
      "image1":"https://pic.xiami.net/images/album/img87/181/585a3226db20e_9076087_1482306086.jpg?x-oss-process=image/quality,q_80/format,jpg",
      "image2":"https://pic.xiami.net/images/collect/798/98/40766798_1422781019_EMFS.jpeg?x-oss-process=image/quality,q_80"
    }
  ];



  @override
  Widget build(BuildContext context) {

    List<Widget> _listWidget = List<CommentItemWidget>.generate(_itemList.length, (int index){

      return CommentItemWidget(
        title: _itemList[index]["title"],
        imageUrl1: _itemList[index]["image1"],
        imageUrl2: _itemList[index]["image2"],
      );
    });


    return Scaffold(
      backgroundColor:MusicStore.Theme.of(context).theme,
      appBar: MusicAppBar(
        title: "推荐",
        rightIconData: Icons.person_pin,
      ),

      body: ListView(
        children: <Widget>[
          _listWidget[0],
          _listWidget[1],
          _more(context),
          CommentMoreItemWidget(title: "发现好听的国语歌曲"),
          CommentMoreItemWidget(title: "让您心动的旋律"),
          CommentMoreItemWidget(title: "一日看尽长安花")

        ],
      ),

    );
  }

  Widget _more(BuildContext context){

    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("更多",

              style: TextStyle(color: MusicStore.Theme.of(context).titleColor,fontSize: 17)),
          Icon(Icons.arrow_forward,size: 20,color: MusicStore.Theme.of(context).goldenColor)
        ],
      ),
    );
  }
}

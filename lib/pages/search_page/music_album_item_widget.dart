import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
class MusicAlbumItemWidget extends StatelessWidget {
  MusicAlbumItemWidget({
    Key key,
    this.coverImageUrl

}):super(key : key);
  final String coverImageUrl;
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: Row(
        children: <Widget>[
          _itemCover(context),
          Expanded(
            flex: 1,
            child: _itemTitle(context,"失恋必听歌单|因为你突然听懂了|因为你突然听懂了","185首音乐by不如喜欢我- 播放1亿次185首音乐by不如喜欢我- 播放1亿次"),
          )
        ],
      ),
    );
  }

  Widget _itemTitle(context,title,subtTitle) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$title",
            maxLines: 2,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: MusicStore.Theme(context).titleColor),
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "$subtTitle",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 10,
                    color: MusicStore.Theme(context).subtTitleColor),
              ))
        ],
      ),
    );
  }


  Widget _itemCover(context) {

    return Container(
        width: ScreenAdapter.setWidth(180),
        height: ScreenAdapter.setHeight(180),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:  MusicStore.Theme(context).topShadowColor,
            boxShadow: MusicStore.boxShow(context, -10, 10)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: "$coverImageUrl",
              fit: BoxFit.cover,
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_music/common/music_store.dart';
class MusicVideoCardWidget extends StatelessWidget {
  MusicVideoCardWidget({
    Key key,
    this.coverImageUrl,
    this.title
}):super(key :key);
  final String coverImageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
        width: ScreenAdapter.setWidth(280),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: MusicStore.Theme(context).theme,
          boxShadow: MusicStore.boxShow(context, -2, 8)
        ),
      child: Column(
        children: <Widget>[
          _coverImage(),
          _title(context)
        ],
      ),

    );
  }
  Widget _title(context){

    return Padding(
      padding: EdgeInsets.only(top: 8,left: 5,right: 5),
      child: Text(
        "$title",
        maxLines: 1,
        style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: MusicStore.Theme(context).titleColor),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
  Widget _coverImage(){
    return SizedBox(
      width: ScreenAdapter.setWidth(280),
      height:ScreenAdapter.setWidth(220),
      child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
          child: CachedNetworkImage(
            imageUrl: "$coverImageUrl",
            fit: BoxFit.cover,
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:flutter_music/public_widget/music_button.dart';

typedef GestureTapCallback = void Function(int index);

class MusicItemWidget extends StatelessWidget {
  MusicItemWidget(
      {Key key,
      this.index,
      this.id,
      this.title,
      this.subtTitle,
      this.coverImageUrl,
      this.onTap})
      : super(key: key);

  final String title;
  final String subtTitle;
  final String coverImageUrl;

  final int id;
  final int index;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return GestureDetector(
        onTap: () {
          Vibrate.feedback(FeedbackType.selection);
          onTap(index);
        },
        child: _musicItem(context));
  }

  Widget _musicItem(context) {
    MusicGlobalPlayListState musicGlobalPlayListState = MusicStore.MusicPlayList(context);


    bool _selected = false;

    if(MusicStore.MusicPlayList(context).currentPlayList.length > 0){
     _selected = musicGlobalPlayListState.currentTrackItem.id == id;
    }

    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      decoration:
          BoxDecoration(
              color: MusicStore.Theme(context).theme,
              boxShadow: _selected == false ? null : MusicStore.boxShow(context, -10,10)

          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _itemCover(context,_selected),
          Expanded(
            flex: 1,
            child: _itemTitle(context),
          ),
          MusicButton(
            showLayer: !_selected,
            normalIconData: Icons.play_arrow,
            isEnable: false,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          )
//            _itemPlay(context)
        ],
      ),
    );
  }

  Widget _itemCover(context,selected) {


    String _coverImageURL = coverImageUrl  + "?param="+"120"+"y"+"120";

    double margin = selected == false ? 0 : 5;

    return Container(
        width: ScreenAdapter.setWidth(selected==true ? 100 : 120),
        height: ScreenAdapter.setHeight(selected==true ? 100 : 120),
        margin: EdgeInsets.fromLTRB(margin, margin, margin, margin),
        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:  MusicStore.Theme(context).topShadowColor,
            boxShadow: MusicStore.boxShow(context, -10, 10)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: "$_coverImageURL",
              fit: BoxFit.cover,
            )));
  }

  Widget _itemTitle(context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$title",
            maxLines: 2,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: MusicStore.Theme(context).titleColor),
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
              padding: EdgeInsets.only(top: 3, right: 60),
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
}

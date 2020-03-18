import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

class MusicTitleWidget extends StatelessWidget {
  MusicTitleWidget({
    Key key,
    this.title

}) : super(key:key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("$title",
              style: TextStyle(color: MusicStore.Theme.of(context).titleColor,fontSize: 17)),
          Icon(Icons.arrow_forward,size: 20,color: MusicStore.Theme.of(context).goldenColor)
        ],
      ),
    );
  }
}

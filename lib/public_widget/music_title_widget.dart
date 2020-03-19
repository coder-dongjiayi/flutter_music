import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

class MusicTitleWidget extends StatelessWidget {
  MusicTitleWidget({
    Key key,
    this.title,
    this.padding : const EdgeInsets.fromLTRB(20, 20, 20, 20)

}) : super(key:key);
  final String title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
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

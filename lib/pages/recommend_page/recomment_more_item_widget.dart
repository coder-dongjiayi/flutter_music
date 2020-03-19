import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

class CommentMoreItemWidget extends StatelessWidget {
  CommentMoreItemWidget({
    Key key,
    this.title

}):super(key:key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MusicStore.Theme.of(context).theme,
            boxShadow: [
              BoxShadow(color:MusicStore.Theme.of(context).shadowColor,offset: Offset(10,10),blurRadius: 10),
              BoxShadow(color: Colors.white,offset: Offset(-10,-10),blurRadius: 26)
            ]

        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text("${title}",style: TextStyle(fontSize: 14,color: MusicStore.Theme.of(context).titleColor),),
          ),
          Icon(Icons.keyboard_arrow_right,size: 20,color: MusicStore.Theme.of(context).titleColor)
        ],
      ),
    );
  }
}

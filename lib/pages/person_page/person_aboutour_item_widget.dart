import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
class PersonAboutourItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 100, 20, 20),
        padding: EdgeInsets.fromLTRB(20, 12, 10, 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MusicStore.Theme(context).theme,
            boxShadow: MusicStore.boxShow(context, -10,10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("关于我们" ,style: TextStyle(color: MusicStore.Theme(context).titleColor),),
            Icon(Icons.keyboard_arrow_right,color: MusicStore.Theme(context).titleColor,)
          ],
        )
    );
  }
}

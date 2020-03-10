import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_global.dart';

class MusicTabItem extends StatelessWidget {
  MusicTabItem({
    Key key,
    this.index,
    this.animation,
    this.title,
    this.iconData,
    this.normalColor,
    this.selectedColor,
    this.onTap
  }) : super(key:key);

  final int index;

  final IconData iconData;

  final Color normalColor;

  final Color selectedColor;

  final String title;

  final ValueChanged<int> onTap;

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        onTap(index);

      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MusicGlobal.light,
            boxShadow: [
              BoxShadow(color:MusicGlobal.shadowColor,offset: Offset(5,5),blurRadius: 10),
              BoxShadow(color: Colors.white,offset: Offset(-5,-5),blurRadius: 26)
            ]
        ),
        child: Row(
          children: <Widget>[
            Icon(iconData,color: normalColor),
            SizedBox(
              width: animation.value,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("${title}",style: TextStyle(color:MusicGlobal.textColor, fontSize: 14,),maxLines: 1,overflow: TextOverflow.clip),
              ),

            )
          ],
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

class MusicTabItem extends StatelessWidget {
  MusicTabItem({
    Key key,
    this.index,
    this.animation,

    this.animationController,
    this.title,
    this.iconData,
    this.normalColor,
    this.selectedColor,
    this.colorTween,
    this.onTap
  }) : super(key:key);

  final int index;

  final IconData iconData;

  final Color normalColor;

  final Color selectedColor;

  final ColorTween colorTween;

  final String title;

  final ValueChanged<int> onTap;

  final Animation<double> animation;

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {


   Animation colorAnimation =  Tween<double>(begin: 0.0,end: 1.0).animate(animationController);

    final iconColor = colorTween.evaluate(colorAnimation);

    return InkWell(
      onTap: (){
        onTap(index);

      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MusicStore.Theme.of(context).theme,
            boxShadow: [
              BoxShadow(color:MusicStore.Theme.of(context).shadowColor,offset: Offset(5,5),blurRadius: 10),
              BoxShadow(color: Colors.white,offset: Offset(-2,-2),blurRadius: 4)
            ]
        ),
        child: Row(
          children: <Widget>[
            Icon(iconData,color: iconColor),
            SizedBox(
              width: animation.value,
              child: Text(
                  "${title}",
                  style: TextStyle(
                    color:MusicStore.Theme.of(context).titleColor,
                    fontSize: 14,
                  ),
                  textAlign:TextAlign.center,
                  maxLines: 1,

                  overflow: TextOverflow.clip)

            )
          ],
        ),
      ),
    );
  }
}



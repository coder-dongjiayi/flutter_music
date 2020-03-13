import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

typedef GestureTapCallback = void Function();

class MusicButtonWidget extends StatelessWidget {

  MusicButtonWidget({
    Key key,
    this.iconData,
    this.onTap,
    this.padding : const EdgeInsets.fromLTRB(10, 10, 10, 10),
    this.margin :  const EdgeInsets.fromLTRB(0, 0, 0, 0),
    this.size : 20
  }): super(key:key);

  final IconData iconData;
  final GestureTapCallback onTap;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final  double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        if(onTap != null){
          onTap();
        }
      },
      child: _icon(context),
    );
  }

  Widget _icon(BuildContext context) {
    return Container(

      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MusicStore.Theme
              .of(context)
              .theme,
          boxShadow: [
            BoxShadow(color: MusicStore.Theme
                .of(context)
                .shadowColor, offset: Offset(10, 10), blurRadius: 15),
            BoxShadow(
                color: Colors.white, offset: Offset(-10, -10), blurRadius: 20)
          ]
      ),
      child: Icon(iconData, size: size, color: MusicStore.Theme
          .of(context)
          .titleColor),
    );
  }
}

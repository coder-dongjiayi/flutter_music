import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

typedef GestureTapCallback = void Function();

class MusicButtonWidget extends StatelessWidget {

  MusicButtonWidget({Key key,this.iconData,this.onTap}): super(key:key);

  final IconData iconData;
  final GestureTapCallback onTap;

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
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MusicStore.Theme
              .of(context)
              .theme,
          boxShadow: [
            BoxShadow(color: MusicStore.Theme
                .of(context)
                .shadowColor, offset: Offset(6, 6), blurRadius: 3),
            BoxShadow(
                color: Colors.white, offset: Offset(-5, -5), blurRadius: 26)
          ]
      ),
      child: Icon(iconData, size: 20, color: MusicStore.Theme
          .of(context)
          .titleColor),
    );
  }
}

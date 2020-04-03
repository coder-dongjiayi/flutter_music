import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
typedef GestureTapCallback = void Function();

class MusicSubmitButton extends StatelessWidget {
  MusicSubmitButton({
    this.onTap,
    this.title,
    this.margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),

    Key key
}): super(key :key);

  final GestureTapCallback onTap;
  final String title;
  final EdgeInsets  margin;

  @override
  Widget build(BuildContext context) {
    return MusicGestureDetector(
      onTap: this.onTap,
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 15,bottom: 15),
          margin:this.margin,
          child: Text("$title",textAlign: TextAlign.center,
            style: TextStyle(color: MusicStore.Theme.of(context).titleColor,fontWeight: FontWeight.w600,fontSize: 17),),
          decoration:
          BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MusicStore.Theme.of(context).theme,
              boxShadow: [
                BoxShadow(
                    color: MusicStore.Theme.of(context).shadowColor,
                    offset: Offset(10, 10),
                    blurRadius: 10),
                BoxShadow(
                    color: Colors.white, offset: Offset(-10, -10), blurRadius: 26)
              ])

      ),
    );
  }
}

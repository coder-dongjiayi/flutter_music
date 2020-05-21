import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

typedef GestureTapCallback = void Function();
class MusicGestureDetector extends StatelessWidget {

  MusicGestureDetector({
    Key key,
    this.onTap,
    this.child

}) :super(key: key);

  final GestureTapCallback onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: (){
        if(onTap != null){
          if(MusicStore.isVibrate){
            Vibrate.feedback(FeedbackType.impact);
          }

          onTap();
        }
      },
    );
  }
}

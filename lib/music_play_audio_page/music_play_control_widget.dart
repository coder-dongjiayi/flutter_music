import 'package:flutter/material.dart';
import 'package:flutter_music/public_widget/music_button.dart';

typedef GestureTapCallback = void Function();

typedef GestureStateTapCallback = void Function(bool selected);

class MusicPlayControlWidget extends StatelessWidget {



  MusicPlayControlWidget({
    Key key,
    this.previousTap,
    this.nextTap,
    this.stateTap
    }) : super(key : key);

  final GestureTapCallback previousTap;
  final GestureTapCallback nextTap;
  final  GestureStateTapCallback stateTap;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MusicButton(
            normalIconData:Icons.skip_previous,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),

            size: 30,
          ),
          MusicButton(
            normalIconData:Icons.play_arrow,
            selectedIconData: Icons.pause,
            onTap: (selected){
                stateTap(selected);
            },
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            margin: EdgeInsets.only(left: 50,right: 50),
            size: 30,
          ),
          MusicButton(
            normalIconData:Icons.skip_next,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            size: 30,
          ),
        ],
      ),
    );
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/common/state/music_global_play_list_state.dart';
import 'package:flutter_music/public_widget/music_button.dart';
import 'package:flutter_music/common/music_store.dart';
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
    MusicGlobalPlayListState musicGlobalPlayListState = MusicStore.MusicPlayList(context);

    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MusicButton(
            normalIconData:Icons.skip_previous,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            onTap: (selected){
              previousTap();
            },
            size: 30,
          ),
          MusicButton(

            selected: musicGlobalPlayListState.playerState == AudioPlayerState.PAUSED ? true : false,
            selectedIconData:Icons.play_arrow,
            normalIconData: Icons.pause,
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
            onTap: (selected){
              nextTap();
            },
          ),
        ],
      ),
    );
  }
}

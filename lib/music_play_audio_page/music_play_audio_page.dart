import 'package:flutter/material.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/music_play_audio_page/music_play_slider_widget.dart';
import 'package:flutter_music/music_play_audio_page/music_play_info_widget.dart';
import 'package:flutter_music/music_play_audio_page/music_play_control_widget.dart';
import 'package:flutter_music/music_play_audio_page/music_play_bottom_widget.dart';

class MusicPlayAudioPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: MusicStore.Theme.of(context).theme,
      appBar: MusicAppBar(
        title: "",
        leftIconData: Icons.keyboard_arrow_left,
        rightIconData: Icons.more_horiz,
        leftOnTap: (){
          Navigator.of(context).pop();
        },

      ),

      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _play(),
            Positioned(
              bottom: 40,
              right: 0,
              left: 0,
              child: MusicPlayBottomWidget(),
            )
          ],
        ),
      )
    );
  }

  Widget _play(){
  return  Padding(
    padding: EdgeInsets.only(top: 50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        MusicPlayInfoWidget(),
        MusicPlayControlWidget(),
        MusicPlaySliderWidget()
      ],
    ),
  );
  }
}

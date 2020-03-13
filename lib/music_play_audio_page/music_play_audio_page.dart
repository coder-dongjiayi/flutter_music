import 'package:flutter/material.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/public_widget/music_button_widget.dart';
import 'package:flutter_music/music_play_audio_page/music_play_info_widget.dart';

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

      body: Padding(
        padding: EdgeInsets.only(top: 90),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              MusicPlayInfoWidget()
            ],
          ),
        ),
      )
    );
  }
}

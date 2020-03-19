import 'package:flutter/material.dart';
import 'package:flutter_music/public_widget/music_button.dart';
import 'package:flutter_music/pages/music_play_media_page/music_list_page/music_list_page.dart';


class MusicPlayBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MusicButton(
          normalIconData: Icons.video_library,
          size: 15,
          margin: EdgeInsets.only(right: 30),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          onTap: (selected){



          },
        ),
        MusicButton(
          normalIconData: Icons.format_list_bulleted,
          size: 15,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          margin: EdgeInsets.only(left: 30),
          onTap: (selected){
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return MusicListPage();
                }
            ));
          },
        )
      ],
    );
  }
}

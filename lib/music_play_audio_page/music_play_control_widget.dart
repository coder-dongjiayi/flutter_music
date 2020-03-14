import 'package:flutter/material.dart';
import 'package:flutter_music/public_widget/music_button_widget.dart';

class MusicPlayControlWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MusicButtonWidget(
            iconData:Icons.skip_previous,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),

            size: 30,
          ),
          MusicButtonWidget(
            iconData:Icons.play_arrow,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            margin: EdgeInsets.only(left: 50,right: 50),
            size: 30,
          ),
          MusicButtonWidget(
            iconData:Icons.skip_next,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            size: 30,
          ),
        ],
      ),
    );
  }
}

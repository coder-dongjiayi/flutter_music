import 'package:flutter/material.dart';
import 'package:flutter_music/public_widget/music_button_widget.dart';

class MusicPlayBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MusicButtonWidget(
          iconData: Icons.airplay,
          size: 15,
          margin: EdgeInsets.only(right: 30),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        ),
        MusicButtonWidget(
          iconData: Icons.format_list_bulleted,
          size: 15,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          margin: EdgeInsets.only(left: 30),
        )
      ],
    );
  }
}

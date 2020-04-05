

import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:vibrate/vibrate.dart';

class LibraryEmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text1(context),
          _text2(context),
          _createPlayList(context)
        ],
      ),
    );
  }

  Widget _text1(BuildContext context){
    return Text("欢迎来到Muisc",style: TextStyle(fontSize: 14,color: MusicStore.Theme(context).titleColor),);

  }
  Widget _text2(BuildContext context){

    return Padding(
      padding: EdgeInsets.only(top: 5,bottom: 30),
      child: Text("开始创建你的歌单吧",style: TextStyle(fontSize: 12,color: MusicStore.Theme(context).titleColor),),
    );

  }

  Widget _createPlayList(BuildContext context){
    return GestureDetector(
      onTap: (){
        Vibrate.feedback(FeedbackType.selection);
        Navigator.of(context).pushNamed("/new_library_page");
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 15,bottom: 15),
        margin: EdgeInsets.fromLTRB(20, 30, 20, 0),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MusicStore.Theme(context).theme,
            boxShadow: MusicStore.boxShow(context, -10,10)

        ),
        child: Text("创建歌单",style: TextStyle(fontSize: 14,color: MusicStore.Theme(context).titleColor),),
      ),
    );
  }

}

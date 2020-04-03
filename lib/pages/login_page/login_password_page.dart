import 'package:flutter/material.dart';
import 'package:flutter_music/base_music/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/public_widget/music_submit_button.dart';
class LoginPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MusicScaffold(
      appBar: MusicAppBar(
        title: "手机号登录",
        rightIconData: Icons.arrow_back,
        rightOnTap: (){
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("App并不会劫持你的用户信息,请放心输入",style: TextStyle(color: MusicStore.Theme.of(context).subtTitleColor,fontSize: 12),),

            _password(context),
            MusicSubmitButton(
              onTap: (){

              },
              title: "登录",

            )
          ],
        ),
      ),
    );
  }

  Widget _password(context){
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      //height: ScreenAdapter.setHeight(100),
      decoration: BoxDecoration(

          border: Border(
              bottom: BorderSide(width: 1,color: MusicStore.Theme.of(context).shadowColor)
          )
      ),
      child: TextField(

          autofocus: true,
          obscureText:true,
          style: TextStyle(fontSize: 17),

          decoration:InputDecoration(
              hintText: "请输入密码",
              hintStyle: TextStyle(color: MusicStore.Theme.of(context).subtTitleColor),
              border: InputBorder.none
          )
      ),
    );
  }
}


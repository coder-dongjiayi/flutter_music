import 'package:flutter/material.dart';
import 'package:flutter_music/base_music/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/public_widget/music_submit_button.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return MusicScaffold(

      appBar: MusicAppBar(
        rightIconData: Icons.clear,
        title: "手机号登录",
        rightOnTap: (){
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("请使用网易云音乐注册的手机号进行登录",style: TextStyle(color: MusicStore.Theme.of(context).subtTitleColor,fontSize: 12),),

            _mobile(context),
            MusicSubmitButton(
              onTap: (){
                Navigator.of(context).pushNamed(RouterPageName.LoginPasswordPage);
              },
              title: "下一步",
            )

          ],
        ),
      )
    );
  }

  Widget _mobile(context){
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      //height: ScreenAdapter.setHeight(100),
      decoration: BoxDecoration(

        border: Border(
          bottom: BorderSide(width: 1,color: MusicStore.Theme.of(context).shadowColor)
        )
      ),
      child: Row(
        children: <Widget>[
         Padding(
           padding: EdgeInsets.only(right: 10),
           child:  Text("+86",style: TextStyle(fontSize: 20),),
         ),
          Expanded(
            flex: 1,
            child: TextField(

              autofocus: true,
              style: TextStyle(fontSize: 17),
              keyboardType: TextInputType.number,
                decoration:InputDecoration(
                  hintText: "请输入手机号",
                    hintStyle: TextStyle(color: MusicStore.Theme.of(context).subtTitleColor),
                    border: InputBorder.none
                )
            ),
          )
        ],
      ),
    );
  }
}

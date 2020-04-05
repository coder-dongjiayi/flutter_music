import 'package:flutter/material.dart';
import 'package:flutter_music/base_music/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/public_widget/music_submit_button.dart';
import 'package:flutter_music/pages/person_page/person_switch_item_widget.dart';
import 'package:flutter_music/pages/person_page/person_aboutour_item_widget.dart';
class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {

  @override
  Widget build(BuildContext context) {

    return MusicScaffold(
      appBar: MusicAppBar(
        title: MusicStore.User.of(context).user.nickname,
        rightIconData: Icons.chevron_left,
        rightOnTap: (){
        Navigator.of(context).pop();
        },
      ),

      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[

              _text("默认情况下触摸按钮会有震动反馈，您可以手动关闭震动效果"),
              PersonSwitchItemWidget(
                onChanged: (state){
                  MusicStore.saveVibrate(state);
                },
                value: MusicStore.isVibrate,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                title: "触摸反馈",
              ),
              _text("主题模式默认会随着操作系统的变化而变化，您也可以手动改变主题模式"),
              PersonSwitchItemWidget(
                onChanged: (state){
                  MusicStore.Theme.of(context).switchTheme();
                },
                value: MusicStore.Theme.of(context).isDarkTheme,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                title: "深色模式",
              ),

              PersonAboutourItemWidget()

            ],
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: _exitBottom(),
          )
        ],
      ),
    );
  }



  Widget _text(text){
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 50, 20, 0),
      child: Text("$text",
        textAlign: TextAlign.left,
        style: TextStyle(color: MusicStore.Theme.of(context).subtTitleColor,fontSize: 11),
      ),
    );
  }

  Widget _exitBottom(){
    return MusicSubmitButton<int>(
        onTap: (state){
          state.requestFuture(MusicApi.logout());
        },
        successCallback: (succcess){
          if(succcess == 1){
            MusicStore.User.of(context).logoOut();

            MusicGlobalPlayListState.musicPlayState(context).music_clear();

            Navigator.of(context).pop();
          }else{
            FlutterFlexibleToast.showToast(
                message: "退出失败,请重试",
                toastLength: Toast.LENGTH_SHORT,
                toastGravity: ToastGravity.TOP,
                backgroundColor: Colors.red,
                icon: ICON.WARNING,
                timeInSeconds: 2);
          }
        },
        margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
        backGroundColor: Colors.red,
        titleStyle: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),
        title: "退出登录",
        loadingText: "正在退出...",
        loadingStyle: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),
    );
  }
}

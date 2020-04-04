import 'package:flutter/material.dart';
import 'package:flutter_music/base_music/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/public_widget/music_submit_button.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController editingController;
  bool _isEnable = false;
  @override
  void initState() {
    // TODO: implement initState
    editingController = TextEditingController();
    editingController.addListener((){
      _verifyMobile(editingController.text);
    });
    super.initState();
  }
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    editingController.dispose();
  }

  void _verifyMobile(String mobile){
    if(mobile.length ==0) return;

    if(mobile.substring(0,1) == "1" && mobile.length == 11){
      setState(() {
        _isEnable = true;
      });
    }else{
      setState(() {
        _isEnable = false;
      });
    }
  }
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

              MusicSubmitButton<String>(

                isEnable: _isEnable,

                successCallback: (String nickName){
                 if(nickName == null){
                   FlutterFlexibleToast.showToast(
                       message: "手机号未注册",
                       toastLength: Toast.LENGTH_SHORT,
                       toastGravity: ToastGravity.TOP,
                       backgroundColor: Colors.red,
                       icon: ICON.WARNING,
                       timeInSeconds: 2);

                 } else{
                   Navigator.of(context).pushNamed(RouterPageName.LoginPasswordPage,arguments: {"nickName":nickName,"mobile":editingController.text});
                 }
                },

                filedCallback: (Object error){

                },

                onTap: (state){
                  state.requestFuture(MusicApi.existenceMobile(editingController.text));
                },
                loadingText: "正在验证手机号",
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
                controller: editingController,
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




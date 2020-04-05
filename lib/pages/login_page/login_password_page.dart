import 'package:flutter/material.dart';
import 'package:flutter_music/base_music/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/models/user_model.dart';
import 'package:flutter_music/public_widget/music_submit_button.dart';


class LoginPasswordPage extends StatefulWidget {
  LoginPasswordPage({
    Key key,
    this.nickName,
    this.mobile

  }): super(key:key);

  final String nickName;
  final String mobile;

  @override
  _LoginPasswordPageState createState() => _LoginPasswordPageState();
}

class _LoginPasswordPageState extends State<LoginPasswordPage> {


  TextEditingController editingController;

  bool _isEnable = false;
  @override
  void initState() {
    // TODO: implement initState


    super.initState();
    editingController = TextEditingController();

    editingController.addListener((){
      if(editingController.text.length > 0 && _isEnable == false){
        setState(() {
          _isEnable = true;
        });
      }
      if(editingController.text.length == 0){
        setState(() {
          _isEnable = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    editingController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MusicScaffold(
      appBar: MusicAppBar(
        title: "手机号登录",
        rightIconData: Icons.chevron_left,
        rightOnTap: (){
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.nickName + " 你好",style: TextStyle(color: MusicStore.Theme.of(context).subtTitleColor,fontSize: 12),),

            _password(context),
            MusicSubmitButton<UserModel>(
              isEnable: _isEnable,

              successCallback: (userModel){

                if(userModel == null){
                  FlutterFlexibleToast.showToast(
                      message: "密码错误",
                      toastLength: Toast.LENGTH_SHORT,
                      toastGravity: ToastGravity.TOP,
                      backgroundColor: Colors.red,
                      icon: ICON.WARNING,
                      timeInSeconds: 2);
                }else{
                  FlutterFlexibleToast.showToast(
                      message: "欢迎来到iMusic",
                      toastLength: Toast.LENGTH_SHORT,
                      toastGravity: ToastGravity.TOP,
                      backgroundColor: Colors.greenAccent,
                      icon: ICON.SUCCESS,
                      timeInSeconds: 5);

                  MusicStore.User.of(context).setUser(userModel);

                  Navigator.of(context).popUntil(ModalRoute.withName(RouterPageName.initialRoute));
                }


              },


              onTap: (state){
                state.requestFuture(MusicApi.login(widget.mobile, editingController.text));

              },
              title: "登录",
              loadingText: "正在登录...",

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
              bottom: BorderSide(width: 1,color: MusicStore.Theme.of(context).bottomShadowColor)
          )
      ),
      child: TextField(

        controller: editingController,
          autofocus: true,
          obscureText:true,
          style: TextStyle(fontSize: 17,color: MusicStore.Theme.of(context).textFieldColor),

          decoration:InputDecoration(
              hintText: "请输入密码",
              hintStyle: TextStyle(color: MusicStore.Theme.of(context).textFieldColor),
              border: InputBorder.none
          )
      ),
    );
  }
}





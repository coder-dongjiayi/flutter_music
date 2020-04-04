import 'dart:convert';

class UserModel {
  int userId;
  String avatarUrl;
  String nickname;
  String backgroundUrl;
  String token;
  UserModel({
    this.userId,
    this.avatarUrl,
    this.nickname,
    this.backgroundUrl});

  UserModel.fromJson(Map<String, dynamic> json){

      if(json["profile"] != null){
        userId = json["profile"]["userId"];
        nickname = json["profile"]["nickname"];
        backgroundUrl = json["profile"]["backgroundUrl"];
        avatarUrl = json["profile"]["avatarUrl"];
      }
      token = json["token"];


  }
  String toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    data["backgroundUrl"] = this.backgroundUrl;
    data["avatarUrl"] = this.avatarUrl;

    final Map<String,dynamic> result = new Map();
    result["profile"] = data;
    result["token"] = this.token;
    return json.encode(result);

  }
}
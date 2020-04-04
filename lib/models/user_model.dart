class UserModel {
  int userId;
  String avatarUrl;
  String nickname;
  String backgroundUrl;
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


  }
}
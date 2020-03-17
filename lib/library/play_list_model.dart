
class PlayListModel{

 List<PlayItemModel> playlist;

 PlayListModel({this.playlist});

 PlayListModel.fromJson(Map<String, dynamic> json){
   if(json["playlist"] != null){

     playlist = new List<PlayItemModel>();
     json["playlist"].forEach((v){
       PlayItemModel itemModel = PlayItemModel.fromJson(v);
       playlist.add(itemModel);
     });
   }
 }
}

class PlayItemModel{

  String coverImgUrl;

  String name;

  int id;

  String description;

  PlayItemModel({
    this.coverImgUrl,
    this.name,
    this.id
  });
  PlayItemModel.fromJson(Map<String,dynamic> json){
    coverImgUrl = json["coverImgUrl"];
    name        = json["name"];
    id          = json["id"];
    description = json["description"] ?? "";
  }


}

class PlayListModel{

 List<PlayItemModel> playlist;

 PlayListModel({this.playlist});

 PlayListModel.fromJson(Map<String, dynamic> json,String keyString){
   if(json[keyString] != null){

     playlist = new List<PlayItemModel>();
     json[keyString].forEach((v){
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

  bool selected;

  bool slideEnd;

  PlayItemModel({
    this.coverImgUrl,
    this.name,
    this.id,
    this.selected
  });
  PlayItemModel.fromJson(Map<String,dynamic> json){
    selected = false;
    slideEnd = false;
    coverImgUrl = json["coverImgUrl"];

    name        = json["name"];
    id          = json["id"];
    description = json["description"] ?? "";
  }


}
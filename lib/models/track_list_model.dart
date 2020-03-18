class TrackListModel{

  List<TrackItemModel> trackList;
  TrackListModel.fromJson(Map<String,dynamic> json){

    if(json["playlist"]["tracks"] != null){
      trackList = new List<TrackItemModel>();
      json["playlist"]["tracks"].forEach((v){
        TrackItemModel itemModel = TrackItemModel.fromJson(v);
        trackList.add(itemModel);
      });
    }
  }
}

class TrackItemModel{
  String name;
  int id;
  List<TrackArAlModel> arList;
  TrackArAlModel al;

  TrackItemModel({
    this.name,
    this.arList,
    this.al
  });
  TrackItemModel.fromJson(Map<String,dynamic> json){

    name = json["name"];
    id = json["id"];
    al = TrackArAlModel.fromJson(json["al"]);
    if(json["ar"] != null){
      arList = new List<TrackArAlModel>();
      json["ar"].forEach((v){
        TrackArAlModel itemModel = TrackArAlModel.fromJson(v);
        arList.add(itemModel);
      });

    }
  }
}

class TrackArAlModel{
  int id;
  String name;
  String picUrl;

  TrackArAlModel({
    this.id,
    this.name,
    this.picUrl
});
  TrackArAlModel.fromJson(Map<String,dynamic> json){
    id = json["id"];
    name = json["name"];
    picUrl = json["picUrl"];

  }

}
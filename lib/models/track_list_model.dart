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

  MusicItemModel musicItemModel;

  TrackArAlModel al;

  TrackItemModel({
    this.name,
    this.arList,
    this.al,
    this.musicItemModel
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

class MusicItemModel{
  int id;
  String url;
  int size;
  MusicItemModel({
    this.id,
    this.url : "",
    this.size
  });
  MusicItemModel.fromJson(Map<String,dynamic> json){
    this.id = json["id"];
    this.url = json["url"];
    this.size = json["size"];
  }

}
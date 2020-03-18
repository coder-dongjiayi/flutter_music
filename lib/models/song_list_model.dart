
class SongListModel{

  List<SongItemModel> songList;

  SongListModel({this.songList});

  SongListModel.fromJson(Map<String, dynamic> json){
    if(json["result"] != null){

      songList = new List<SongItemModel>();
      json["result"].forEach((v){
        SongItemModel itemModel = SongItemModel.fromJson(v);
        songList.add(itemModel);
      });
    }

  }
}
class SongItemModel{
  int id;
  String name;
  String copywriter;
  String picUrl;


  SongItemModel({
    this.id,
    this.name,
    this.copywriter,
    this.picUrl,

  });

  SongItemModel.fromJson(Map<String,dynamic> json){
    id = json["id"];
    name = json["name"];
    copywriter = json["copywriter"];
    picUrl = json["picUrl"];

  }

}
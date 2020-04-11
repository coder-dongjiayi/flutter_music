
import 'package:flutter_music/models/track_list_model.dart';

class SongDetailModel{

  String description;
  String coverImgUrl;
  String name;
  List<String> tags;

  List<TrackItemModel> tracks;
  SongDetailModel({
    this.description,
    this.coverImgUrl,
    this.name,
    this.tags,
    this.tracks
  });

  SongDetailModel.fromJson(Map<String,dynamic> json){
    description = json["description"] ?? "";
    coverImgUrl = json["coverImgUrl"];
    name        = json["name"];


    if(json["tracks"] != null){
      tracks = List<TrackItemModel>();
      json["tracks"].forEach((v){
        tracks.add(TrackItemModel.fromJson(v));
      });
    }
  }

}

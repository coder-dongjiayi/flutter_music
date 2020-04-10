class SearchHotListModel {

  List<SearchHotItemModel> hotList;
  SearchHotListModel({
    this.hotList
});
  SearchHotListModel.fromJson(Map<String, dynamic> json){
    if(json["data"] != null){

      hotList = new List<SearchHotItemModel>();
      json["data"].forEach((v){
        SearchHotItemModel itemModel = SearchHotItemModel.fromJson(v);
        hotList.add(itemModel);
      });


    }
  }
}

class SearchHotItemModel{
  String searchWord;
  int score;
  String content;
  String iconUrl;
  String alg;

  SearchHotItemModel({
    this.searchWord,
    this.score,
    this.content,
    this.iconUrl,
    this.alg
});

  SearchHotItemModel.fromJson(Map<String,dynamic> json){

    searchWord = json["searchWord"];
    score        = json["score"];
    content          = json["content"];
    iconUrl  = json["iconUrl"];
    alg = json["alg"];
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/http_request/music_api.dart';


class SearchHotWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FutureBuilderWidget<List<SearchHotItemModel>>(
      future: MusicApi.searchHot(),
      successBuilder: (BuildContext context, AsyncSnapshot<List<SearchHotItemModel>> snapshot){

        List<SearchHotItemModel> result = snapshot.data;

        return Container(
          margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
          child:  CustomScrollView(

            slivers: <Widget>[
              SliverToBoxAdapter(
                child: _title(context),
              ),
              SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      childAspectRatio: 4.5
                  ),
                  delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                    SearchHotItemModel itemModel =  result[index];


                    return MusicGestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed(RouterPageName.SearchResultPage,arguments: itemModel.searchWord);

                      },
                      child:  _hotItem(context,result[index]),
                    );
                  }, childCount: result.length
                  )
              )
            ],
          ),
        );
      },
    );
  }


  Widget _title(context){
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
      child: Text("热搜榜",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 20,
              color: MusicStore.Theme(context).titleColor,
              fontWeight: FontWeight.w500)),
    );
  }

  Widget _hotItem(context,SearchHotItemModel itemModel){
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MusicStore.Theme(context).theme,
          boxShadow: MusicStore.boxShow(context, -3, 5)),
      child: Text(itemModel.searchWord,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: MusicStore.Theme(context).titleColor,
              fontWeight: FontWeight.w500)),
    );
  }
}

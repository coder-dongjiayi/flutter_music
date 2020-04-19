import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/pages/search_page/search_page.dart';
import 'package:flutter_music/public_widget/future_builder_widget.dart';

class SearchListWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  var _searchKey =   Provider.of<SearchChangeState>(context,listen: false).searchKeyWord;
    return FutureBuilderWidget<List>(
      future: MusicApi.searchSuggest(_searchKey),
      successBuilder: (BuildContext context, AsyncSnapshot<List> snapshot){


        return ListView.separated(
         key: ValueKey(_searchKey),
          padding: EdgeInsets.only(left: 20, top: 20,right: 10),
          itemCount: snapshot.data.length,
          itemBuilder: (context,index){

            String result = snapshot.data[index]["keyword"];


            return _item(context,result);
          },
          separatorBuilder: (context,index){
            return Divider(color: MusicStore.Theme(context).topShadowColor,height: 2,);
          },
        );
      },

    );
  }

  Widget _item(context,result){

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Text("$result",style: TextStyle(color: MusicStore.Theme(context).titleColor),),
    );
  }
}

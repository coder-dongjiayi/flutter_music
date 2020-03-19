
import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/public_widget/future_builder_widget.dart';
import 'package:flutter_music/library/library_empty_widget.dart';
import 'package:flutter_music/models/play_list_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/album/album_page.dart';

class LibraryListWidget extends StatefulWidget {
  @override
  _LibraryListWidgetState createState() => _LibraryListWidgetState();
}

class _LibraryListWidgetState extends State<LibraryListWidget> {


  Future _future = MusicApi.requestPlayList();


  @override
  Widget build(BuildContext context) {

    return FutureBuilderWidget<List<PlayItemModel>>(

      future: _future,

      emptydBuilder: (BuildContext context,AsyncSnapshot<List<PlayItemModel>> snapshot){
        return LibraryEmptyWidget();
      },

      isEmptyBuilder:(BuildContext context,AsyncSnapshot<List<PlayItemModel>> snapshot){
        return  snapshot.data.length == 0 ? true : false;
      } ,


      successBuilder: (BuildContext context, AsyncSnapshot<List<PlayItemModel>> snapshot){

        Widget listView =   _listView(context, snapshot.data);

        return listView;
      },
    );

  }

  Widget _listView(context,dataSource){


    return ListView.builder(

        itemBuilder: (BuildContext context, int index){
          PlayItemModel itemModel = dataSource[index];

          return  GestureDetector(
            onTap: (){

              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return AlbumPage(id: itemModel.id);
                  }
              ));
            },
            child: _libraryItem(itemModel.coverImgUrl,itemModel.name,itemModel.description),
          );
        },
        padding: EdgeInsets.only(top: 30),
        itemCount: dataSource.length
    );
  }


  Widget _itemCover(context,coverImage){

    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(5),
          color: MusicStore.Theme.of(context).theme,
          boxShadow: [
            BoxShadow(color:MusicStore.Theme.of(context).shadowColor,offset: Offset(10,10),blurRadius: 10),
            BoxShadow(color: Colors.white,offset: Offset(-10,-10),blurRadius: 26)
          ]
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl: "$coverImage",
            fit: BoxFit.cover,
          )
      ),


    );
  }

  Widget _itemTitle(context,name,desc){
    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$name",
              maxLines: 2,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500, color: MusicStore.Theme.of(context).titleColor)),

          Padding(
              padding: EdgeInsets.only(top: 3,right: 60),
              child: Text("$desc",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12,color: MusicStore.Theme.of(context).subtTitleColor),)

          )
        ],
      ),
    );
  }

  Widget _libraryItem(coverImage,name,desc){
    return Builder(
      builder: (context){
        return Container(
          width: double.infinity,

          margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MusicStore.Theme.of(context).theme,
              boxShadow: [
                BoxShadow(color:MusicStore.Theme.of(context).shadowColor,offset: Offset(10,10),blurRadius: 10),
                BoxShadow(color: Colors.white,offset: Offset(-10,-10),blurRadius: 26)
              ]

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _itemCover(context,coverImage),
              Expanded(
                flex: 1,
                child: _itemTitle(context,name,desc),
              ),
              Icon(Icons.keyboard_arrow_right,size: 20,color: MusicStore.Theme.of(context).titleColor)
            ],
          ),
        );
      },
    );
  }
}




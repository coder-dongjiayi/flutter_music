
import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

class LibraryListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(

        itemBuilder: (BuildContext context, int index){

      return  _libraryItem();
    },
      padding: EdgeInsets.only(top: 30),
     itemCount: 4,
    );
  }



  Widget _itemCover(context){

    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("http://p1.music.126.net/8FWpfCQElJVvDH8Anwr90w==/109951164609369490.jpg?param=180y180")
        ),
          borderRadius: BorderRadius.circular(5),
          color: MusicStore.Theme.of(context).theme,
          boxShadow: [
            BoxShadow(color:MusicStore.Theme.of(context).shadowColor,offset: Offset(10,10),blurRadius: 10),
            BoxShadow(color: Colors.white,offset: Offset(-10,-10),blurRadius: 26)
          ]
      ),


    );
  }

  Widget _itemTitle(context){
    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Beyond",
              maxLines: 2,
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500, color: MusicStore.Theme.of(context).titleColor)),

          Padding(
              padding: EdgeInsets.only(top: 3,right: 60),
              child: Text("海阔天空、真的爱你、午夜园区",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12,color: MusicStore.Theme.of(context).subtTitleColor),)

          )
        ],
      ),
    );
  }

  Widget _libraryItem(){
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
              _itemCover(context),
              Expanded(
                flex: 1,
                child: _itemTitle(context),
              ),
              Icon(Icons.keyboard_arrow_right,size: 20,color: MusicStore.Theme.of(context).titleColor)
            ],
          ),
        );
      },
    );
  }


}

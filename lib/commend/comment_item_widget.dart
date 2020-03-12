import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

class CommentItemWidget extends StatelessWidget {

  CommentItemWidget({
    Key key,
    this.title,
    this.imageUrl1,
    this.imageUrl2

  }): super(key:key);

  final String title;
  final String imageUrl1;
  final String imageUrl2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30,left: 20,right: 20),
      child: Column(
        children: <Widget>[
          _title(context),
          _itemList(context)
        ],
      ),
    );
  }

  Widget _itemList(BuildContext context){

    return Row(
      children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(right:6),
              child: _item(context,imageUrl1),
            )
          ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 6),
            child: _item(context,imageUrl2),
          ),
        )
      ],
    );
  }

  Widget _item(BuildContext context,imageUrl){
    return Container(

      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.fromLTRB(3, 3, 3, 3),

      decoration: BoxDecoration(
        
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color:MusicStore.Theme.of(context).shadowColor,offset: Offset(10,10),blurRadius: 10),
            BoxShadow(color: Colors.white,offset: Offset(-10,-10),blurRadius: 26)
          ]
      ),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
              "${imageUrl}",
            fit: BoxFit.cover,
          ),
        ),
      ),

    );
  }

  Widget _title(BuildContext context){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("${title}",

            style: TextStyle(color: MusicStore.Theme.of(context).titleColor,fontSize: 17)),
        Icon(Icons.arrow_forward,size: 20,color: MusicStore.Theme.of(context).goldenColor)
      ],
    );
  }
}

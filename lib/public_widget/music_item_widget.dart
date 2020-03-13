import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
class MusicItemWidget extends StatelessWidget {

  MusicItemWidget({
    Key key,
    this.songName,
    this.artist,
    this.coverImageUrl
}):super(key:key);

  final String songName;
  final String artist;
  final String coverImageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Map arguments = {"audioName":"明天会更好"};

       Navigator.pushNamed(context, "/music_play_audio_page",arguments: arguments);
      },

      child: Container(
        color: MusicStore.Theme.of(context).theme,
        margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),

        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _itemCover(context),
            Expanded(
              flex: 1,
              child:  _itemTitle(context),
            ),
            _itemPlay(context)
          ],
        ),
      ),
    );
  }


  Widget _itemPlay(context){
    return Container(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: MusicStore.Theme.of(context).theme,
          boxShadow:[
            BoxShadow(color:MusicStore.Theme.of(context).shadowColor,offset: Offset(10,10),blurRadius: 10),
            BoxShadow(color: Colors.white,offset: Offset(-10,-10),blurRadius: 26)
          ]
      ),
      child: Icon(Icons.play_arrow,color: MusicStore.Theme.of(context).titleColor,size: 25,),

    );
  }

  Widget _itemCover(context){
    return Container(
     width: 60,
      height: 60,
      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow:[
            BoxShadow(color:MusicStore.Theme.of(context).shadowColor,offset: Offset(10,10),blurRadius: 10),
            BoxShadow(color: Colors.white,offset: Offset(-10,-10),blurRadius: 26)
          ]
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: "$coverImageUrl",
          fit: BoxFit.cover,
        )
      )
    );
  }

  Widget _itemTitle(context){
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$songName",
              maxLines: 1,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500, color: MusicStore.Theme.of(context).titleColor)),

          Padding(
              padding: EdgeInsets.only(top: 3,right: 60),
              child: Text("$artist",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10,color: MusicStore.Theme.of(context).subtTitleColor),)

          )
        ],
      ),
    );
  }



}

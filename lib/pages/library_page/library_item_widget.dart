import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/http_request/music_api.dart';

import 'package:flutter_music/pages/library_page/library_list_state.dart';
import 'package:flutter_music/pages/library_page/library_delete_button_widget.dart';

class LibraryItemWidget extends StatefulWidget {
  LibraryItemWidget({
    Key key,
    this.index,
    this.coverImage,
    this.name,
    this.desc,
    this.marginLeft
}):super(key: key);

  final String coverImage;
  final String name;
  final String desc;
  final double marginLeft;
  final int index;
  @override
  _LibraryItemWidgetState createState() => _LibraryItemWidgetState();
}

class _LibraryItemWidgetState extends State<LibraryItemWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);

    PlayItemModel itemModel= LibraryListState.getDataSource(context)[widget.index];

    return Stack(
      children: <Widget>[
        MusicGestureDetector(
          onTap:(){
            LibraryListState.updateDeleteState(context,widget.index);
          },
          child: LibraryDeleteButtonWidget(
            selected: itemModel.selected,
          ),
        ),

        _libraryCoverItem(widget.coverImage,widget.name,widget.desc,widget.marginLeft)
      ],
    );
  }

  Widget _libraryCoverItem(coverImage,name,desc,marginLeft){
    return Container(
      width: double.infinity,

      margin: EdgeInsets.only(left: marginLeft,right: 20,top: 10,bottom: 10),
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
  }

  Widget _itemCover(context,coverImage){

    return Container(
      width: ScreenAdapter.setWidth(140),
      height: ScreenAdapter.setHeight(140),
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
              overflow: TextOverflow.ellipsis,
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

}

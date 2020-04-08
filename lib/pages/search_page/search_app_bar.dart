import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

import 'package:flutter_music/public_widget/music_button.dart';


class SearchAppBar extends StatelessWidget implements PreferredSizeWidget{
  SearchAppBar({
    Key key,

}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key :key);

  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return SafeArea(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _search(context),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: MusicButton(
              normalIconData: Icons.chevron_left,
              onTap: (selected){
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      )
    );
  }
  Widget _search(context){
    return  Container(

      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:MusicStore.Theme(context).theme,
          border: Border.all(color: MusicStore.Theme(context).topShadowColor,width: 2),
          boxShadow: MusicStore.boxShow(context, -5, 5)

      ),

      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: TextField(


        style: TextStyle(color: MusicStore.Theme(context).titleColor,fontSize: 18),
        onSubmitted: (string){
           print(string);
        },
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search,color: MusicStore.Theme(context).titleColor,),
              border: InputBorder.none,
              hintText: "请输入搜索内容",
              hintStyle: TextStyle(color:  MusicStore.Theme(context).titleColor)
          )

      ),

    );
  }
}

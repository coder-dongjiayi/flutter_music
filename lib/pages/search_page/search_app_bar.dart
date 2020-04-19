import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

import 'package:flutter_music/public_widget/music_button.dart';

typedef ValueChanged = void Function(BuildContext context,String value);
class SearchAppBar extends StatefulWidget implements PreferredSizeWidget{
  SearchAppBar({
    Key key,
    this.onChange,
    this.searchWord,
    this.isGoback : false

  }) : preferredSize = Size.fromHeight(kToolbarHeight), super(key :key);
  final Size preferredSize;
  final ValueChanged onChange;
  final String searchWord;
  final bool isGoback;
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {

  TextEditingController editingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editingController = TextEditingController();
    editingController.text = widget.searchWord;
  }

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
              child: widget.isGoback == false ?  MusicGestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Text("取消",style:TextStyle(color: MusicStore.Theme(context).titleColor,fontSize: 16),),
              ) :   MusicButton(
                normalIconData: Icons.chevron_left,
                onTap: (selected){
                  Navigator.of(context).pop();
                },
              )

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
        controller: editingController,
          autofocus: widget.isGoback == true ? false : true,
          onChanged: (value){
           widget.onChange(context,value);
          },

          style: TextStyle(color: MusicStore.Theme(context).titleColor,fontSize: 18),
          onSubmitted: (string){

            Navigator.of(context).pushNamed(RouterPageName.SearchResultPage,arguments: string);

          },
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search,color: MusicStore.Theme(context).titleColor,),
              border: InputBorder.none,
              hintText: "请输入搜索内容",
              hintStyle: TextStyle(color:  MusicStore.Theme(context).subtTitleColor)
          )

      ),

    );
  }
}




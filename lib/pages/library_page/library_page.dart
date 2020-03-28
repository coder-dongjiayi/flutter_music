import 'package:flutter/material.dart';

import 'package:flutter_music/common/music_store.dart';

import 'package:flutter_music/base_music/music_app_bar.dart';

import 'package:flutter_music/pages/library_page/library_list_widget.dart';

import 'package:flutter_music/pages/library_page/library_state/library_list_state.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {


 return  MultiProvider(
   providers: [
     ChangeNotifierProvider(

       create: (context)=>LibraryListState(),

     )
   ],
   child: Builder(
     builder: (context){
       return MusicScaffold(
         showFloatingActionButton: false,
         appBar: MusicAppBar(
           title: "歌单",
           rightIconData: Icons.edit,
           rightSelectedIconData: Icons.delete_sweep ,
           rightOnTap: (){
             LibraryListState.libraryState(context).deleteAction();

           },
         ),
         body:LibraryListWidget() ,
       );

     },
   )

 );
  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}

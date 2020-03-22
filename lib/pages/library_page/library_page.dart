import 'package:flutter/material.dart';

import 'package:flutter_music/common/music_store.dart';

import 'package:flutter_music/music_app_bar/music_app_bar.dart';

import 'package:flutter_music/pages/library_page/library_list_widget.dart';
import 'package:flutter_music/pages/library_page/library_list_controller.dart';
import 'package:flutter_music/pages/library_page/library_list_state.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  LibraryListController libraryListController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    libraryListController = LibraryListController();
  }

  @override
  Widget build(BuildContext context) {


 return  MultiProvider(
   providers: [
     ChangeNotifierProvider(

       create: (context)=>LibraryListState(),
     )
   ],
   child: Consumer<LibraryListState>(
     builder: (context,state,_){
       return  Scaffold(
           backgroundColor: MusicStore.Theme.of(context).theme,
           appBar: MusicAppBar(
             title: "歌单",
             rightIconData: Icons.edit,
             rightSelectedIconData: Icons.delete_sweep ,
             rightOnTap: (){

               if(libraryListController.isEditing == false){
                 libraryListController.startEditAnimationStart();
                 state.isEditing = true;
               }else{
                 libraryListController.endEditAnimationStart();
                 state.isEditing = false;
               }


             },
           ),
           body:LibraryListWidget(
             libraryListController: libraryListController,
           )
       );
     }
   )

 );


  }
  @override
  void dispose() {
    // TODO: implement dispose
    libraryListController.dispose();
    super.dispose();
  }
}

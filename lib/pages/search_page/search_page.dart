import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/pages/search_page/search_app_bar.dart';
import 'package:flutter_music/pages/search_page/search_hot_widget.dart';
import 'package:flutter_music/pages/search_page/search_list_widget.dart';

class SearchChangeState extends ChangeNotifier{

  String searchKeyWord = "";

  void searchChangeValue(value){
    searchKeyWord = value;
    notifyListeners();
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {



  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchChangeState>(create: (_)=> SearchChangeState()),
      ],
      child: MusicScaffold(
        appBar: SearchAppBar(
          isGoback: false,
          onChange: ( BuildContext context,String value){

            Provider.of<SearchChangeState>(context,listen: false).searchChangeValue(value);
          },

        ),

      body: Consumer<SearchChangeState>(
        builder: (context,state,_){

         return state.searchKeyWord.length == 0 ? SearchHotWidget() : SearchListWidget();
          },
       ),

      ),
    );
  }
}

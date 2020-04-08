import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/pages/search_page/search_app_bar.dart';
import 'package:flutter_music/pages/search_page/search_result_widget.dart';
import 'package:flutter_music/pages/search_page/search_hot_widget.dart';
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return MusicScaffold(
      appBar: SearchAppBar(),
     body: SearchHotWidget()

    );
  }
}

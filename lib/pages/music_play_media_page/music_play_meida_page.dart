
import 'package:flutter/material.dart';
import 'package:flutter_music/base_music/music_app_bar.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/http_request/music_api.dart';

import 'package:audioplayers/audioplayers.dart';

import 'package:flutter_music/common/music_global_play_list_state.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_body_widget.dart';
class MusicPlayMeidaPage extends StatefulWidget {
  MusicPlayMeidaPage({
    Key key,
    this.heroTagName,

  }) : super(key : key);

  final String heroTagName;



  @override
  _MusicPlayMeidaPageState createState() => _MusicPlayMeidaPageState();
}

class _MusicPlayMeidaPageState extends State<MusicPlayMeidaPage>  with TickerProviderStateMixin {



  Future _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<TrackItemModel> trackList =   MusicGlobalPlayListState.musicPlayState(context).currentPlayList;

    _future = MusicApi.musicMp3Item(trackList);

  }


  @override
  Widget build(BuildContext context) {

    return  MusicScaffold(
        showFloatingActionButton: false,
        appBar: MusicAppBar(
          title: "",
          leftIconData: Icons.keyboard_arrow_left,
          rightIconData: Icons.more_horiz,
          leftOnTap: (){
            Navigator.of(context).pop();
          },
        ),

        body: SafeArea(
            child: FutureBuilderWidget<List<TrackItemModel>>(
              future: _future,
              successBuilder: (BuildContext context, AsyncSnapshot<List<TrackItemModel>> snapshot){
                  Widget musicBody = MusicPlayBodyWidget();
                MusicGlobalPlayListState.musicPlayState(context).music_play();
                return musicBody;
              },
            )
        )
    );


  }



}




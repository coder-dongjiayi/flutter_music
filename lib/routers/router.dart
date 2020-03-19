


import 'package:flutter/material.dart';
import 'package:flutter_music/tabbar/tababr_page.dart';
import 'package:flutter_music/library/new_library/new_library_page.dart';
import 'package:flutter_music/music_play_audio_page/music_play_audio_page.dart';

import 'package:flutter_music/album/album_page.dart';

final routers = {
  "/": (context) => TabbarPage(),

 "/new_library_page": (context,{arguments}) => NewLibraryPage(),

  "/music_play_audio_page":(context,{arguments}) => MusicPlayAudioPage(),

  "/album_page":(context,{arguments}) => AlbumPage()
};


var onGenerateRoute = (RouteSettings settings) {

  final String name = settings.name;
  final Function pageContentBuilder = routers[name];


  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
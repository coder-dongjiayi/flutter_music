


import 'package:flutter/material.dart';
import 'package:flutter_music/tabbar/tababr_page.dart';
import 'package:flutter_music/pages/library_page/new_library_page/new_library_page.dart';

import 'package:flutter_music/pages/album_page/album_page.dart';

final routers = {
  "/": (context) => TabbarPage(),

 "/new_library_page": (context,{arguments}) => NewLibraryPage(),


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
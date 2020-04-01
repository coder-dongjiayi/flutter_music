
import 'package:flutter/material.dart';
import 'package:flutter_music/tabbar/tababr_page.dart';
import 'package:flutter_music/pages/library_page/new_library_page/new_library_page.dart';
import 'package:flutter_music/pages/album_page/album_page.dart';
import 'package:flutter_music/routers/router_page_name.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_meida_page.dart';
import 'package:flutter_music/pages/music_list_page/music_list_page.dart';
class MusicRouter{

  static final String initialRoute = RouterPageName.initialRoute;

  static final  Map<String, WidgetBuilder> routers = {
    RouterPageName.initialRoute: (context) => TabbarPage(),

    "/new_library_page": (context,{arguments}) => NewLibraryPage(),

    RouterPageName.AlbumPage:(context) => AlbumPage(),

    RouterPageName.MusicPlayMeidaPage:(context) => MusicPlayMeidaPage(),

    RouterPageName.MusicListPage:(context) => MusicListPage()

  };


  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static final RouteFactory generateRoute = (settings) {

    final String name = settings.name;

    final Function pageContentBuilder = routers[name];

    if (pageContentBuilder != null) {
      if (settings.arguments != null) {

       if(name == RouterPageName.AlbumPage){
         return MaterialPageRoute(
             builder: (context) {
               return AlbumPage(id: settings.arguments);
             }
         );
       }

      }else{
        bool fullscreenDialog = false;
        if(name == RouterPageName.MusicListPage){
          fullscreenDialog = true;
        }
        final Route route =
        MaterialPageRoute(
            builder: (context) => pageContentBuilder(context),
            fullscreenDialog: fullscreenDialog
        );
        return route;
      }
    }

    return null;
  };
}








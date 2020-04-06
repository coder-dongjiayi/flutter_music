

import 'package:flutter/material.dart';
import 'package:flutter_music/pages/login_page/login_password_page.dart';
import 'package:flutter_music/tabbar/tababr_page.dart';
import 'package:flutter_music/pages/library_page/new_library_page/new_library_page.dart';
import 'package:flutter_music/pages/album_page/album_page.dart';
import 'package:flutter_music/routers/router_page_name.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_meida_page.dart';
import 'package:flutter_music/pages/music_list_page/music_list_page.dart';
import 'package:flutter_music/pages/login_page/login_page.dart';
import 'package:flutter_music/pages/library_page/library_page.dart';
import 'package:flutter_music/pages/recommend_page/recommend_page.dart';
import 'package:flutter_music/pages/browse_page/browse_page.dart';
import 'package:flutter_music/pages/person_page/person_page.dart';
import 'package:flutter_music/pages/search_page/search_page.dart';
class MusicRouter{

  static final String initialRoute = RouterPageName.initialRoute;

  static final  Map<String, WidgetBuilder> routers = {
    RouterPageName.initialRoute: (context) => TabbarPage(),

    "/new_library_page": (context,{arguments}) => NewLibraryPage(),

    RouterPageName.AlbumPage:(context) => AlbumPage(),

    RouterPageName.LibraryPage:(context) => LibraryPage(),

    RouterPageName.CommendPage:(context) => CommendPage(),

    RouterPageName.BrowsePage:(context) => BrowsePage(),

    RouterPageName.MusicPlayMeidaPage:(context) => MusicPlayMeidaPage(),

    RouterPageName.MusicListPage:(context) => MusicListPage(),

    RouterPageName.LoginPage:(context) => LoginPage(),

    RouterPageName.LoginPasswordPage:(context) => LoginPasswordPage(),

    RouterPageName.PersonPage:(context) => PersonPage(),

    RouterPageName.SearchPage:(context) => SearchPage()

  };


  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static final RouteFactory generateRoute = (settings) {

    final String name = settings.name;

    final Function pageContentBuilder = routers[name];

    if (pageContentBuilder != null) {
      if (settings.arguments != null) {

       if(name == RouterPageName.AlbumPage){
         return MaterialPageRoute(
             settings:  RouteSettings(name: name),
             builder: (context) {
               return AlbumPage(id: settings.arguments);
             }
         );
       }else if(name == RouterPageName.LoginPasswordPage){
         Map map = settings.arguments;
       return  MaterialPageRoute(
           settings:  RouteSettings(name: name),
             builder: (context) {
               return LoginPasswordPage(nickName: map["nickName"],mobile: map["mobile"]);
             }
         );
       }

      }else{

        bool fullscreenDialog = false;
        if(name == RouterPageName.MusicListPage || name == RouterPageName.LoginPage){
          fullscreenDialog = true;
        }
        final Route route =
        MaterialPageRoute(
          settings: RouteSettings(name: name),
            builder: (context) => pageContentBuilder(context),
            fullscreenDialog: fullscreenDialog
        );
        return route;
      }
    }

    return null;
  };
}








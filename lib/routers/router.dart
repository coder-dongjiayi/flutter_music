
import 'package:flutter/material.dart';
import 'package:flutter_music/tabbar/tababr_page.dart';
import 'package:flutter_music/pages/library_page/new_library_page/new_library_page.dart';
import 'package:flutter_music/pages/album_page/album_page.dart';
import 'package:flutter_music/routers/router_page_name.dart';
import 'package:flutter_music/pages/music_play_media_page/music_play_meida_page.dart';

class MusicRouter{

  static final String initialRoute = RouterPageName.initialRoute;

  static final  Map<String, WidgetBuilder> routers = {
    RouterPageName.initialRoute: (context) => TabbarPage(),

    "/new_library_page": (context,{arguments}) => NewLibraryPage(),

    RouterPageName.AlbumPage:(context) => AlbumPage(),

    RouterPageName.MusicPlayMeidaPage:(context) => MusicPlayMeidaPage()

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
       }else if(name == RouterPageName.MusicPlayMeidaPage){

         Map arguments = settings.arguments as Map;

         String heroTageName = arguments["heroTagName"];


         return MaterialPageRoute(
             builder: (context) {
               return MusicPlayMeidaPage(
                 heroTagName: heroTageName,
               );
             }
         );

//       return  PageRouteBuilder<void>(
//             pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
//               return AnimatedBuilder(
//                 animation: animation,
//                 builder:  (BuildContext context, Widget child){
//                   return Opacity(
//                       opacity: opacityCurve.transform(animation.value),
//                       child: MusicPlayMeidaPage(
//                         heroTagName: heroTageName,
//                         songName: title,
//                         artist: subtTitle,
//                         coverImageUrl: coverImageUrl,
//                       )
//                   );
//                 },
//               );
//             }
//
//         );
       }

      }else{
        final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
        return route;
      }
    }

    return null;
  };
}








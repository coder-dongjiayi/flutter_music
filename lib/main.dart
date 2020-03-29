import 'package:flutter/material.dart';
import 'package:flutter_music/routers/router.dart';

import 'package:flutter_music/common/state/theme_state.dart';
import 'package:flutter_music/pages/music_play_media_page/state/music_play_list_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [

        ChangeNotifierProvider<ThemeState>(create: (_)=>ThemeState()),
        ChangeNotifierProvider<MusicPlayListState>(create: (_)=>MusicPlayListState())
      ],
      child: Consumer<ThemeState>(
        builder: (context,state,widget){
          print("执行");
          return MaterialApp(

            initialRoute: MusicRouter.initialRoute,

            onGenerateRoute: MusicRouter.generateRoute,

            theme: ThemeData(primaryColor:state.theme),

          );
        },
      )


    );

  }


}


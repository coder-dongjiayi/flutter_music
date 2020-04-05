import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/routers/router.dart';
import 'package:flutter_music/common/music_global.dart';
import 'package:flutter_music/common/state/theme_state.dart';
import 'package:flutter_music/common/state/music_global_play_list_state.dart';
import 'package:flutter_music/common/state/user_state.dart';
import 'package:provider/provider.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  MusicGlobal.init().then((value){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [

        ChangeNotifierProvider<UserSate>(create: (_)=> UserSate()),
        ChangeNotifierProvider<ThemeState>(create: (_)=>ThemeState()),
        ChangeNotifierProvider<MusicGlobalPlayListState>(create: (_)=>MusicGlobalPlayListState(
          platform: Theme.of(context).platform
        ))
      ],
      child: Consumer<ThemeState>(
        builder: (context,state,widget){
          return MaterialApp(

            color: state.theme,
            initialRoute: MusicRouter.initialRoute,


            onGenerateRoute: MusicRouter.generateRoute,

            theme: ThemeData(primaryColor:state.theme),

          );
        },
      )


    );

  }


}


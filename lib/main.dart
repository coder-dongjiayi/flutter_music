import 'package:flutter/material.dart';
import 'package:flutter_music/routers/router.dart';

import 'package:flutter_music/common/music_global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(primaryColor: MusicGlobal.light),

    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_music/base_music/music_scaffold.dart';
import 'package:flutter_music/pages/library_page/library_page.dart';
import 'package:flutter_music/pages/recommend_page/recommend_page.dart';
import 'package:flutter_music/pages/browse_page/browse_page.dart';
import 'package:flutter_music/tabbar/bottom_tabbar.dart';
import 'package:vibrate/vibrate.dart';
import 'package:flutter_music/common/screen_adapter.dart';

class TabbarPage extends StatefulWidget {
  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {

  var _currentIndex = 0;

  var _pageController;


  final List<Widget> _pageList = [
    LibraryPage(),
    CommendPage(),
    BrowsePage()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }


  @override
  Widget build(BuildContext context) {


    ScreenAdapter.init(context);
    return MusicScaffold(
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller:_pageController,
          children: _pageList
      ),
      bottomNavigationBar: BottomTabar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration:  Duration(milliseconds: 300), curve: Curves.ease);
          });

        },
      ),
    );

  }


}

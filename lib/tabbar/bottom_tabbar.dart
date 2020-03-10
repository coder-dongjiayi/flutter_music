import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_music/common/music_global.dart';
import 'package:flutter_music/tabbar/tabbar_items/music_tab_item.dart';
class BottomTabar extends StatefulWidget {

  BottomTabar({Key key,this.currentIndex,this.onTap}) : super(key:key);

   int currentIndex;

  final ValueChanged<int> onTap;

  @override
  _BottomTabarState createState() => _BottomTabarState();
}

class _BottomTabarState extends State<BottomTabar> with TickerProviderStateMixin {


  var _itemList = [
    {
      "title":"资料库",
      "iconData":Icons.format_list_bulleted,
    },
    {
      "title":"推荐",
      "iconData":Icons.favorite,
    },
    {
      "title":"浏览",
      "iconData":Icons.music_note,
    }
  ];



  List<AnimationController> _animationControllers = <AnimationController>[];

  List<Animation>           _animations = <Animation>[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _resetState();

  }

  void _resetState() {
    for (AnimationController controller in _animationControllers){
        controller.dispose();
    }
    _animationControllers = List<AnimationController>.generate(_itemList.length, (int index){

      return AnimationController(
            duration: Duration(milliseconds: 300),
            vsync: this
        )..addListener(_rebuild);

    });

    _animationControllers[widget.currentIndex].value = 1.0;

    _animations = List<Animation>.generate(_itemList.length, (int index){
      return Tween<double>(begin: 0.0,end: 60.0).animate(_animationControllers[index]);
    });

  }
  @override
  void didUpdateWidget(BottomTabar oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);


    if(oldWidget.currentIndex != widget.currentIndex){

      _animationControllers[oldWidget.currentIndex].reverse();

      _animationControllers[widget.currentIndex].forward();
    }

  }


  @override
  Widget build(BuildContext context) {

    final double additionalBottomPadding = math.max(MediaQuery.of(context).padding.bottom, 0.0);


    List<MusicTabItem> _list  = List<MusicTabItem>.generate(_itemList.length, (int index){

      return MusicTabItem(
        index: index,
        animation: _animations[index],
        title: _itemList[index]["title"],
        iconData: _itemList[index]["iconData"],
        normalColor: Color.fromRGBO(222, 227, 233 , 1.0),
        selectedColor: MusicGlobal.textColor,
        onTap: (index){
          if (widget.onTap != null)
            widget.onTap(index);
        },
      );
    });


      return Material(

      child: ConstrainedBox(
          constraints:BoxConstraints(minHeight: kBottomNavigationBarHeight+additionalBottomPadding),
          child: Padding(
            padding: EdgeInsets.only(bottom: additionalBottomPadding),
            child: MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _list
              )
            ),
          ),

      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    for (AnimationController controller in _animationControllers){
      controller.dispose();
    }

    super.dispose();

  }
  void _rebuild() {
    setState(() {

    });
  }

}




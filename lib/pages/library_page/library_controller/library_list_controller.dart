

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
class LibraryListController extends ChangeNotifier{

  AnimationController _editAnimationController;
  Animation editAnimation;

  bool isEditing = false;

  void initAnimation({@required TickerProvider vsync}){
    _editAnimationController = AnimationController(duration: Duration(milliseconds: 200),vsync: vsync);

    editAnimation = Tween<double>(begin: 20.0,end: 60.0).animate(_editAnimationController);
    _editAnimationController.addStatusListener((state){
      if(state == AnimationStatus.forward){
        isEditing = true;
      }
      if(state == AnimationStatus.reverse){
        isEditing = false;
      }

    });

  }

  void startEditAnimationStart({double from}){

   _editAnimationController.forward(from: from);

  }
  void endEditAnimationStart({double from}){

    _editAnimationController.reverse(from: from);

  }



  @override
  void dispose() {
    // TODO: implement dispose
    _editAnimationController.dispose();
    super.dispose();
  }

}
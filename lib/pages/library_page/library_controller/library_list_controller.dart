

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
class LibraryListController extends ChangeNotifier{

  AnimationController _editAnimationController;
  AnimationController dissAnimationController;

  Animation editAnimation;
  Animation<Offset> dissAnimation;
  bool isEditing = false;

  void initAnimation({@required TickerProvider vsync}){
    _editAnimationController = AnimationController(duration: Duration(milliseconds: 200),vsync: vsync);
    dissAnimationController =  AnimationController(duration: Duration(milliseconds: 400),vsync: vsync);


    editAnimation = Tween<Offset>(begin: Offset.zero,end: Offset(0.1, 0)).animate(_editAnimationController);

    dissAnimation =  Tween<Offset>(begin: Offset.zero,end: Offset(1.0, 0)).animate(dissAnimationController);

    _editAnimationController.addStatusListener((state){
      if(state == AnimationStatus.forward){
        isEditing = true;
      }
      if(state == AnimationStatus.reverse){
        isEditing = false;
      }

    });

  }

  void startEditAnimation({double from}){

   _editAnimationController.forward(from: from);

  }
  void endEditAnimation({double from}){

    _editAnimationController.reverse(from: from);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _editAnimationController.dispose();
    dissAnimationController.dispose();
    super.dispose();
  }

}
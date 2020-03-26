

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
class LibraryListController extends ChangeNotifier{

  AnimationController _editAnimationController;


  Animation editAnimation;



  void initAnimation({@required TickerProvider vsync}){
    _editAnimationController = AnimationController(duration: Duration(milliseconds: 200),vsync: vsync);


    editAnimation = Tween<Offset>(begin: Offset.zero,end: Offset(0.1, 0)).animate(_editAnimationController);



  }


  void startEditAnimation(dynamic action(bool iEditing)){

    if(_editAnimationController.status == AnimationStatus.completed){
      _editAnimationController.reverse().whenComplete((){
        action(false);
      });
    }else{
      _editAnimationController.forward().whenComplete((){
        action(true);
      });
    }

  }



  @override
  void dispose() {
    // TODO: implement dispose
    _editAnimationController.dispose();

    super.dispose();
  }

}
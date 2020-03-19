import 'package:flutter/material.dart';
class MusicBottomAnimation extends StatelessWidget {

  MusicBottomAnimation({
    Key key,
    this.child,
    this.animationController

}) : super (key :key);
  final Widget child;

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    Animation _translationAnimation = Tween<double>(begin: 0.0,end: 40.0).animate(animationController);

    return AnimatedBuilder(
      animation: _translationAnimation,
      builder: (context,_){
        return Positioned(
          bottom: _translationAnimation.value,
          right: 0,
          left: 0,
          child: child,
        );
      },
    );
  }
}

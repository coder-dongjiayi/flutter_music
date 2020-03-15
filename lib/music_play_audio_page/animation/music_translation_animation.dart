import 'package:flutter/material.dart';

class MusicTranslationAnimation extends StatelessWidget {
  MusicTranslationAnimation({
    Key key,
    this.child,
    this.animationController,
    this.begin : 40,
    this.end : 0
  }) : super (key : key);

  final Widget child;
  final double begin;
  final double end;

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    Animation _translationAnimation = Tween<double>(begin: begin,end: end).animate(animationController);

    return AnimatedBuilder(
      animation: _translationAnimation,
      builder: (context,_){
        return Padding(
          padding: EdgeInsets.only(top: _translationAnimation.value),
          child: child,
        );
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingDialog extends Dialog{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: CupertinoActivityIndicator(
          radius: 20,
        ),
      ),
    );

  }

  static void show (BuildContext context){

    showDialog<Null>(
        context: context,
        barrierDismissible: false,
      builder: (BuildContext context){
          return LoadingDialog();
      }
    );

  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


typedef AsyncWidgetBuilder<T> = Widget Function(BuildContext context, AsyncSnapshot<T> snapshot);

typedef EmptyWidgetBuilder<T>  = bool Function(BuildContext context, AsyncSnapshot<T> snapshot);


class FutureBuilderWidget<T> extends StatelessWidget {
  FutureBuilderWidget({
    Key key,
    this.future,
    this.errorWidget,
    this.emptyWidget,
    this.builder,
    this.emptyShow

  }) : super(key : key);

  final Widget errorWidget;
  final Widget emptyWidget;
  final Future<T> future;

  final AsyncWidgetBuilder<T> builder;

  final EmptyWidgetBuilder<T> emptyShow;

  Widget _empty(){
    return Center(
        child: emptyWidget == null ? Text("暂时没有数据哦") : emptyWidget
    );
  }
  Widget _error(){
    return Center(
      child: errorWidget == null ? Text("请求失败") : errorWidget,
    );
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot){

        if(snapshot.connectionState == ConnectionState.done){

          if(snapshot.hasError){

            return _error();
          }else{

            bool isShowEmpty = false;
            if(emptyShow != null){

              isShowEmpty = emptyShow(context,snapshot);
            }


            Widget builderWidget =  builder(context,snapshot);

            return  isShowEmpty == true ? _empty() : builderWidget;

          }

        }else{

          return  Center(

            child: CupertinoActivityIndicator(

              radius: 20,
            ),
          );
        }

      },
    );
  }
}



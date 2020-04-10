import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/public_widget/music_activityIndicator.dart';
import 'package:flutter_music/common/music_store.dart';


typedef AsyncWidgetBuilder<T> = Widget Function(BuildContext context, AsyncSnapshot<T> snapshot);

typedef EmptyWidgetBuilder<T>  = bool Function(BuildContext context, AsyncSnapshot<T> snapshot);

class FutureBuilderWidget<T> extends StatefulWidget {
  FutureBuilderWidget({
    Key key,
    this.future,
    this.emptydBuilder,
    this.activityIndicator,
    EmptyWidgetBuilder<T>  isEmptyBuilder,
    this.successBuilder,
    AsyncWidgetBuilder<T>  fieldBuilder


  }) : _isEmptyBuilder = isEmptyBuilder ,
        _fieldBuilder = fieldBuilder,
        super(key : key);

  /// 异步函数
  final Future<T> future;

  /// 请求成功回调
  final AsyncWidgetBuilder<T> successBuilder;

  /// 请求失败回调
  final AsyncWidgetBuilder<T> _fieldBuilder;

  /// 用于显示空白页面的widget
  final AsyncWidgetBuilder<T> emptydBuilder;

  /// 指示器 不传的话 会有默认的大菊花指示器
  final Widget activityIndicator;

  /// 是否需要显示空白页面
  final EmptyWidgetBuilder<T> _isEmptyBuilder;
  @override
  _FutureBuilderWidgetState<T> createState() => _FutureBuilderWidgetState<T>();
}

class _FutureBuilderWidgetState<T> extends State<FutureBuilderWidget<T>> {

  var _future;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _future = widget.future;
  }

  /// MARK:空白页面
  Widget _empty(BuildContext context,AsyncSnapshot<T> snapshot){

    Widget emptyWidget = widget.emptydBuilder(context,snapshot);

    return Center(
        child: emptyWidget == null ? Text("暂时没有数据哦") : emptyWidget
    );
  }

  /// MARK: 错误信息页面
  Widget _error(BuildContext context,AsyncSnapshot<T> snapshot){


    return Center(
      child:  widget._fieldBuilder == null ?
      Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Text("请求失败:"+snapshot.error.toString(),style: TextStyle(color: Colors.red),),
      )
          : widget._fieldBuilder(context,snapshot),
    );
  }

  ///MARK:指示器
  Widget _activityIndicator(){
    return  Builder(
      builder: (context){
        return Center(


          child: widget.activityIndicator != null ? widget.activityIndicator : MusicActivityIndicator(
            color: MusicStore.Theme(context).titleColor,
            radius: 20,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
      future: _future,

      builder: (BuildContext context, AsyncSnapshot<T> snapshot){

        if(snapshot.connectionState == ConnectionState.done){

          if(snapshot.hasError){

            return _error(context,snapshot);


          }else{

            bool isShowEmpty = false;

            if(widget._isEmptyBuilder != null){
              isShowEmpty = widget._isEmptyBuilder(context,snapshot);
            }

            Widget builderWidget =  widget.successBuilder(context,snapshot);

            return  isShowEmpty == true ? _empty(context,snapshot) : builderWidget;

          }

        }else{

          return  _activityIndicator();
        }

      },
    );
  }
}





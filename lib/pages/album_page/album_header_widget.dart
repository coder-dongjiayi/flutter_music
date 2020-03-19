import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:flutter_music/public_widget/music_gestureDetector.dart';
class _IntroductionState extends ChangeNotifier{

  // 0 折叠 1展开
  int mainLine = 3;

  void updateState(){
    mainLine = mainLine == 3 ? 10000 : 3;

    notifyListeners();
  }

}

class AlbumHeaderWidget extends StatelessWidget {
  AlbumHeaderWidget({
    Key key,
    this.coverImageUrl,
    this.title,
    this.desc

}) : super(key : key);

  final String coverImageUrl;
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Padding(
      padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
      child: Column(
        children: <Widget>[
          _songHeader(context),
          _introduction()
        ],
      ),
    );
  }
  Widget _introduction(){

    return ChangeNotifierProvider(
      create: (context) => _IntroductionState(),
      child: Padding(
        padding: EdgeInsets.only(top: 20),

        child: Builder(
          builder: (context){
            return MusicGestureDetector(
              onTap: (){
                Provider.of<_IntroductionState>(context,listen: false).updateState();

              },
                child: Consumer<_IntroductionState>(
                  builder: (context,state,_){
                    return Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            "$desc",
                            textAlign:TextAlign.left,
                            style: TextStyle(fontSize: 12,color: MusicStore.Theme.of(context).subtTitleColor),
                            maxLines: state.mainLine,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    );
                  },
                )
            );
          },
        ),
      ),
    );


  }

  Widget _songHeader(context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _cover(context),
        ),
        Expanded(
          flex: 1,
          child: _title(context),
        )
      ],
    );
  }

  Widget _title(context){

    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Text(
        "$title",


        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: MusicStore.Theme.of(context).titleColor),

      ),
    );
  }

  Widget _cover(context){
    return Container(
      width: ScreenAdapter.setWidth(316),
      height: ScreenAdapter.setHeight(240),
      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color:MusicStore.Theme.of(context).shadowColor,offset: Offset(10,10),blurRadius: 10),
            BoxShadow(color: Colors.white,offset: Offset(-10,-10),blurRadius: 26)
          ]
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: "$coverImageUrl",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

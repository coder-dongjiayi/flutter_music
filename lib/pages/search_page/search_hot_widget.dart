import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

class SearchHotWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
      child:  CustomScrollView(

        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _title(context),
          ),
          SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: 4.5
              ),
              delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
                return _hotItem(context);
              }, childCount: 20
              )
          )
        ],
      ),
    );
  }


  Widget _title(context){
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
      child: Text("热搜榜",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 20,
              color: MusicStore.Theme(context).titleColor,
              fontWeight: FontWeight.w500)),
    );
  }

  Widget _hotItem(context){
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MusicStore.Theme(context).theme,
          boxShadow: MusicStore.boxShow(context, -3, 5)),
      child: Text("后来",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: MusicStore.Theme(context).titleColor,
              fontWeight: FontWeight.w500)),
    );
  }
}

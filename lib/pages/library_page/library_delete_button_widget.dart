import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/pages/library_page/library_state/library_list_state.dart';


class LibraryDeleteButtonWidget extends StatelessWidget {
  LibraryDeleteButtonWidget({
    Key key,
    this.index

  }): super(key : key);

  final  int index;
  @override
  Widget build(BuildContext context) {


    return MusicGestureDetector(
      onTap: (){
        LibraryListState.updateDeleteState(context, index);
      },
      child: _deleteButton(context),
    );
  }
  Widget _deleteButton(BuildContext context){
    return Container(
      color: MusicStore.Theme.of(context).theme,

      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: ScreenAdapter.setHeight(180),
      margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
      padding: EdgeInsets.only(left: 0,),
      child: Container(
        width: ScreenAdapter.setWidth(30),
        height:  ScreenAdapter.setHeight(30),
        margin: EdgeInsets.only(left: 5),
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Selector<LibraryListState,bool>(
          builder: (context,selected,_){

            return Container(
              width: ScreenAdapter.setWidth(20),
              height: ScreenAdapter.setWidth(20),
              decoration: BoxDecoration(
                  color: selected == false ? Colors.white : Colors.red,
                  borderRadius: BorderRadius.circular(5)
              ),

            );
          },
          selector: (BuildContext context,LibraryListState state){
            return state.dataSource[index].selected;
          },
          shouldRebuild: (pre,next){
            return pre != next;
          },
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenAdapter.setWidth(15)),
            color: MusicStore.Theme
                .of(context)
                .theme,
            boxShadow: MusicStore.boxShow(context,-3, 3),
            gradient:LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                MusicStore.Theme.of(context).bottomShadowColor,
                MusicStore.Theme.of(context).topShadowColor
              ],

            )
        ),
      ),
    );
  }
}




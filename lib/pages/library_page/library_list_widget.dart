
import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/public_widget/future_builder_widget.dart';
import 'package:flutter_music/pages/library_page/library_empty_widget.dart';
import 'package:flutter_music/models/play_list_model.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/pages/album_page/album_page.dart';
import 'package:flutter_music/common/screen_adapter.dart';
import 'package:flutter_music/pages/library_page/library_item_widget.dart';
import 'package:flutter_music/pages/library_page/library_controller/library_list_controller.dart';
import 'package:flutter_music/pages/library_page/library_state/library_list_state.dart';





class LibraryListWidget extends StatefulWidget {

  LibraryListWidget({
    Key key,
    this.libraryListController
}) : super(key:key);

  final LibraryListController libraryListController;
  @override
  _LibraryListWidgetState createState() => _LibraryListWidgetState();
}

class _LibraryListWidgetState extends State<LibraryListWidget> with TickerProviderStateMixin {


  Future _future = MusicApi.requestPlayList();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.libraryListController.initAnimation(vsync: this);

  }

  @override
  Widget build(BuildContext context) {

    ScreenAdapter.init(context);

    return
      FutureBuilderWidget<List<PlayItemModel>>(

      future: _future,

      emptydBuilder: (BuildContext context,
          AsyncSnapshot<List<PlayItemModel>> snapshot) {
        return LibraryEmptyWidget();
      },

      isEmptyBuilder: (BuildContext context,
          AsyncSnapshot<List<PlayItemModel>> snapshot) {
        return snapshot.data.length == 0 ? true : false;
      },

      successBuilder: (BuildContext context,
          AsyncSnapshot<List<PlayItemModel>> snapshot) {

        LibraryListState.initDataSource(context, snapshot.data);


        Widget listView = _listView();

        return  listView;
      },
    );
  }


  Widget _listView() {

    return Builder(

      builder: (context){
      List<PlayItemModel> dataSource =  LibraryListState.getDataSource(context);
        return ListView.builder(

            itemBuilder: (BuildContext context, int index) {

              PlayItemModel itemModel =dataSource[index];

              return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return AlbumPage(id: itemModel.id);
                        }
                    ));
                  },
                  child: AnimatedBuilder(
                    animation: widget.libraryListController.editAnimation,
                    builder: (context,_){
                      return LibraryItemWidget(
                        index: index,
                        coverImage: itemModel.coverImgUrl,
                        name: itemModel.name,
                        desc: itemModel.description,
                        marginLeft: widget.libraryListController.editAnimation.value,
                      );
                    },
                  )
              );
            },
            padding: EdgeInsets.only(top: 30),

            itemCount:dataSource.length
        );
      },
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}





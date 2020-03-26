import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/public_widget/future_builder_widget.dart';
import 'package:flutter_music/pages/library_page/library_empty_widget.dart';
import 'package:flutter_music/models/play_list_model.dart';
import 'package:flutter_music/http_request/music_api.dart';
import 'package:flutter_music/pages/album_page/album_page.dart';
import 'package:flutter_music/common/screen_adapter.dart';
import 'package:flutter_music/pages/library_page/library_item_widget.dart';
import 'package:flutter_music/pages/library_page/library_state/library_list_state.dart';

class LibraryListWidget extends StatefulWidget {
  LibraryListWidget({Key key}) : super(key: key);


  @override
  _LibraryListWidgetState createState() => _LibraryListWidgetState();
}

class _LibraryListWidgetState extends State<LibraryListWidget>
    with TickerProviderStateMixin {
  Future _future = MusicApi.requestPlayList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LibraryListState.libraryState(context).initEditAnimation(this);

  }

  @override
  Widget build(BuildContext context) {

    ScreenAdapter.init(context);

    return FutureBuilderWidget<List<PlayItemModel>>(
      future: _future,
      emptydBuilder:
          (BuildContext context, AsyncSnapshot<List<PlayItemModel>> snapshot) {
        return LibraryEmptyWidget();
      },
      isEmptyBuilder:
          (BuildContext context, AsyncSnapshot<List<PlayItemModel>> snapshot) {
        return snapshot.data.length == 0 ? true : false;
      },
      successBuilder:
          (BuildContext context, AsyncSnapshot<List<PlayItemModel>> snapshot) {
        LibraryListState.initDataSource(context, snapshot.data);

        return _selector(context);
      },
    );
  }

  Widget _selector(BuildContext context) {
    List<PlayItemModel> dataSource = LibraryListState.getDataSource(context);
    return Selector<LibraryListState, int>(
      builder: (context, state, _) {
        return _listView(dataSource);
      },
      selector: (context, state) {
        return state.dataSource.length;
      },
      shouldRebuild: (pre, next) {
        return pre != next;
      },
    );
  }



  Widget _listView(List<PlayItemModel> dataSource) {
    return Builder(builder: (context) {

      return dataSource.length == 0
          ? LibraryEmptyWidget()
          : ListView.builder(
        padding: EdgeInsets.only(top: 30),

        itemCount: dataSource.length,

          itemBuilder: (context,index){
            PlayItemModel itemModel = dataSource[index];

            return LibraryItemWidget(
              animation: LibraryListState.libraryState(context).editAnimation,
              onTap: (index) {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return AlbumPage(id: itemModel.id);
                    }));
              },
              index: index,
              coverImage: itemModel.coverImgUrl,
              name: itemModel.name,
              desc: itemModel.description,

            );
          }
      );

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/pages/library_page/library_delete_button_widget.dart';
import 'package:flutter_music/pages/library_page/library_state/library_list_state.dart';
typedef GestureTapCallback = void Function(int index);


class LibraryItemWidget extends StatefulWidget {
  LibraryItemWidget(
      {Key key,
        this.onTap,
        this.index,
        this.coverImage,
        this.name,
        this.desc,
        this.animation
      })
      : super(key: key);

  final String coverImage;
  final String name;
  final String desc;

  final int index;
  final Animation<Offset> animation;
  final GestureTapCallback onTap;
  @override
  _LibraryItemWidgetState createState() => _LibraryItemWidgetState();
}

class _LibraryItemWidgetState extends State<LibraryItemWidget> with TickerProviderStateMixin {

  Size _size;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();



   LibraryListState libraryListState = LibraryListState.libraryState(context);

    libraryListState.initDeleteAnimation(this);


    WidgetsBinding.instance.addPostFrameCallback(onAfterRender);
  }
  @override
  void didUpdateWidget(LibraryItemWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback(onAfterRender);
  }

  void onAfterRender(Duration timeStamp){
    _size = context.size;
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);

    return  Selector<LibraryListState,bool>(
      shouldRebuild: (pre,next){
        return pre != next;
      },
      selector: (context,state){
        return state.dataSource[widget.index].slideEnd;
      },
      builder: (context,slideEnd,_){
        return slideEnd == true ? _sizeTransition() : _slideTransition();
      },
    );

  }

  Widget _sizeTransition(){
    Animation sizeAnimation = LibraryListState.libraryState(context).sizeAnimationList[widget.index];

    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: sizeAnimation,
      child: Material(
        color: Colors.transparent,
        child: SizedBox.fromSize(size: _size),
      ),
    );
  }

  Widget _slideTransition(){
    Animation animation = LibraryListState.libraryState(context).sliderAnimationList[widget.index];

    return SlideTransition(
        position: animation,
        child: Stack(
          children: <Widget>[

            LibraryDeleteButtonWidget(
              index: widget.index,
            ),

            SlideTransition(
              position: widget.animation,
              child: _libraryCoverItem(
                widget.coverImage,
                widget.name,
                widget.desc,
              ),
            )
          ],
        )
    );
  }

  Widget _libraryCoverItem(coverImage, name, desc) {
    return Builder(builder: (context){
      return  Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MusicStore.Theme.of(context).theme,
            boxShadow: [
              BoxShadow(
                  color: MusicStore.Theme.of(context).shadowColor,
                  offset: Offset(10, 10),
                  blurRadius: 10),
              BoxShadow(
                  color: Colors.white, offset: Offset(-10, -10), blurRadius: 26)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _itemCover(context, coverImage),
            Expanded(
              flex: 1,
              child: _itemTitle(context, name, desc),
            ),
            Icon(Icons.keyboard_arrow_right,
                size: 20, color: MusicStore.Theme.of(context).titleColor)
          ],
        ),
      );
    });
  }

  Widget _itemCover(context, coverImage) {
    return Container(
      width: ScreenAdapter.setWidth(140),
      height: ScreenAdapter.setHeight(140),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: MusicStore.Theme.of(context).theme,
          boxShadow: [
            BoxShadow(
                color: MusicStore.Theme.of(context).shadowColor,
                offset: Offset(10, 10),
                blurRadius: 10),
            BoxShadow(
                color: Colors.white, offset: Offset(-10, -10), blurRadius: 26)
          ]),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl: "$coverImage",
            fit: BoxFit.cover,
          )),
    );
  }

  Widget _itemTitle(context, name, desc) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$name",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: MusicStore.Theme.of(context).titleColor)),
          Padding(
              padding: EdgeInsets.only(top: 3, right: 60),
              child: Text(
                "$desc",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12,
                    color: MusicStore.Theme.of(context).subtTitleColor),
              ))
        ],
      ),
    );
  }
}






import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/common/screen_adapter.dart';



class MusicBottomPlay extends StatefulWidget {


  MusicBottomPlay({
    Key key,
    this.animationController

  }):super(key: key);

  final AnimationController  animationController;
  @override
  _MusicBottomPlayState createState() => _MusicBottomPlayState();
}

class _MusicBottomPlayState extends State<MusicBottomPlay> with TickerProviderStateMixin{


  MusicGlobalPlayListState _musicGlobalPlayListState;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _musicGlobalPlayListState = MusicStore.MusicPlayList(context);


    _musicGlobalPlayListState.onPlayerStateChanged.listen((state){

      if(this.mounted == false)return;

       if(state == AudioPlayerState.PAUSED){
         widget.animationController.stop();

      }else{
         widget.animationController.repeat();
       }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MusicStore.Theme(context).theme,
        border: Border(top: BorderSide(color: MusicStore.Theme(context).topShadowColor,width: 0.5))
      ),
      padding: EdgeInsets.only(top: 5,bottom: 5),
      margin: EdgeInsets.only(bottom: 40),
      width: double.infinity,
      height: ScreenAdapter.setHeight(100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 1,
            child:Selector<MusicGlobalPlayListState,int>(
              selector: (context,state){
                return state.currentIndex;
              },
              shouldRebuild: (pre,next){
                return pre != next;
              },
              builder: (context,currentIndex,_){
                return  _playInfo();
              },
            ),
          ),
          _pause(),
          _muiscList(),
        ],
      ),
    );
  }

  Widget _muiscList() {
    return MusicGestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(RouterPageName.MusicListPage);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.format_list_bulleted,
            size: ScreenAdapter.setHeight(60),
            color: MusicStore.Theme(context).titleColor),
      ),
    );

  }

  Widget _pause() {
    return Selector<MusicGlobalPlayListState,AudioPlayerState>(
      shouldRebuild: (pre,next){
        return pre != next;
      },
      selector: (context,state){
        return state.playerState;
      },
      builder: (context,audioState,_){
        return MusicGestureDetector(
          onTap: (){

            if(audioState == AudioPlayerState.PLAYING){
              _musicGlobalPlayListState.music_pause();
            }
            if(audioState == AudioPlayerState.PAUSED){
              _musicGlobalPlayListState.music_resume();
            }


          },
          child: Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child:  Icon( audioState == AudioPlayerState.PAUSED ? Icons.play_circle_outline : Icons.pause ,
                size: ScreenAdapter.setHeight(70),
                color: MusicStore.Theme(context).titleColor),
          ),
        );
      },
    );
  }

  Widget _playInfo() {
    TrackItemModel itemModel = _musicGlobalPlayListState.currentTrackItem;
    return MusicGestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(
            RouterPageName.MusicPlayMeidaPage,
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Row(
          children: <Widget>[
            RotationTransition(
                alignment: Alignment.center,
                turns: widget.animationController,
                child: _clipOval(itemModel.al.picUrl)
            ),
            Expanded(
              flex: 1,
              child: _title(itemModel.name+"-"+itemModel.arList.first.name),
            )
          ],
        ),
      ),
    );
  }

  Widget _clipOval(imageUrl){
    return ClipOval(
        child: CachedNetworkImage(
          imageUrl: "$imageUrl",
          fit: BoxFit.cover,
          placeholder: (context,url){
            return Icon(Icons.music_note,size: ScreenAdapter.setWidth(70),color:MusicStore.Theme(context).bottomShadowColor);
          },
        )

    );

  }
  Widget _title(title){
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        "$title",
        maxLines: 2,
        style: TextStyle(color: MusicStore.Theme(context).titleColor),),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

}

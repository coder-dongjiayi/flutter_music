import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_music/http_request/music_api.dart';
class BanerScrollState extends ChangeNotifier{
  int currentIndex = 0;
  void setIndex(index){
    currentIndex = index;
    notifyListeners();
  }
}

class BrowseBannerWidget extends StatelessWidget {

   final Future _future = MusicApi.choicenessSongList(order: "hot",limit: 4);


  @override
  Widget build(BuildContext context) {

    return FutureBuilderWidget<List<PlayItemModel>>(
      future: _future,

      successBuilder: (BuildContext context, AsyncSnapshot<List<PlayItemModel>> snapshot){

        return _banner(snapshot.data);
      },
    );


  }
  Widget _banner(List<PlayItemModel> list){

    return  MultiProvider(
        providers: [
          ChangeNotifierProvider<BanerScrollState>(create: (_)=>BanerScrollState())
        ],

        child:

        Consumer<BanerScrollState>(
          builder: (context,state,_){
            return Column(
              children: <Widget>[
                _swiperList(list),
                _swiperControlList(list)
              ],
            );

          },
        )
    );
  }

  ///轮播图下面的control
  Widget _swiperControlList(List<PlayItemModel>  list){

    List<Widget> _listWidget = List<Widget>.generate(list.length , (int index){

      return  _swiperControlItem(index);

    });

    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _listWidget
      ),
    );
  }

///每一个control

  Widget _swiperControlItem(index){

    return Builder(

      builder: (context){

        return Container(
          width:  Provider.of<BanerScrollState>(context).currentIndex == index ? 30 : 10,
          height:   Provider.of<BanerScrollState>(context).currentIndex == index ? 8 : 10,
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color:index ==  Provider.of<BanerScrollState>(context).currentIndex ? MusicStore.Theme(context).tabItemSelectedColor: Color.fromRGBO(223, 230, 235, 1.0)
          ),
        );
      },
    );
  }

/// 轮播图
  Widget _swiperList(List<PlayItemModel> list){
    return Builder(
      builder: (context){
        return AspectRatio(
          aspectRatio: 1.8,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: MusicStore.boxShow(context,-15, 10)
              ),
              margin: EdgeInsets.only(left: 20,right: 20,top: 30),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Swiper(

                duration: 1000,
                autoplayDelay: 5000,
                autoplay: true,
                itemCount: list.length,
                onIndexChanged: (index){

                  Provider.of<BanerScrollState>(context,listen: false).setIndex(index);

                },
                itemBuilder: (context,index){

                  return  _swiperItem(list[index].coverImgUrl);
                },

              )
          ),
        );
      },
    );
  }


  Widget _swiperItem(imageUrl){

    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),

      ),
      child: ClipRRect(
        borderRadius:  BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        )
      ),

    );
  }
}







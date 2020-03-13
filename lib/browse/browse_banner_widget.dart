import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
class BanerScrollState extends ChangeNotifier{
  int currentIndex = 0;
  void setIndex(index){
    currentIndex = index;
    notifyListeners();
  }
}

class BrowseBannerWidget extends StatelessWidget {
  @override

  var _imageList = [
    "https://pic.xiami.net/images/album/img78/978/49051469082316.jpg?x-oss-process=image/quality,q_80/format,jpg",
    "https://pic.xiami.net/images/collect/398/98/38578398_1456470468_2XCC.jpg?x-oss-process=image/quality,q_80",
    "https://pic.xiami.net/images/collect/419/19/30042419_1410842309_hiFG.jpg?x-oss-process=image/quality,q_80",
    "https://pic.xiami.net/images/collect/844/44/361042844_5a3cb6d0baa1d_bKum_1513928400.jpg?x-oss-process=image/quality,q_80"
  ];


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BanerScrollState>(create: (_)=>BanerScrollState())
      ],

      child: Consumer<BanerScrollState>(
        builder: (context,state,_){
          return Column(
            children: <Widget>[
              _swiperList(),
              _swiperControlList()
            ],
          );
        },
      )
    );

  }

  ///轮播图下面的control
  Widget _swiperControlList(){
    var _index = 0;
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _imageList.map((_){
            Widget item =  _swiperControlItem(_index);
            _index ++;
            return item;

          }).toList()
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
              color:index ==  Provider.of<BanerScrollState>(context).currentIndex ? Color.fromRGBO(85, 161, 193, 1.0): Color.fromRGBO(223, 230, 235, 1.0)
          ),
        );
      },
    );
  }

/// 轮播图
  Widget _swiperList(){
    return Builder(
      builder: (context){
        return AspectRatio(
          aspectRatio: 1.8,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color:MusicStore.Theme.of(context).shadowColor,offset: Offset(15,15),blurRadius: 10),
                    BoxShadow(color: Colors.white,offset: Offset(-10,-10),blurRadius: 26)

                  ]
              ),
              margin: EdgeInsets.only(left: 20,right: 20,top: 30),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Swiper(

                duration: 1000,
                autoplayDelay: 5000,
                autoplay: true,
                itemCount: 4,
                onIndexChanged: (index){

                  Provider.of<BanerScrollState>(context,listen: false).setIndex(index);

                },
                itemBuilder: (context,index){

                  return  _swiperItem(index);
                },

              )
          ),
        );
      },
    );
  }


  Widget _swiperItem(index){

    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),

      ),
      child: ClipRRect(
        borderRadius:  BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: _imageList[index],
          fit: BoxFit.cover,
        )
      ),

    );
  }
}







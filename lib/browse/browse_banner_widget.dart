import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BrowseBannerWidget extends StatelessWidget {

  var _imageList = [
    "https://pic.xiami.net/images/album/img78/978/49051469082316.jpg?x-oss-process=image/quality,q_80/format,jpg",
    "https://pic.xiami.net/images/collect/398/98/38578398_1456470468_2XCC.jpg?x-oss-process=image/quality,q_80",
    "https://pic.xiami.net/images/collect/419/19/30042419_1410842309_hiFG.jpg?x-oss-process=image/quality,q_80",
    "https://pic.xiami.net/images/collect/844/44/361042844_5a3cb6d0baa1d_bKum_1513928400.jpg?x-oss-process=image/quality,q_80"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 30),

      child: _swiperItem()
    );
  }

  Widget _swiperItem(){

    return Container(

      decoration: BoxDecoration(
        color: Colors.yellow
      ),
      child:AspectRatio(
        aspectRatio: 1.5,
        child: ClipRRect(
          child: Image.network(_imageList[1],fit: BoxFit.cover,),
        ),
      ),
    );
  }
}

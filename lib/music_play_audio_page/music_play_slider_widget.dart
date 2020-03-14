import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

class MusicPlaySliderWidget extends StatefulWidget {
  @override
  _MusicPlaySliderWidgetState createState() => _MusicPlaySliderWidgetState();
}

class _MusicPlaySliderWidgetState extends State<MusicPlaySliderWidget> {

 double _progressValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
      child: Column(
        children: <Widget>[
          _slider(context),
          _time(context)
        ],
      ),
    );
  }
  
  Widget _time(context){
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("1:30",style: TextStyle(fontSize: 12,color: Color.fromRGBO(165, 171, 191, 1.0))),
          Text("3.30",style: TextStyle(fontSize: 12,color: Color.fromRGBO(165, 171, 191, 1.0)))
        ],
      ),
    );
  }

  Widget _slider(context){
    return SliderTheme(

      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Color.fromRGBO(151, 160, 235, 1.0),
        inactiveTrackColor: MusicStore.Theme.of(context).shadowColor,
        trackHeight: 3,
        overlayColor:Colors.white,
        thumbColor:Color.fromRGBO(151, 160, 235, 1.0),
        overlayShape:RoundSliderOverlayShape(//可继承SliderComponentShape自定义形状
          overlayRadius: 10, //滑块外圈大小

        ),
        thumbShape: RoundSliderThumbShape(//可继承SliderComponentShape自定义形状
          disabledThumbRadius: 5, //禁用是滑块大小
          enabledThumbRadius: 5, //滑块大小
        ),

      ),
      child: Slider(
        onChanged: (double value) {
          setState(() {
            _progressValue = value;
          });
        },
        value: _progressValue,
      ),
    );
  }
}


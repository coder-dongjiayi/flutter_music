import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_music/common/music_store.dart';

typedef ValueChanged<bool> = void Function(bool value);

class PersonSwitchItemWidget extends StatefulWidget {
  PersonSwitchItemWidget({
    Key key,
    this.title,
    this.margin : const EdgeInsets.fromLTRB(20, 0, 20, 0),
    this.onChanged,
    this.value : false

}):super(key : key);
  final String title;
  final EdgeInsets margin;
  final ValueChanged onChanged;

   var  value;

  @override
  _PersonSwitchItemWidgetState createState() => _PersonSwitchItemWidgetState();
}

class _PersonSwitchItemWidgetState extends State<PersonSwitchItemWidget> {

  @override
  Widget build(BuildContext context) {
    return _switchItem();
  }
  Widget _switchItem(){
    return Container(
        margin: widget.margin,
        padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MusicStore.Theme.of(context).theme,
            boxShadow:MusicStore.boxShow(context, -10, 10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[

            Text(widget.title ,style: TextStyle(color: MusicStore.Theme.of(context).titleColor),),


              CupertinoSwitch(
                activeColor: Colors.red,
                value: widget.value,
                onChanged: (state){
                  if(widget.onChanged != null){
                    widget.onChanged(state);
                  }
                  setState(() {
                    widget.value = !widget.value;
                  });
                },
              ),

          ],
        )
    );
  }
}

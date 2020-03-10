import 'package:flutter/material.dart';
class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: Center(
       child: Container(
         width: 100,
         height: 100,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Color.fromRGBO(241, 243, 246, 1.0),
             boxShadow: [
               BoxShadow(color: Color.fromRGBO(162, 173, 190, 1.0),offset: Offset(12,12),blurRadius: 20)
             ]
         ),
         child: Icon(Icons.favorite),
       ),
     ),
    );
  }
}

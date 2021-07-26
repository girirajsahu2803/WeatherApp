import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/UtilClass.dart';

class AnimatedList extends StatefulWidget {
  @override
  _AnimatedListState createState() => _AnimatedListState();
}

class _AnimatedListState extends State<AnimatedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('test') ,
      ),
        body:AnimatedList(


        ),
    );
  }
}

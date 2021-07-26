import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityEnter extends StatefulWidget {
  @override
  _CityEnterState createState() => _CityEnterState();
}

class _CityEnterState extends State<CityEnter> {
  var passValue;
  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
    borderSide: BorderSide(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black26,
        body: Container(
          child: Center(
            child: TextField(
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
              passValue=value;
                print(passValue);
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    Navigator.pop(context, passValue);
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                  color: Colors.white,
                ),
                enabledBorder: inputBorder,
                border: inputBorder,
                focusedBorder: inputBorder,
                hintText: 'Search City',
                hintStyle: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
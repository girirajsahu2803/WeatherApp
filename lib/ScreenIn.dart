import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/UtilClass.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:intl/intl.dart';

class ScreenIn extends StatefulWidget {
  ScreenIn({this.weather, this.name, this.locationtemp,this.code});

  final String weather;
  final String name;
  final double locationtemp;
  final String code;

  @override
  _ScreenInState createState() => _ScreenInState();
}

class _ScreenInState extends State<ScreenIn> {
  String wethim;
  String nameC;
  int locationtemprature;
  var O1 = ' ';
  var O2 = ' ';
  var O3 = ' ';

  Color choiceChange(int n) {
    if (n == 1) {
      O1 = 'O';
      O2 = ' ';
      O3 = ' ';
    } else if (n == 2) {
      O1 = '';
      O2 = 'O';
      O3 = ' ';
    } else if (n == 3) {
      O1 = '';
      O2 = ' ';
      O3 = 'O';
    }
  }


  CategoryScroller categoryScroller = CategoryScroller();
  ScreenshotController screenshotController = ScreenshotController();
  @override
  void initState() {
    super.initState();
    choiceChange(1);
    print(widget.weather);
    wethim = widget.weather;
  }
String getString(String x){
    if(x==null){
      x=' ';
      return x;
    }
    else
      return x;
}
  @override
  Widget build(BuildContext context) {
    DateTime now= new DateTime.now();
    var dayname =(DateFormat('EEEE').format(now));
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            height: height,
            width: width,
            child:Container(
              decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage('Images/$wethim.jpg'),),
              ),
            ),
            //Image.asset('Images/$wethim.jpg'),
          ),
          Scaffold(
            backgroundColor: Colors.black26,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                '${widget.name}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              actions: [
                IconButton(
                    icon: ClipOval(
                      child: CircleAvatar(
                        child: Image.asset('Images/j.jpg'),

                        // backgroundColor: Colors.black26,
                      ),
                    ),
                    onPressed: () {})
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Screenshot(
                          controller: screenshotController,
                          child: Container(
                            height: height / 2.7,
                            width: width / 2,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(getString(widget.code),style: TextStyle(fontSize: 45),),
                                Text(
                                  '${widget.name}',
                                  style: TextStyle(
                                      fontSize: 30, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${widget.locationtemp} °C',
                                  style: TextStyle(
                                      fontSize: 40, fontWeight: FontWeight.w500),
                                ),
                                Text('$dayname'),
                                Text('${now.day}/${now.month}/${now.year}'),
                              ],
                            ),
                          ),
                        ),
                        Container(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 85,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Weather',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '$O1',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      choiceChange(1);
                                    });
                                  },
                                ),

                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Precipitation',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '$O2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      choiceChange(2);
                                    });
                                  },
                                ),

                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Wind',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '$O3',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      choiceChange(3);
                                    });
                                  },
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: height / 3,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 10,
                        ),
                      ),
                      child: CategoryScroller(),
                    ),
                    Container(),

                  ],
                ),
              ),
            ),

            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Color(0xFF042D40),
              items: <Widget>[
                Icon(
                  Icons.fiber_manual_record_outlined,
                  size: 30,
                  color: Color(0xFF042D40),
                ),
                Icon(
                  Icons.home,
                  size: 30,
                  color: Color(0xFF042D40),
                ),
                Icon(
                  Icons.save,
                  size: 30,
                  color: Color(0xFF042D40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/ScreenIn.dart';
import 'ScreenIn.dart';
import 'UtilClass.dart';
import 'LoadingScreen.dart';
import 'package:screenshot/screenshot.dart';

class Screen0 extends StatefulWidget {
  @override
  _Screen0State createState() => _Screen0State();
}
const apiKey ='e0576caafe190b7c48d7ac930fda8fb9';
enum MenuOption { add, subtract }

class _Screen0State extends State<Screen0> {

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(40.0)),
      borderSide: BorderSide(color: Colors.white),
    );
    final col = Color(0xFF042D40);
    String passValue;
    var cityName1;
    List<Widget> cards = [
      Padding(
        padding: const EdgeInsets.all(7.50),
        child: GestureCard(
          height: height,
          weather: 'Clouds',
          width: width,
          image: 'mount',
          name: 'Tokyo',
          cityName: 'Tokyo',
          locationtemp: 21.0,
          statement: 'Cloudy Weather',

        ),
      ),
      Padding(
        padding: const EdgeInsets.all(7.50),
        child: GestureCard(
          height: height,
          weather: 'Clear',
          width: width,
          image: 'newyork',
          name: 'NewYork',
          cityName: 'NewYork',
          locationtemp: 27.0,
          statement: 'ClearWeather',

        ),
      ),
      Padding(
        padding: const EdgeInsets.all(7.50),
        child: GestureCard(
          height: height,
          weather: 'Clear',
          width: width,
          image: 'greece',
          name: 'Greece',
          cityName: 'Greece',
          locationtemp: 32.0,
          statement: 'Clear Weather',

        ),
      ),
      Padding(
        padding: const EdgeInsets.all(7.50),
        child: GestureCard(
          height: height,
          weather: 'snowy',
          width: width,
          image: 'snowy',
          name: 'Gotham',
          cityName: 'Gotham',
          locationtemp: 3.0,
          statement: 'Snowy Weather',

        ),
      ),
    ];

    Future addi() async {
      print(cityName1);
      setState(() {
        cards.add(Padding(
          padding: const EdgeInsets.all(7.50),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('$cityName1 tapped');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScreenIn(
                      name: '$cityName1',
                      weather: 'cloudyweather',
                      locationtemp: 27,
                    );
                  }));
                },
                child: CityCard(
                  height: height,
                  width: width,
                  image: 'mount',
                  statement: 'Cloudy Weather',
                  cityName: 'Tokyo',
                  temp: '27*C',
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ));
      });
      return cards;
    }
int temp;
    String weather;


    return Stack(
        children: [
      Positioned(
        bottom: height / 2.4,
        child: Image.asset('Images/city.jpg'),
        height: height / 1.3,
      ),
      Positioned(
        bottom: 0,
        child: Container(
          height: height / 2.4,
          width: width,
          color: Color(0xFF042D40),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Center(
            child: Text('Weather',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                )),
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
          ),
          actions: [
            IconButton(
                icon: ClipOval(
                  child: CircleAvatar(
                    child: Image.asset('Images/j.jpg'),

                    // backgroundColor: Colors.black26,
                  ),
                ),
                onPressed: () {
                  print('pressed');
                })
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18,
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              fontFamily: 'Raleway',
            ),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Hello Giri',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Check the weather of desired city',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    TextField(
                      onChanged: (value) {
                        passValue = value;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () async{
                            Weather weatherData = Weather();
                            await weatherData.getWeatherData(passValue);
                            print(passValue);
                            print(weatherData.temp);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ScreenIn(weather:weatherData.weather,locationtemp: weatherData.temp,name: passValue,
                                code: weatherData.getWeatherIcon(weatherData.code),);
                              }),
                            );
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
                    SizedBox(
                      height: 85,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Locations',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        PopupMenuButton<MenuOption>(
                          icon: ClipOval(
                            child: OutlinedButton(
                              child: FittedBox(
                                child: Icon(
                                  Icons.more_horiz,
                                  size: 25,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: 1.5, color: CupertinoColors.white),
                                primary: CupertinoColors.white,
                                shape: CircleBorder(),
                              ),
                            ),
                          ),
                          onSelected: (value) async {
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                child: Text('Add'),
                                value: MenuOption.add,
                              )
                            ];
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Stack(
                      children: [
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Row(
                              children: cards,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ]),
            ),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color(0xFF042D40),
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Color(0xFF042D40),
            ),
            Icon(
              Icons.fiber_manual_record_outlined,
              size: 30,
              color: Color(0xFF042D40),
            ),
            Icon(
              Icons.save,
              size: 30,
              color: Color(0xFF042D40),
            ),
          ],
          onTap: (index) {
            print(index);
          },
        ),
        //body: Container(color: Colors.blueAccent),
      )
    ]);
  }
}

class GestureCard extends StatefulWidget {
  GestureCard({
    this.height,
    this.width,
    this.weather,
    this.name,
    this.cityName,
    this.locationtemp,
    this.statement,
    this.image,
    this.code,
  });

  final double height;
  final double width;
  final weather;
  final name;
  final locationtemp;
  final cityName;
  final statement;
  final image;
   final code;
  @override
  _GestureCardState createState() => _GestureCardState();
}

class _GestureCardState extends State<GestureCard> {
  Weather weather = Weather();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('${widget.cityName} tapped');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ScreenIn(
            name: '${widget.name}',
            weather: '${widget.weather}',
            locationtemp: widget.locationtemp,
          );
        }));
      },
      child: CityCard(
        height: widget.height,
        width: widget.width,
        image: '${widget.image}',
        statement: '${widget.statement}',
        cityName: '${widget.cityName}',
        temp: '${widget.locationtemp}°C',
      ),
    );
  }
}

// Row(
// children: [
// GestureDetector(
// onTap: () {
// print('tokyo tapped');
// Navigator.push(context,
// MaterialPageRoute(builder: (context) {
// return ScreenIn(
// name: 'Tokyo',
// weather: 'cloudyweather',
// locationtemp: 27,
// );
// }));
// },
// child: CityCard(
// height: height,
// width: width,
// image: 'mount',
// statement: 'Cloudy Weather',
// cityName: 'Tokyo',
// temp: '27*C',
// ),
// ),
// SizedBox(
// width: 15,
// ),
// GestureDetector(
// onTap: () {
// print('greece tapped');
// Navigator.push(context,
// MaterialPageRoute(builder: (context) {
// return ScreenIn(
// name: 'Athens',
// weather: 'rainy',
// locationtemp: 23);
// }));
// },
// child: CityCard(
// height: height,
// width: width,
// image: 'greece',
// statement: 'Rainy Weather',
// cityName: 'Athens',
// temp: '23*C',
// ),
// ),
// SizedBox(
// width: 15,
// ),
// GestureDetector(
// onTap: () {
// print('newyork tapped');
// Navigator.push(context,
// MaterialPageRoute(builder: (context) {
// return ScreenIn(
// name: 'New York',
// weather: 'clear',
// locationtemp: 25);
// }));
// },
// child: CityCard(
// height: height,
// width: width,
// image: 'newyork',
// statement: 'Clear Weather',
// cityName: 'New York',
// temp: '25*C',
// ),
// ),
// SizedBox(
// width: 15,
// ),
// GestureDetector(
// onTap: () {
// print('greece tapped');
// Navigator.push(context,
// MaterialPageRoute(builder: (context) {
// return ScreenIn(
// name: 'Madripur',
// weather: 'snowy',
// locationtemp: 19);
// }));
// },
// child: CityCard(
// height: height,
// width: width,
// image: 'city',
// statement: 'Snowy Weather',
// cityName: 'Madripur',
// temp: '19*C',
// ),
// ),
// SizedBox(
// width: 15,
// ),
// ],
// ),

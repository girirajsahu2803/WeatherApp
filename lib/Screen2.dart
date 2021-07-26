import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return SafeArea(
      child:
 Stack(
          children: [
            Positioned(
              child: Container(
               child: Image.asset('Images/city.jpg'),

              ),
            ),
            Positioned(
                child: Fore(),),
        ],
        ),
      );



  }
}

class Fore extends StatelessWidget {
  const Fore({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF042D40),
          title: Center(
            child: Text('Athens',
                style:TextStyle(
                  fontWeight: FontWeight.w800,
                )),
          ),
        ),
        backgroundColor: Color(0xFF042D40),
        body:Container(
          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardsEle(quality: 'Temperature',value: '32*C',quality2: 'Humidity',value2: '12 %',),
                  SizedBox(width:10),
                ],
              ),
              Row(),

            ],
          ),


        ),
      );
  }
}

class CardsEle extends StatelessWidget {
  const CardsEle({
    Key key,
    this.quality,
    this.value,
    this.quality2,
    this.value2,
  }) : super(key: key);

  final String quality;
  final String quality2;
  final String value;
  final String value2;
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all
            (width: 2,
            color: Colors.white,
          ),
          color:Color(0xFF01212B),

        ),
        child: Padding(

          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SizedBox(height: 15,),
                  Text('$quality'),
                  SizedBox(height: 15,),
                  Text('$value'),
                  SizedBox(height: 15,),
                  SliderTheme(
                    data:SliderThemeData(

                      activeTrackColor: Colors.pink ,
                      inactiveTrackColor: Color(0xFF042D40),
                      thumbColor: Colors.transparent,),
                    child: Slider(

                      min: 0,
                      max: 45,
                        value:20 ,
                    ),
                  ),


                ],
              ),
              Column(
                children: [
                  SizedBox(height: 15,),
                  Text('$quality2'),
                  SizedBox(height: 15,),
                  Text('$value2'),
                  SizedBox(height: 15,),
                  SliderTheme(
                    data:SliderThemeData(
                      activeTrackColor: Colors.pink ,
                      inactiveTrackColor: Color(0xFF042D40),
                      thumbColor: Colors.transparent,),
                    child: Slider(
                    divisions: 10,
                      min: 0,
                      max: 45,
                      value:15,
                    ),
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

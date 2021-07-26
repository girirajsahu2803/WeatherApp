import 'package:flutter/material.dart';
import 'ScreenIn.dart';
import 'Screen0.dart';
import 'LoadingScreen.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

class CardWeek extends StatelessWidget {
  const CardWeek({
    @required this.height,
    this.day,
    this.iconD,
    this.date,
  });

  final String day;
  final String date;
  final double height;
  final String iconD;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$day',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Text(
              '$date',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            Text('$iconD',style: TextStyle(fontSize: 25,),),
          ],
        ),
        height: height / 4,
        width: height / 4.7,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
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
  }) : super(key: key);

  final String quality;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
          color: Color(0xFF01212B),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text('$quality'),
              SizedBox(
                height: 15,
              ),
              Text('$value'),
              SizedBox(
                height: 15,
              ),
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: Colors.pink,
                  inactiveTrackColor: Color(0xFF042D40),
                  thumbColor: Colors.transparent,
                ),
                child: Slider(
                  min: 0,
                  max: 45,
                  value: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryScroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int i=0;
    DateTime now= new DateTime.now();
    var dayname =(DateFormat('EEEE').format(now));
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


    List<String> Dayname =['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];

    String getDayName( String x,int y){
      try{
      for(int i=0;i<Dayname.length;i++){

        if(Dayname[i]==x){
          int z =i;
          if((i-y)<6 && (i-y)>=0){
            return Dayname[i-y];
          }else if((i-y)<0 ){
            return Dayname[7+(i-y)];
          }
        }
      }


      }
    catch(e){print(e);}
    }
    String getDate(int x,int y,int z){
      try{
        if(y==1 || y==3 || y==5|| y==7|| y==8|| y==10|| y==12){
          if(x>0 && x<31){
            return '$x/$y/$z' ;
          }else if(x<=0){
            return'${31+x}/${y-1}/$z';
          }
        }else if(y==4 || y==6 || y==8|| y==9|| y==11){
          if(x>0 && x<30){
            return '$x/$y/$z' ;
          }else if(x<=0){
            return'${30+x}${y-1}/$z';
          }
          else if(y==28){
            if(x>0 && x<28){
              return '$x/$y/$z' ;
            }else if(x<=0){
              return'${28+x}${y-1}/$z';
            }

          }
        }
      }catch(e){print(e);}
    }

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: [
            CardWeek(
              height: height,
              iconD:Weather().getWeatherIcon(750) ,
              day: '${dayname}',
              date: getDate((now.day) ,now.month,now.year),
            ),
            CardWeek(
              height: height,
              iconD: Weather().getWeatherIcon(750),
              day: getDayName('$dayname', 1),
              date: getDate((now.day) -1,now.month,now.year),
            ),
            CardWeek(
              height: height,
              iconD: Weather().getWeatherIcon(800),
              day: getDayName('$dayname', 2),
              date: getDate((now.day) -2,now.month,now.year),
            ),
            CardWeek(
              height: height,
              iconD: Weather().getWeatherIcon(800),
              day: getDayName('$dayname', 3),
              date: getDate((now.day) -3,now.month,now.year),
            ),
            CardWeek(
              height: height,
              day: getDayName('$dayname', 4),
              date: getDate((now.day) -4,now.month,now.year ),
              iconD: Weather().getWeatherIcon(310),
            ),
          ],
        ),
      ),
    );
  }
}
// GestureDetector(
// onTap: (){
// print('tokyo tapped');
// Navigator.push(context, MaterialPageRoute(builder:(context){
// return ScreenIn();
// }));
// },
// child: CityCard(height: height, width: width,image:'mount',statement: 'Clear Weather',
// cityName: 'Tokyo',temp: '27*C',),
// ),
// SizedBox(width:15,),

class CityCard extends StatelessWidget {
  const CityCard({
    Key key,
    @required this.height,
    @required this.width,
    this.image,
    this.cityName,
    this.temp,
    this.statement,
  }) : super(key: key);

  final String image;
  final String cityName;
  final String temp;
  final String statement;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(300)),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: '$cityName',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  text: '$temp',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RichText(
                text: TextSpan(
                  text: '$statement',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            border: Border.all(
              width: 2.0,
              color: Colors.white,
            ),
            image: DecorationImage(
              image: AssetImage('Images/$image.jpg'),
            ),
          ),
          height: height * 0.33,
          width: width * 0.40,
        ),
      ),
    );
  }
}

class Textcall extends StatefulWidget {
  Textcall({this.text});

  final text;

  @override
  _TextcallState createState() => _TextcallState();
}

class _TextcallState extends State<Textcall> {
  @override
  Widget build(BuildContext context) {
    return ScreenIn(
      name: widget.text,
      locationtemp: 15,
      weather: 'snowy',
    );
  }
}
class Addelement {


}
class ListItemWidget extends StatelessWidget {

  final  item;
  final Animation<double> animation ;
  final onClicked;
  final height;
  final width;
  const ListItemWidget({this.item,this.animation,this.onClicked,this.height,this.width});
  @override
  Widget build(BuildContext context) {
    return GestureCard(
      height: height,
      weather: 'clear',
      width: width,
      image: 'newyork',
      name: 'New York',
      cityName: 'New York',
      locationtemp: 27,
      statement: 'Clear Weather',
    );
  }
}
class ImageGallerySaver {
  static const MethodChannel _channel =
  const MethodChannel('image_gallery_saver');

  /// save image to Gallery
  /// imageBytes can't null
  /// return Map type
  /// for example:{"isSuccess":true, "filePath":String?}
  static FutureOr<dynamic> saveImage(Uint8List imageBytes,
      {int quality = 80,
        String name='photo',
        bool isReturnImagePathOfIOS = false}) async {
    assert(imageBytes != null);
    final result =
    await _channel.invokeMethod('saveImageToGallery', <String, dynamic>{
      'imageBytes': imageBytes,
      'quality': quality,
      'name': name,
      'isReturnImagePathOfIOS': isReturnImagePathOfIOS
    });
    return result;
  }

  /// Save the PNG，JPG，JPEG image or video located at [file] to the local device media gallery.
  static Future saveFile(String file, {bool isReturnPathOfIOS = false}) async {
    assert(file != null);
    final result = await _channel.invokeMethod(
        'saveFileToGallery', <String, dynamic>{
      'file': file,
      'isReturnPathOfIOS': isReturnPathOfIOS
    });
    return result;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
const apiKey ='e0576caafe190b7c48d7ac930fda8fb9';

class Weather  {
  double temp;
  String weather;
  int code;
  Future getWeatherData(String passValue)async{
    var response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$passValue&appid=$apiKey&units=metric'));
    int data2= response.statusCode;
    String data;
    print(passValue);
    if(data2==200){
        temp =jsonDecode(response.body)['main']['temp'];
       weather =jsonDecode(response.body)['weather'][0]['main'];
       code =jsonDecode(response.body)['cod'];
    }else{
      print(response.statusCode);
    }

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}

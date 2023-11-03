import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:livetest_m11/weather.dart';

void main() {
  runApp(liveTest_m11());
}

class liveTest_m11 extends StatefulWidget {
  const liveTest_m11({super.key});

  @override
  _liveTest_m11State createState() => _liveTest_m11State();
}

class _liveTest_m11State extends State<liveTest_m11> {
  final jsonName = '''
  [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ]
  ''';

  List<Weather> weatherList = [];

  @override
  void initState() {
    super.initState();
    final jsonData = json.decode(jsonName);
    weatherList = jsonData.map<Weather>((item) => Weather.fromJson(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Info App'),
        ),
        body: ListView.builder(
          itemCount: weatherList.length,
          itemBuilder: (context, index) {
            final weather = weatherList[index];
            return ListTile(
              title: Text('City: ${weather.city}'),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Temperature: ${weather.temperature}°C'),
                  Text('Condition: ${weather.condition}'),
                  Text('Humidity: ${weather.humidity}%'),
                  Text('Wind Speed: ${weather.windSpeed} m/s'),
                  const Divider(height: 16,),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

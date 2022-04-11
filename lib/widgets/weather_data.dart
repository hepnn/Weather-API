import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'card_weather_data.dart';

class WeatherData extends StatelessWidget {
  final Map<dynamic, dynamic> data;
  WeatherData(this.data);

  var date = DateFormat('EEE, d MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
      child: Column(
        children: [
          Text(
            'Today : $date',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data['hourly'].length,
              itemBuilder: (context, index) {
                return CardWeatherData(
                  icon: data['hourly'][index]['weather'][0]['icon'],
                  date: data['hourly'][index]['dt'],
                  temp: data['hourly'][index]['temp'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  String condition;
  dynamic temp;
  double windSpeed;
  int humidity;

  WeatherInfo({
    required this.condition,
    required this.humidity,
    required this.temp,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    Color secondaryColor = Theme.of(context).colorScheme.secondary;
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          condition,
          style: TextStyle(
            color: secondaryColor,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          '${temp.toInt()}°',
          style: TextStyle(
            color: secondaryColor,
            fontSize: size.height * 0.18,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.wind,
              color: secondaryColor,
              size: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              // convert wind speed from m/sec to km/h
              '${(windSpeed * 3.6).toInt()} km/h',
              style: TextStyle(
                fontSize: 17,
                color: secondaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              CupertinoIcons.drop,
              size: 25,
              color: secondaryColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '${humidity.toInt()}%',
              style: TextStyle(
                fontSize: 17,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

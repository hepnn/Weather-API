import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_icons/weather_icons.dart';
import 'package:geolocator/geolocator.dart';
import '../const.dart';

class Weather extends ChangeNotifier {
  late Position myPosition;
  bool isLodaing = false;

  Future<Position> getDeviceLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            return Future.error('Location permission are denied');
          }
        }

        if (permission == LocationPermission.deniedForever) {
          return Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      myPosition = position;
      return position;
    } catch (err) {
      rethrow;
    }
  }

  Future<Map<dynamic, dynamic>> getWeatherData() async {
    Position currentPosition = await getDeviceLocation();

    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${currentPosition.latitude}&lon=${currentPosition.longitude}&exclude=minutely&units=metric&appid=$API_KEY');

    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    return data;
  }

  IconData getTheCorrectIcon(String icon) {
    if (icon == '11d') {
      return WeatherIcons.thunderstorm;
    } else if (icon == '09d') {
      return WeatherIcons.rain_mix;
    } else if (icon == '10d') {
      return WeatherIcons.day_rain;
    } else if (icon == '13d') {
      return WeatherIcons.snow;
    } else if (icon == '09d') {
      return WeatherIcons.rain;
    } else if (icon == '50d') {
      return WeatherIcons.fog;
    } else if (icon == '01d') {
      return WeatherIcons.day_sunny;
    } else if (icon == '01n') {
      return WeatherIcons.night_clear;
    } else if (icon == '02d') {
      return WeatherIcons.day_cloudy;
    } else if (icon == '02n') {
      return WeatherIcons.night_cloudy;
    } else if (icon == '03d') {
      return WeatherIcons.cloudy;
    } else if (icon == '03n') {
      return WeatherIcons.cloudy;
    } else if (icon == '04d') {
      return WeatherIcons.cloudy;
    } else {
      return WeatherIcons.cloudy;
    }
  }

  Color getTheCorrectIconColor(String icon) {
    if (icon == '11d') {
      return Colors.blueAccent;
    } else if (icon == '09d') {
      return Colors.blueAccent;
    } else if (icon == '10d') {
      return Colors.white;
    } else if (icon == '13d') {
      return Colors.blueAccent;
    } else if (icon == '09d') {
      return Colors.blueAccent;
    } else if (icon == '50d') {
      return Colors.white;
    } else if (icon == '01d') {
      return Colors.orange;
    } else if (icon == '01n') {
      return Colors.orange;
    } else if (icon == '02d') {
      return Colors.white;
    } else if (icon == '02n') {
      return Colors.white;
    } else if (icon == '03d') {
      return Colors.white;
    } else if (icon == '03n') {
      return Colors.white;
    } else if (icon == '04d') {
      return Colors.white;
    } else {
      return Colors.white;
    }
  }

  String getTheCorrectWeatherSVG(String icon) {
    if (icon == '11d') {
      return '11d.svg';
    } else if (icon == '09d') {
      return '09d.svg';
    } else if (icon == '10d') {
      return '10d.svg';
    } else if (icon == '13d') {
      return '13d.svg';
    } else if (icon == '09d') {
      return '09d.svg';
    } else if (icon == '50d') {
      return '50d.svg';
    } else if (icon == '01d') {
      return '01d.svg';
    } else if (icon == '01n') {
      return '01n.svg';
    } else if (icon == '02d') {
      return '02d.svg';
    } else if (icon == '02n') {
      return '02n.svg';
    } else if (icon == '03d') {
      return '03d-03n.svg';
    } else if (icon == '03n') {
      return '03d-03n.svg';
    } else if (icon == '04d') {
      return '04d-04n.svg';
    } else {
      return '04d-04n.svg';
    }
  }
}

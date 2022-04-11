import 'package:flutter/material.dart';
import 'package:weatherui/models/info.dart';
import 'package:weatherui/widgets/next_week_weather_container.dart';
import 'package:weatherui/widgets/weather_data.dart';
import 'package:weatherui/widgets/weather_image.dart';
import 'package:weatherui/widgets/weather_info.dart';

class MainScreen extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  final bool isValid;
  final Info info;

  const MainScreen({
    required this.data,
    required this.info,
    required this.isValid,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String cityName() {
    try {
      String fullName = widget.data['timezone'];
      return fullName.split('/')[1];
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // // show on map ....
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => MapScreen(),
                        //   ),
                        // );
                      },
                      icon: Icon(
                        Icons.location_pin,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      cityName(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // IconButton(
                //   onPressed: () {
                //     // rebuild the app
                //     Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(
                //         builder: (context) => MainStack(),
                //       ),
                //     );
                //   },
                //   icon: Icon(
                //     Icons.redo,
                //     color: Theme.of(context).colorScheme.secondary,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              WeatherImage(widget.info.icon),
              WeatherInfo(
                condition: widget.info.situation,
                humidity: widget.info.humidity,
                temp: widget.info.temprature,
                windSpeed: widget.info.windSpeed,
              ),
              WeatherData(widget.data),
              Icon(Icons.arrow_downward),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Next Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.49,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return NextWeekWeatherContainer(
                            date: widget.data['daily'][index]['dt'],
                            iconId: widget.data['daily'][index]['weather'][0]
                                ['icon'],
                            maxTemp: widget.data['daily'][index]['temp']['max'],
                            minTemp: widget.data['daily'][index]['temp']['min'],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

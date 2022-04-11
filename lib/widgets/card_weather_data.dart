import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/weather.dart';

class CardWeatherData extends StatelessWidget {
  String icon;
  int date;
  dynamic temp;

  CardWeatherData({
    required this.icon,
    required this.date,
    required this.temp,
  });

  // convert date from Unix timestamp to human readble date
  String convertDate() {
    var newDate = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    var formattedDate = DateFormat('jm').format(newDate);
    return formattedDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    IconData iconData =
        Provider.of<Weather>(context, listen: false).getTheCorrectIcon(icon);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
      // height: 150,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            color: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 100,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: FittedBox(
                      child: Text(
                        convertDate(),
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    iconData,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    '${temp.toInt()} °',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Info {
  String icon;
  String situation;
  double temprature;
  double windSpeed;
  int humidity;

  Info({
    required this.humidity,
    required this.icon,
    required this.situation,
    required this.temprature,
    required this.windSpeed,
  });
}

class HourlyInfo {
  int date;
  int humidity;
  double temp;

  HourlyInfo({
    required this.date,
    required this.humidity,
    required this.temp,
  });
}

class WeatherModel {
  String? timezone;
  List<Days>? days;

  WeatherModel({
    this.timezone,
    this.days,
  });
  WeatherModel.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(Days.fromJson(v));
      });
    }
  }
}

class Days {
  String? datetime;
  double? temp;
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;

  Days(
      {this.datetime,
      this.temp,
      this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset});

  Days.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    temp = json['temp'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
  }
}

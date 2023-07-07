class ForecastModel {
  double latitude;
  double longitude;
  Current? current;
  List<Hourly>? hourly;

  ForecastModel({
    required this.latitude,
    required this.longitude,
    this.current,
    this.hourly,
  });
}

class Current {
  int? timestamp;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;

  Current(
      {this.timestamp,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather});
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});
}

class Hourly {
  int? dt;
  double? temp;
  List<Weather>? weather;

  Hourly({
    this.dt,
    this.temp,
    this.weather,
  });
}

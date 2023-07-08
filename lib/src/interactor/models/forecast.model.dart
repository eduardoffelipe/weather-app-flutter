import 'dart:developer';

class ForecastModel {
  late double latitude;
  late double longitude;
  Current? current;
  List<Hourly>? hourly;

  ForecastModel({
    required this.latitude,
    required this.longitude,
    this.current,
    // this.hourly,
  });

  ForecastModel.fromJson(Map<String, dynamic> json) {
    log('ForecastModel.fromJson: $json');
    latitude = json['lat'];
    log('ForecastModel.latitude: $latitude');
    longitude = json['lon'];
    log('ForecastModel.longitude: $longitude');
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    log('ForecastModel.current: $current');
    // if (json['hourly'] != null) {
    //   hourly = <Hourly>[];
    //   json['hourly'].forEach((v) {
    //     hourly!.add(Hourly.fromJson(v));
    //   });
    //   log('ForecastModel.hourly: $hourly');
    // }
  }
}

class Current {
  int? timestamp;
  double? temperature;
  double? feelsLike;
  int? pressure;
  int? humidity;
  int? visibility;
  double? windSpeed;
  List<Weather>? weather;

  Current(
      {this.timestamp,
      this.temperature,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.visibility,
      this.windSpeed,
      this.weather});

  Current.fromJson(Map<String, dynamic> json) {
    timestamp = json['dt'];
    log('Current.timestamp: $timestamp');
    temperature = json['temp'];
    log('Current.temperature: $temperature');
    feelsLike = json['feels_like'];
    log('Current.feelsLike: $feelsLike');
    pressure = json['pressure'];
    log('Current.pressure: $pressure');
    humidity = json['humidity'];
    log('Current.humidity: $humidity');
    visibility = json['visibility'];
    log('Current.visibility: $visibility');
    windSpeed = json['wind_speed'];
    log('Current.windSpeed: $windSpeed');
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
      log('Current.weather: $weather');
    }
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Hourly {
  int? timestamp;
  double? temperature;
  List<Weather>? weather;

  Hourly({
    this.timestamp,
    this.temperature,
    this.weather,
  });

  // Hourly.fromJson(Map<String, dynamic> json) {
  //   timestamp = json['dt'];
  //   log('Hourly.timestamp: $timestamp');
  //   temperature = json['temp'];
  //   log('Hourly.temperature: $temperature');
  //   if (json['weather'] != null) {
  //     weather = <Weather>[];
  //     json['weather'].forEach((v) {
  //       weather!.add(Weather.fromJson(v));
  //     });
  //     log('Hourly.weather: $weather');
  //   }
  // }
}

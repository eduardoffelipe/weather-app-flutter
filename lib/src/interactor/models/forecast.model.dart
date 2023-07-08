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
    latitude = json['lat'];
    longitude = json['lon'];
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
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
    temperature = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
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
  //   temperature = json['temp'];
  //   if (json['weather'] != null) {
  //     weather = <Weather>[];
  //     json['weather'].forEach((v) {
  //       weather!.add(Weather.fromJson(v));
  //     });
  //     log('Hourly.weather: $weather');
  //   }
  // }
}

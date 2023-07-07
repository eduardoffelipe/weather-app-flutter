// ignore_for_file: unused_local_variable

import 'package:dson_adapter/dson_adapter.dart';
import 'package:weather_app/src/interactor/models/forecast.model.dart';

class ForecastAdapter {
  ForecastAdapter._();

  static ForecastModel fromMap(dynamic map) {
    const dson = DSON();
    return dson.fromJson<ForecastModel>(map, ForecastModel.new, inner: {
      'current': Current,
      'hourly': ListParam<Hourly>(Hourly.new),
    }, aliases: {
      ForecastModel: {
        'latitude': 'lat',
        'longitude': 'lon',
      },
      Current: {
        'timestamp': 'dt',
        'temperature': 'temp',
      },
      Hourly: {
        'dt': 'timestamp',
        'temperature': 'temp',
      },
    });
  }
}

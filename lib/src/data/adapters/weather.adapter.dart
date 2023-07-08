import 'package:weather_app/src/interactor/models/forecast.model.dart';

class ForecastAdapter {
  ForecastAdapter._();

  static ForecastModel fromMap(dynamic map) {
    return ForecastModel.fromJson(map);
  }
}

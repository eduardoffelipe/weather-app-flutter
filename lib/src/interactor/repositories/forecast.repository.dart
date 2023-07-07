import 'package:weather_app/src/interactor/states/forecast.state.dart';

abstract interface class ForecastRepository {
  Future<ForecastState> fetchForecast(ForecastState state);
}

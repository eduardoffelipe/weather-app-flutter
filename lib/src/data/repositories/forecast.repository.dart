import 'package:dio/dio.dart';
import 'package:dson_adapter/dson_adapter.dart';
import 'package:weather_app/src/data/adapters/weather.adapter.dart';
import 'package:weather_app/src/interactor/exceptions/forecast.exception.dart';
import 'package:weather_app/src/interactor/repositories/forecast.repository.dart';
import 'package:weather_app/src/interactor/states/forecast.state.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final Dio dio;

  ForecastRepositoryImpl(this.dio);

  @override
  Future<ForecastState> fetchForecast(ForecastState state) async {
    try {
      final response = await dio.get(
        'https://api.openweathermap.org/data/3.0/onecall?lat=-20.758317&lon=-41.538827&appid=7a586104fccab4ca2c45796e1c4fe61f',
      );
      final list = response.data;
      final forecast = ForecastAdapter.fromMap(list);
      return state.setForecast(forecast);
    } on DioException catch (e, s) {
      return state.setError(ForecastRepositoryException(e.message, s));
    } on DSONException catch (e, s) {
      return state.setError(ForecastRepositoryException(e.message, s));
    }
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dson_adapter/dson_adapter.dart';
import 'package:weather_app/src/data/adapters/weather.adapter.dart';
import 'package:weather_app/src/interactor/exceptions/forecast.exception.dart';
import 'package:weather_app/src/interactor/repositories/forecast.repository.dart';
import 'package:weather_app/src/interactor/states/forecast.state.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final Dio dio;

  ForecastRepositoryImpl(this.dio);

  @override
  Future<ForecastState> fetchForecast(ForecastState state) async {
    try {
      final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/onecall?lat=-20.758317&units=metric&lon=-41.538827&appid=${dotenv.env['OPEN_WEATHER_KEY']}',
      );
      final list = response.data;
      log('list: $list');
      final forecast = ForecastAdapter.fromMap(list);
      log('forecast: $forecast');
      return state.setForecast(forecast);
    } on DioException catch (e, s) {
      return state.setError(ForecastRepositoryException(e.message, s));
    } on DSONException catch (e, s) {
      return state.setError(ForecastRepositoryException(e.message, s));
    }
  }
}

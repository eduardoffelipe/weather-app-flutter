import 'package:weather_app/src/interactor/exceptions/forecast.exception.dart';

import '../models/forecast.model.dart';

sealed class ForecastState {
  final ForecastModel? forecast;
  final bool loading;
  final ForecastException? exception;

  const ForecastState({
    this.forecast,
    this.loading = false,
    this.exception,
  });

  factory ForecastState.start() => const StartForecastState();

  ForecastState setForecast(
    ForecastModel forecast,
  ) {
    return GettedForecastState(
      forecast: forecast,
    );
  }

  ForecastState setLoading() {
    return LoadingForecastState(forecast: forecast);
  }

  ForecastState setError(ForecastException exception) {
    return ErrorForecastState(
      exception: exception,
      forecast: forecast,
    );
  }
}

class StartForecastState extends ForecastState {
  const StartForecastState()
      : super(
          forecast: null,
        );
}

class GettedForecastState extends ForecastState {
  const GettedForecastState({
    super.forecast,
  });
}

class LoadingForecastState extends ForecastState {
  const LoadingForecastState({
    super.forecast,
  }) : super(loading: true);
}

class ErrorForecastState extends ForecastState {
  const ErrorForecastState({
    required super.exception,
    super.forecast,
  }) : super(loading: false);
}

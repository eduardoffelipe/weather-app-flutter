import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/interactor/states/forecast.state.dart';
import '../repositories/forecast.repository.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final ForecastRepository repository;

  ForecastCubit(this.repository) : super(ForecastState.start());

  void fetchForecastEvent() async {
    emit(state.setLoading());

    await repository
        .fetchForecast(state) //
        .then(emit);
  }

  void dispose() {
    close();
  }
}

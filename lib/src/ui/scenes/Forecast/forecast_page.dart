import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/src/interactor/cubit/forecast.cubit.dart';
import 'package:weather_app/src/ui/scenes/Forecast/widgets/details.forecast.dart';
import 'package:weather_app/src/ui/scenes/Forecast/widgets/temperature_current.forecast.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScaffoldState get scaffoldState => scaffoldKey.currentState!;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ForecastCubit>();
    cubit.fetchForecastEvent();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF622FB5);
    const background = Color(0xFF1B0F36);
    const moon = 'lib/assets/svgs/moon.svg';

    final cubit = context.watch<ForecastCubit>();
    final state = cubit.state;

    return Scaffold(
        key: scaffoldKey,
        body: Container(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 40),
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primary,
                  background,
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TemperatureCurrent(
                      temperature: state.forecast?.current?.temperature
                              ?.toStringAsFixed(0) ??
                          '0',
                      city: 'Alegre',
                      isLoading: state.loading,
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          moon,
                          semanticsLabel: 'A yellow  moon',
                          alignment: Alignment.center,
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.forecast?.current?.weather?.first.description ??
                              '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 48),
                DetailsForecast(
                  pressure:
                      state.forecast?.current?.pressure?.toString() ?? '0',
                  humidity:
                      state.forecast?.current?.humidity?.toString() ?? '0',
                  windSpeed:
                      state.forecast?.current?.windSpeed?.toString() ?? '0',
                  feelsLike:
                      state.forecast?.current?.feelsLike?.toStringAsFixed(0) ??
                          '0',
                  preciptation: '0',
                  visibility:
                      (state.forecast?.current?.visibility)?.toString() ?? '0',
                ),
              ],
            )));
  }
}

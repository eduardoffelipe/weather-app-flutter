import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/app_widget.dart';

import 'package:weather_app/src/data/repositories/forecast.repository.dart';
import 'package:weather_app/src/interactor/cubit/forecast.cubit.dart';
import 'package:weather_app/src/interactor/repositories/forecast.repository.dart';

Future main() async {
  await initializeDateFormatting('en_US', null);
  await dotenv.load(fileName: ".env");
  final app = MultiProvider(
    providers: [
      Provider.value(value: Dio()),
      Provider<ForecastRepository>(
        create: (ctx) => ForecastRepositoryImpl(ctx.read<Dio>()),
      ),
      BlocProvider(create: (ctx) => ForecastCubit(ctx.read())),
    ],
    child: const MainApp(),
  );
  runApp(app);
}

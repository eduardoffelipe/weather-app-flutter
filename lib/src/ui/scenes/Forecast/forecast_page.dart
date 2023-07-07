import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/interactor/cubit/forecast.cubit.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  _ForecastPageState createState() => _ForecastPageState();
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

    return Scaffold(
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
            child: const Column(
              children: [],
            )));
  }
}

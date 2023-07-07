import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/src/ui/scenes/Forecast/forecast_page.dart';
import 'package:weather_app/src/ui/scenes/Home/widgets/title.home.dart';
import 'package:weather_app/src/ui/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  navigateForecast(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ForecastPage()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Add primary and background colors
    const primary = Color(0xFF622FB5);
    const background = Color(0xFF1B0F36);

    const entry = 'lib/assets/svgs/entry.svg';

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 40),
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
            child: Column(children: [
              SvgPicture.asset(
                entry,
                semanticsLabel: 'A sun through the clouds',
                alignment: Alignment.center,
                height: 445,
                width: 321,
              ),
              const SizedBox(height: 48),
              const TitleHome(),
              const SizedBox(height: 48),
              Button(
                label: 'Get Started',
                action: () => navigateForecast(context),
              ),
            ])));
  }
}

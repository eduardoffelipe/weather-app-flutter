import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/src/ui/scenes/Forecast/widgets/temperature_current.forecast.dart';

class HeaderForecast extends StatelessWidget {
  final String temperature;
  final String city;
  final bool isLoading;
  final String weatherDescription;
  final String icon;

  const HeaderForecast({
    Key? key,
    required this.temperature,
    required this.city,
    required this.isLoading,
    required this.weatherDescription,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TemperatureCurrent(
          temperature: temperature,
          city: city,
          isLoading: isLoading,
        ),
        Column(
          children: [
            SvgPicture.asset(
              icon,
              semanticsLabel: 'A $weatherDescription icon',
              alignment: Alignment.center,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 8),
            Text(
              weatherDescription,
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
    );
  }
}

import 'package:flutter/material.dart';

class DetailsForecast extends StatelessWidget {
  final String pressure;
  final String humidity;
  final String windSpeed;
  final String feelsLike;
  final String preciptation;
  final String visibility;

  const DetailsForecast(
      {Key? key,
      required this.pressure,
      required this.humidity,
      required this.windSpeed,
      required this.feelsLike,
      required this.preciptation,
      required this.visibility})
      : super(key: key);

  Widget _buildColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF9F7ADD),
            fontSize: 14,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final parsedVisibilite =
        (double.parse(visibility) / 1000).toStringAsFixed(0);

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              _buildColumn('Pressure', '$pressure hPa'),
              _buildColumn('Precipitation', '$preciptation mm'),
              _buildColumn('Humidity', '$humidity %'),
            ]),
            const SizedBox(height: 36),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              _buildColumn('Wind', '$windSpeed km/h'),
              _buildColumn('Feels Like', '$feelsLike °C'),
              _buildColumn('Visibility', '$parsedVisibilite km'),
            ])
          ],
        ));
  }
}

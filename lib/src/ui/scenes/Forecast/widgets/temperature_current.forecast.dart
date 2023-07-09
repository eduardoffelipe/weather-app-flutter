import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TemperatureCurrent extends StatelessWidget {
  final String temperature;
  final String city;
  final bool isLoading;

  const TemperatureCurrent(
      {Key? key,
      required this.temperature,
      required this.city,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        '$temperature °C',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 60,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
      const SizedBox(height: 4),
      Text(
        city,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
      const SizedBox(height: 8),
      Text(
        toBeginningOfSentenceCase(DateFormat.yMMMMd().format(DateTime.now())) ??
            '',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
      )
    ]);
  }
}

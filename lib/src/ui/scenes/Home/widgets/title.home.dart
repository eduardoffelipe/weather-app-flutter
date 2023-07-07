import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  const TitleHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weather App',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Check Live weather updates all over the world with just one tap',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

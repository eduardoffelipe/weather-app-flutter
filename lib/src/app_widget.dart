import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/src/ui/scenes/Home/home_page.dart';
import 'package:weather_app/src/ui/theme/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          brightness: Brightness.dark,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      home: const HomePage(),
    );
  }
}

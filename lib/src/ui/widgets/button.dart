import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function action;

  const Button({Key? key, required this.label, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO change to get Theme
    const primary = Color(0xFF733FC5);

    return ElevatedButton(
      onPressed: () => action(),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
      ),
      child: Text(
          textAlign: TextAlign.start,
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
    );
  }
}

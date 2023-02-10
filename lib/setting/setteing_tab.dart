import 'package:flutter/material.dart';

class SettingTab extends StatelessWidget {
  static const String routName = 'setting';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/images/pattern.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

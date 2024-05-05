import 'package:flutter/material.dart';

import '/views/gradient_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientContainer(
      children: [
        Spacer(),
        Text(
          'Settings',
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        Spacer(),
      ],
    );
  }
}

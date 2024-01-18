import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: 160,
          height: 100,
        ),
      ),
    );
  }
}

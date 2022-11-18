import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String id = "splash_screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 136,
            height: 138,
            child: Image(
              image: AssetImage("assets/images/label_food_light_logo.png"),
            ),
          ),
        ),
      ),
    );
  }
}

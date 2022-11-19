import 'package:flutter/material.dart';
// import 'package:label_food/screens/annotation/annotation_screen.dart';
import 'package:label_food/screens/welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "splash_screen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.popAndPushNamed(context, WelcomeScreen.id);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const AnnotationScreen(),
      //   ),
      // );
    });
  }

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

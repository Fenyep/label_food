import 'package:flutter/material.dart';
import 'package:label_food/screens/splash/splash_screen.dart';
import 'package:label_food/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const LabelFood());
}

class LabelFood extends StatefulWidget {
  const LabelFood({super.key});

  @override
  State<LabelFood> createState() => _LabelFoodState();
}

class _LabelFoodState extends State<LabelFood> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LABELFOOD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
      },
    );
  }
}

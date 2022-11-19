import 'package:flutter/material.dart';
import 'package:label_food/screens/home/home_screen.dart';
import 'package:label_food/screens/splash/splash_screen.dart';
import 'package:label_food/screens/welcome/welcome_screen.dart';
import 'package:label_food/theme/theme_constants.dart';
import 'package:label_food/theme/theme_manager.dart';

// List<CameraDescription> cameras = [];
Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras`
  // can be called before `LabelFood()`
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LabelFood());
}

ThemeManager _themeManager = ThemeManager.getInstance();

class LabelFood extends StatefulWidget {
  const LabelFood({
    super.key,
  });

  @override
  State<LabelFood> createState() => _LabelFoodState();
}

class _LabelFoodState extends State<LabelFood> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _themeManager.addListener(themeListener);
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LABELFOOD',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}

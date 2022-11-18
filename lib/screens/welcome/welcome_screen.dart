import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:label_food/screens/home/home_screen.dart';
import 'package:label_food/utils/utils.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late TapGestureRecognizer _gestureRecognizer;
  @override
  void initState() {
    super.initState();
    _gestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        debugPrint("Go to this page");
        toggleAccepted();
      };
  }

  bool acceptedTerms = false;

  void toggleAccepted() {
    setState(() {
      acceptedTerms = !acceptedTerms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              addVerticalSpace(47.0),
              const Image(
                image:
                    AssetImage("assets/images/welcome_illustration_light.png"),
              ),
              addVerticalSpace(47.0),
              SizedBox(
                width: 336.0,
                height: 87.0,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Annotate",
                    style: TextStyle(
                      color: COLOR_BLACK,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: " Food Images",
                        style: TextStyle(
                          color: COLOR_PRIMARY,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: ", get recommended about meals.",
                        style: TextStyle(
                          color: COLOR_BLACK,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              addVerticalSpace(40),
              RichText(
                text: TextSpan(
                  text: "I accept the, ",
                  style: const TextStyle(
                    color: COLOR_BLACK,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: "conditions and agreement terms.",
                      style: const TextStyle(
                        color: COLOR_LIGHT_BLUE,
                        fontSize: 16.0,
                      ),
                      recognizer: _gestureRecognizer,
                    ),
                  ],
                ),
              ),
              addVerticalSpace(26),
              ElevatedButton(
                onPressed: acceptedTerms
                    ? () {
                        Navigator.popAndPushNamed(context, HomeScreen.id);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: COLOR_PRIMARY,
                    disabledBackgroundColor: COLOR_GREY,
                    minimumSize: const Size(364.0, 50),
                    maximumSize: const Size(364.0, 50),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    color: COLOR_WHITE,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

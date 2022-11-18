import 'package:flutter/material.dart';
import 'package:label_food/screens/home/components/annotation_box.dart';
import 'package:label_food/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String annotationStatus = "all done";

  void updateAnnotationStatus(String value) {
    setState(() {
      annotationStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              Container(
                height: screenSize.height / 3,
                width: screenSize.width,
                decoration: const BoxDecoration(
                  color: COLOR_PRIMARY,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "Bienvenue "),
                                TextSpan(
                                    text: "Mr. Wangue",
                                    style: TextStyle(
                                      color: COLOR_WHITE,
                                    )),
                              ],
                            ),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.settings,
                              size: 25.0,
                              color: COLOR_BLACK,
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpace(25),
                      const Text(
                        "Get an eye on your activities",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: COLOR_WHITE,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      addVerticalSpace(29),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                updateAnnotationStatus("all done");
                              },
                              child: Text(
                                "All done",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: annotationStatus == "all done"
                                      ? COLOR_WHITE
                                      : COLOR_WHITE.withOpacity(0.5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateAnnotationStatus("recently");
                              },
                              child: Text(
                                "Recently",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: annotationStatus == "recently"
                                      ? COLOR_WHITE
                                      : COLOR_WHITE.withOpacity(0.5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateAnnotationStatus("deleted");
                              },
                              child: Text(
                                "Deleted",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: annotationStatus == "deleted"
                                      ? COLOR_WHITE
                                      : COLOR_WHITE.withOpacity(0.5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: screenSize.width,
                  height: screenSize.height / 1.3,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      const AnnotationBox(),
                      addVerticalSpace(18),
                      const AnnotationBox(),
                      addVerticalSpace(18),
                      const AnnotationBox(),
                      addVerticalSpace(18),
                      const AnnotationBox(),
                      addVerticalSpace(18),
                      const AnnotationBox(),
                      addVerticalSpace(18),
                      const AnnotationBox(),
                      addVerticalSpace(18),
                      const AnnotationBox(),
                      addVerticalSpace(18),
                      const AnnotationBox(),
                      addVerticalSpace(18),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

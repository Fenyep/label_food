import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:label_food/screens/camera/camera_screen.dart';
import 'package:label_food/screens/home/components/annotation_box.dart';
import 'package:label_food/theme/theme_manager.dart';
import 'package:label_food/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  final List<String>? items;
  const HomeScreen({super.key, this.items});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String annotationStatus = "all done";
  bool isDark = false;
  final ThemeManager _themeManager = ThemeManager.getInstance();

  void updateAnnotationStatus(String value) {
    setState(() {
      annotationStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // obtain a list  of the avallable cameras on the device
          await availableCameras()
              .then(
            (value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CameraScreen(cameras: value),
              ),
            ),
          )
              .catchError((e) {
            print(e);
          });
        },
        child: const Icon(
          Icons.camera_alt,
        ),
      ),
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
                            onTap: () {
                              setState(() {
                                isDark = !isDark;
                              });
                              _themeManager.toggleTheme(isDark);
                            },
                            child: Icon(
                              _themeManager.themeMode == ThemeMode.light
                                  ? Icons.light_mode
                                  : Icons.dark_mode,
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
                  child: ListView.builder(
                    // Add a key to the ListView. This makes it possible to
                    // find the list and scroll through it in the tests.
                    key: const Key('long_list'),
                    itemCount: widget.items!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Column(
                          children: [
                            Text(
                              widget.items![index],
                              // Add a key to the Text widget for each item. This makes
                              // it possible to look for a particular item in the list
                              // and verify that the text is correct
                              key: Key('item_${index}_text'),
                            ),
                            const AnnotationBox(),
                            addVerticalSpace(18),
                          ],
                        ),
                      );
                    },
                  ),
                  // SingleChildScrollView(
                  //     child: Column(
                  //   children: [
                  //     const AnnotationBox(),
                  //     addVerticalSpace(18),
                  //     const AnnotationBox(),
                  //     addVerticalSpace(18),
                  //     const AnnotationBox(),
                  //     addVerticalSpace(18),
                  //     const AnnotationBox(),
                  //     addVerticalSpace(18),
                  //     const AnnotationBox(),
                  //     addVerticalSpace(18),
                  //     const AnnotationBox(),
                  //     addVerticalSpace(18),
                  //     const AnnotationBox(),
                  //     addVerticalSpace(18),
                  //     const AnnotationBox(),
                  //     addVerticalSpace(18),
                  //   ],
                  // )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

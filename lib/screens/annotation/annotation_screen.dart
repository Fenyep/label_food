// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:label_food/utils/utils.dart';

// class AnnotationScreen extends StatefulWidget {
//   const AnnotationScreen({super.key});

//   @override
//   State<AnnotationScreen> createState() => _AnnotationScreenState();
// }

// class DrawingArea {
//   Offset point;
//   Paint areaPaint;

//   DrawingArea({required this.point, required this.areaPaint});
// }

// class _AnnotationScreenState extends State<AnnotationScreen> {
//   List<DrawingArea> points = [];
//   late Color selectedColor;
//   late double strokeWidth;

//   @override
//   void initState() {
//     super.initState();
//     selectedColor = Colors.black;
//     strokeWidth = 2.0;
//   }

//   void selectColor() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Color chooser'),
//         content: SingleChildScrollView(
//           child: BlockPicker(
//             pickerColor: selectedColor,
//             onColorChanged: (color) {
//               setState(
//                 () {
//                   selectedColor = color;
//                 },
//               );
//             },
//           ),
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Close'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color.fromRGBO(138, 35, 135, 1.0),
//                   Color.fromRGBO(233, 64, 87, 1.0),
//                   Color.fromRGBO(242, 113, 33, 1.0),
//                 ],
//               ),
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: screenWidth * 0.80,
//                   height: screenHeight * 0.80,
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(20.0),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: COLOR_BLACK.withOpacity(0.4),
//                         blurRadius: 5.0,
//                         spreadRadius: 1.0,
//                       ),
//                     ],
//                   ),
//                   child: GestureDetector(
//                     onPanDown: (details) {
//                       setState(() {
//                         points.add(DrawingArea(
//                           point: details.localPosition,
//                           areaPaint: Paint()
//                             ..strokeCap = StrokeCap.round
//                             ..isAntiAlias = true
//                             ..color = selectedColor
//                             ..strokeWidth = strokeWidth,
//                         ));
//                       });
//                     },
//                     onPanUpdate: (details) {
//                       setState(() {
//                         points.add(DrawingArea(
//                           point: details.localPosition,
//                           areaPaint: Paint()
//                             ..strokeCap = StrokeCap.round
//                             ..isAntiAlias = true
//                             ..color = selectedColor
//                             ..strokeWidth = strokeWidth,
//                         ));
//                       });
//                     },
//                     onPanEnd: (details) {
//                       setState(() {
//                         // save this.
//                         points.add(null);
//                       });
//                     },
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20.0),
//                       child: CustomPaint(
//                         painter: MyCustomPainter(points: points),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10.0,
//                 ),
//                 Container(
//                   width: screenWidth * 0.80,
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20.0),
//                     ),
//                     color: COLOR_WHITE,
//                   ),
//                   child: Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           selectColor();
//                         },
//                         icon: Icon(
//                           Icons.color_lens,
//                           color: selectedColor,
//                         ),
//                       ),
//                       Expanded(
//                         child: Slider(
//                             min: 1.0,
//                             max: 7.0,
//                             activeColor: selectedColor,
//                             value: strokeWidth,
//                             onChanged: (value) {
//                               setState(() {
//                                 strokeWidth = value;
//                               });
//                             }),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             points.clear();
//                           });
//                         },
//                         icon: const Icon(
//                           Icons.layers_clear,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyCustomPainter extends CustomPainter {
//   List<DrawingArea> points;

//   MyCustomPainter({required this.points});

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint background = Paint()..color = Colors.white;
//     Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
//     canvas.drawRect(rect, background);

//     for (int x = 0; x < points.length - 1; x++) {
//       if (points[x] != null && points[x + 1] != null) {
//         Paint paint = points[x].areaPaint;
//         canvas.drawLine(points[x].point, points[x + 1].point, paint);
//       } else if (points[x] != null && points[x + 1] == null) {
//         Paint paint = points[x].areaPaint;
//         canvas.drawPoints(PointMode.points, [points[x].point], paint);
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

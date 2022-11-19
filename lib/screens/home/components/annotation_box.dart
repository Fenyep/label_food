import 'package:flutter/material.dart';
import 'package:label_food/screens/counter/counter_screen.dart';
import 'package:label_food/utils/utils.dart';

class AnnotationBox extends StatelessWidget {
  const AnnotationBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 148,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: const BorderRadius.all(
          Radius.circular(46.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 112,
              height: 119,
              decoration: const BoxDecoration(
                color: COLOR_GREY,
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterScreen(),
                  ),
                );
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: COLOR_PRIMARY,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: COLOR_WHITE,
                  size: 36,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

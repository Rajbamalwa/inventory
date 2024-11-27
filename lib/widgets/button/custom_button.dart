import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../custom/customtext.dart';

class Buttons extends StatelessWidget {
  Buttons({
    Key? key,
    required this.onPress,
    required this.text,
    required this.height,
    required this.width,
    required this.color,
    this.loading = false,
  }) : super(key: key);
  final bool loading;
  Function() onPress;
  String text;
  double height;
  double width;

  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPress,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                white,
                Colors.blueGrey.shade900,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: CustomText(
              text,
              white,
              14,
              FontWeight.w700,
              TextOverflow.clip,
              TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}

Widget customDisableButton(width, onTap, color, child) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(child: child),
      ),
    ),
  );
}

Widget customBorderButton(width, onTap, child) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: white,
            border: Border.all(
              width: 1,
              color: grey,
            )),
        child: Center(child: child),
      ),
    ),
  );
}

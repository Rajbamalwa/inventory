import 'package:flutter/material.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

import '../../constant/colors.dart';
import '../custom/customtext.dart';

class GradientButton extends StatelessWidget {
  double width;
  double height;
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color fontColor;
  Function() onTap;
  GradientButton({
    required this.width,
    required this.height,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.fontColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   width: width,
    //   height: height,
    //   child: DecoratedBox(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       gradient: LinearGradient(
    //         colors: [primaryColor, primaryColor.withOpacity(0.1)],
    //         begin: Alignment.topLeft,
    //         end: Alignment.bottomRight,
    //       ),
    //     ),
    //     child: ElevatedButton(
    //       onPressed: onTap,
    //       style: ButtonStyle(
    //           shadowColor: MaterialStateColor.resolveWith(
    //               (states) => Colors.transparent),
    //           backgroundColor: MaterialStateColor.resolveWith(
    //               (states) => Colors.transparent),
    //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //               RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(10),
    //                   side: BorderSide(color: Colors.transparent)))),
    //       child: CustomText(text, fontColor, fontSize, fontWeight,
    //           TextOverflow.ellipsis, TextAlign.center),
    //     ),
    //   ),
    // );
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(30),
        child: NeoPopButton(
          color: primaryColor2,
          bottomShadowColor:
              ColorUtils.getVerticalShadow(primaryColor2.withOpacity(0.4))
                  .toColor(),
          rightShadowColor:
              ColorUtils.getHorizontalShadow(primaryColor2.withOpacity(0.4))
                  .toColor(),
          animationDuration: Duration(milliseconds: 50),
          depth: 3,
          onTapUp: onTap,
          child: Center(
            // padding:
            //     const EdgeInsets.only(top: 10, right: 5, bottom: 10, left: 5),
            child: CustomText(text, fontColor, fontSize, fontWeight,
                TextOverflow.ellipsis, TextAlign.center),
          ),
        ),
      ),
    );
  }
}

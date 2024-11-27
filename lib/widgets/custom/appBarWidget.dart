import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import 'customtext.dart';

AppBar appBarWidget(text, backVisible, List<Widget>? actions, onPress, color,
    {centerTitle = true}) {
  return AppBar(
    automaticallyImplyLeading: backVisible,
    backgroundColor: white,
    elevation: 0,
    centerTitle: false,
    leading: backVisible == false
        ? null
        : LeadingIcon(
            color: color,
            onpress: onPress,
          ),
    title: CustomText(text, primaryColor, 22, FontWeight.w700,
        TextOverflow.ellipsis, TextAlign.center),
    actions: actions,
  );
}

class LeadingIcon extends StatelessWidget {
  final onpress;
  final color;
  const LeadingIcon({
    Key? key,
    required this.color,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.6,
      child: Container(
        width: 36,
        height: 36,
        decoration: ShapeDecoration(
          color: transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, color: primaryColor.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: IconButton(
            tooltip: "Back",
            onPressed: onpress,
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: primaryColor,
            )),
      ),
    );
  }
}

Widget backIcon(context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
      child: Center(
        child: Image.asset(
          "assets/images/back.png",
          scale: 1,
        ),
      ),
    ),
  );
}

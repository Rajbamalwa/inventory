import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../widgets/custom/customtext.dart';

Widget showLoading() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: primaryColor,
          strokeWidth: 3,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          "Loading ...",
          Colors.black45,
          14,
          FontWeight.w500,
          TextOverflow.fade,
          TextAlign.center,
        ),
      ],
    ),
  );
}

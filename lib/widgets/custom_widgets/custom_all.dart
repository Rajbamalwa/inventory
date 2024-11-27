import 'package:flutter/material.dart';
import 'package:inventory/util/extention/sized_box_extention.dart';

import '../../constant/colors.dart';
import '../custom/customtext.dart';

Row DWithTWidget(text) {
  return Row(children: [
    15.w,
    Expanded(
      child: Divider(
        color: grey.withOpacity(0.5),
        thickness: 1,
      ),
    ),
    15.w,
    CustomText(
        text, grey, 12, FontWeight.w400, TextOverflow.fade, TextAlign.center),
    15.w,
    Expanded(
      child: Divider(
        color: grey.withOpacity(0.5),
        thickness: 1,
      ),
    ),
    15.w,
  ]);
}

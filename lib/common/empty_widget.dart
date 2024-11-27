import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../widgets/custom/customtext.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText("No Data Found", grey, 12, FontWeight.w600,
          TextOverflow.clip, TextAlign.center),
    );
  }
}

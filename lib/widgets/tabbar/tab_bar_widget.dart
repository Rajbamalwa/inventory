import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class TabBarMenu extends StatelessWidget {
  const TabBarMenu({
    Key? key,
    required this.tabTitle,
    required this.onTap,
    required this.from,
    this.tabController,
  }) : super(key: key);
  final Function(int) onTap;
  final String from;
  final tabController;
  final List<String> tabTitle;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: primaryColor,
      controller: tabController,
      unselectedLabelColor: grey,
      padding: EdgeInsets.only(),
      labelStyle: TextStyle(
        color: primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        color: secondaryTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      indicatorColor: primaryColor,
      onTap: onTap,
      isScrollable: from == "bookings" ? false : false,
      indicator:
          // from == "bookings"
          //     ? null
          //     :
          BoxDecoration(
        // color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.symmetric(
          horizontal: BorderSide(
            color: primaryColor,
            width: 1,
          ),
          vertical: BorderSide.none,
        ),
      ),
      indicatorWeight: from == "bookings" ? 1 : 3,
      indicatorSize:
          // from == "bookings"
          //     ? TabBarIndicatorSize.label
          //     :
          TabBarIndicatorSize.tab,
      tabs: List.generate(
          tabTitle.length,
          (index) => Tab(
                text: tabTitle[index],
              )),
    );
  }
}

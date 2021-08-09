import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Today",
            svgSrc: 'assets/icons/calendar.svg',
            press: () {},
          ),
          BottomNavItem(
            title: "All Exercises",
            svgSrc: 'assets/icons/gym.svg',
            press: () {},
            isActive: true,
          ),
          BottomNavItem(
            title: "Settings",
            svgSrc: 'assets/icons/Settings.svg',
            press: () {},
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String title;
  final String svgSrc;
  final Function() press;
  final bool isActive;
  const BottomNavItem({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GestureDetector(
        onTap: press,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SvgPicture.asset(
              svgSrc,
              color: isActive ? kActiveIconColor : kTextColor,
            ),
            Text(
              title,
              style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
            ),
          ],
        ),
      ),
    );
  }
}

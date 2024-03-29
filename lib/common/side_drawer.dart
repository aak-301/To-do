import 'package:flutter/material.dart';
import 'package:todo/common/custom_circular_badge.dart';
import 'package:todo/common/side_drawer_elements.dart';
import 'package:todo/common/side_drawer_quarter_circle.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  void printTap() {
    print("Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: Stack(
          children: [
            const SideDrawerQuarterCircle(
                radius: 430, color: Color(0xffE2F6F2)),
            const SideDrawerQuarterCircle(
                radius: 350, color: Color(0xffCBF3EC)),
            const SideDrawerQuarterCircle(
                radius: 280, color: Color(0xffB7F0E6)),
            Row(
              children: [
                IconButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 90),
              child: CustomCircularBadge(
                profileImgUrl: "assets/images/profile.png",
                hasBadge: true,
                child: Image.asset(
                  "assets/images/badge.png",
                ),
              ),
            ),
            const Positioned(
              left: 30,
              top: 185,
              child: Text(
                "Shreyash 123",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 70,
              child: SizedBox(
                height: 320,
                width: 190,
                child: ListView(
                  children: [
                    SideDrawerElements(
                      sideDrawerText: "Profile",
                      onTap: printTap,
                    ),
                    SideDrawerElements(
                      sideDrawerText: "Coins",
                      onTap: printTap,
                    ),
                    SideDrawerElements(
                      sideDrawerText: "Meetings",
                      onTap: printTap,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

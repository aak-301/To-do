import 'package:flutter/material.dart';
import 'package:todo/common/custom_circular_badge.dart';
import 'package:todo/utils/side_drwaer_quarter_circle.dart';
import 'package:todo/wallet/profile/sideDrawer/side_drawer_elements.dart';
import 'package:todo/constant/routes_table.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

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
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    SideDrawerElements(
                      sideDrawerText: "Profile",
                      onTap: () =>
                          Navigator.of(context).pushNamed(RouteTable.profile),
                    ),
                    SideDrawerElements(
                      sideDrawerText: "Coins",
                      onTap: () =>
                          Navigator.of(context).pushNamed(RouteTable.coins),
                    ),
                    SideDrawerElements(
                      sideDrawerText: "Meetings",
                      onTap: () =>
                          Navigator.of(context).pushNamed(RouteTable.meetings),
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

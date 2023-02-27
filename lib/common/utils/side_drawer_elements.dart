import 'package:flutter/material.dart';

class SideDrawerElements extends StatelessWidget {
  const SideDrawerElements({
    required this.sideDrawerText,
    required this.onTap,
    super.key,
  });

  final String sideDrawerText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        children: [
          const Image(
            image: AssetImage("assets/images/cloud.png"),
            width: 170,
            height: 80,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(33, 10, 0, 0),
            child: ListTile(
              title: Text(
                sideDrawerText,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: (() => onTap()),
            ),
          ),
        ],
      ),
    );
  }
}

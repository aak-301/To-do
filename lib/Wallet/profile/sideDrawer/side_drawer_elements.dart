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
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(87, 175, 202, 231),
                  width: 1.5,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(33, 10, 0, 0),
            child: ListTile(
              title: Text(
                sideDrawerText,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              onTap: (() => onTap()),
            ),
          ),
        ],
      ),
    );
  }
}

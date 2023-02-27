import 'package:flutter/material.dart';

class CustomCircularBadge extends StatelessWidget {
  const CustomCircularBadge({
    this.hasBadge = false,
    this.hasStory = false,
    this.child,
    required this.profileImgUrl,
    super.key,
  });

  final bool hasBadge;
  final bool hasStory;
  final Widget? child;
  final String profileImgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(profileImgUrl)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(70),
        border: hasStory
            ? Border.all(color: Colors.black, width: 4)
            : Border.all(color: Colors.transparent, width: 0),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: hasBadge
                ? Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: child,
                    ))
                : Container(),
          )
        ],
      ),
    );
  }
}


// when adding add story icon:
// use this:

// Icon(
//                     Icons.add,
//                     size: 20,
//                   )
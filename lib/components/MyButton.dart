import 'package:flutter/material.dart';
import 'package:calculator/constant.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color colour;
  final Color fontColour;
  final VoidCallback onPress;
  const MyButton({Key? key,
    required this.title,
    required this.onPress,
    this.colour= greyColour,
    this.fontColour = whiteColour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colour
              ),
              child: Center(child: Text(title, style: TextStyle(fontSize: 75, color: fontColour , fontWeight: FontWeight.w300),)),
        ),
      ),
      ));
  }
}
import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Color(0XFFD9D9D9),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.green,
        child: Icon(Icons.check, size: 50, color: Colors.white),
      ),
    );
  }
}

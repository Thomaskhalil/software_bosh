// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SqaureTile extends StatelessWidget {
  final String imagePath;
  const SqaureTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white70,
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}

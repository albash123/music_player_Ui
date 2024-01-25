import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:music_player/others/app_colors.dart' as AppColors;
import 'package:flutter/cupertino.dart';
class AppTabs extends StatelessWidget {
  final Color? color;
  final String? text;

  const AppTabs({Key? key, this.color, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      child: Text(
        text ?? '',  // Added null-aware operator to handle null text
        style: TextStyle(color: Colors.white,fontSize: 20),
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 7,
            offset: const Offset(0, 0),
          )
        ],
      ),
    );
  }
}

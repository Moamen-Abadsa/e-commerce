import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

class AppText extends StatelessWidget {
  late final String text;
  late final Color color;
  late final FontWeight fontWeight;
  late final double fontSize;
  late final String fontFamily;

  AppText({
    required this.text,
    this.color = MyColors.black,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 14,
    this.fontFamily = "Poppins",
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.sp,
          fontFamily: fontFamily),
    );
  }
}

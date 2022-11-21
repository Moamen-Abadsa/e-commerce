import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

class AppChip extends StatelessWidget {
  late final void Function() onTap;
  late final String text;
  bool isClick;

  AppChip({
    required this.onTap,
    required this.text,
    this.isClick = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          "$text",
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: isClick ? Colors.white : MyColors.blue),
        ),
        backgroundColor: isClick ? MyColors.blue : Colors.white,
        elevation: isClick ? 5 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(9.5.r),
          ),
          side: BorderSide(
            width: 1.sp,
            color: Color(0xff586BCA).withOpacity(0.25),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../values/colors.dart';

class AppTextButton extends StatelessWidget {
  late final String text;
  late bool isHasBackgroundColor;
  final void Function() onPressed;

  AppTextButton({
    required this.text,
    this.isHasBackgroundColor = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: isHasBackgroundColor ? Colors.white : MyColors.blue,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins"),
      ),
      style: TextButton.styleFrom(
        backgroundColor: isHasBackgroundColor ? MyColors.blue : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        minimumSize: Size(double.infinity, 50.h),
        side: BorderSide(color: MyColors.blue,width: 1.w)
      ),
    );
  }
}

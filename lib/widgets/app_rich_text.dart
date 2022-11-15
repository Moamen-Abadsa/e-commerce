import 'package:e_commerce/values/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRichText extends StatelessWidget {
  late final String Text;
  late final TapGestureRecognizer recognizer;
  late final FontWeight fontWeight;

  AppRichText({
    required this.Text,
    required this.recognizer,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            recognizer: recognizer,
            text: "$Text",
            style: TextStyle(
              color: MyColors.blue,
              fontWeight: fontWeight,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

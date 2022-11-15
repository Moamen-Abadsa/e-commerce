import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

class AppTextField extends StatelessWidget {
  late final String text;
  late final Icon? prefIcon;
  late bool isChecked;
  late final void Function() onPressed;
  bool isVisibal;
  late TextInputType type;
  late final TextEditingController controller;
  late final int maxLength;
  late final String? errorText;
  late final bool error;

  AppTextField(
      {required this.text,
      required this.prefIcon,
      this.isChecked = true,
      required this.onPressed,
      this.isVisibal = false,
      this.type = TextInputType.emailAddress,
      required this.controller,
      this.maxLength = 50,
      this.error = false,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          errorText: error ? errorText : null,
          errorStyle: TextStyle(color: Colors.red),
          counterText: '',
          hintText: "$text",
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontFamily: "Poppins",
              fontSize: 12.sp,
              fontWeight: FontWeight.w500),
          prefixIcon: prefIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.blue),
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),

          suffixIcon: isChecked
              ? Visibility(
                  visible: isVisibal,
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                  ))
              : Visibility(
                  visible: isVisibal,
                  child: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                ),
        ));
  }
}

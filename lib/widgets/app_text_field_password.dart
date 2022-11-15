import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

class AppTextFieldPassword extends StatelessWidget {
  late final void Function() onPressed;
  bool obscureText;
  late final TextEditingController controller;
  late final String? errorText;
  late final bool error;

  AppTextFieldPassword(
      {required this.onPressed,
      this.obscureText = true,
      required this.controller,
      this.errorText,
      this.error = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorText: error ? errorText : null,
        errorStyle: TextStyle(color: Colors.red),
        hintText: "Password",
        hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.4),
            fontFamily: "Poppins",
            fontSize: 12.sp,
            fontWeight: FontWeight.w500),
        prefixIcon: Icon(Icons.lock),
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
        suffixIcon: obscureText
            ? IconButton(
                icon: Icon(Icons.visibility_off),
                onPressed: onPressed,
              )
            : IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.remove_red_eye),
              ),
      ),
    );
  }
}

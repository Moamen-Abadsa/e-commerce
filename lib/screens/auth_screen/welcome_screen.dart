import 'package:e_commerce/values//colors.dart';
import 'package:e_commerce/values/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce/values/images.dart';

import '../../widgets/app_text_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 110.h,
            ),
            Text(
              "Simply",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: MyColors.black),
            ),
            SizedBox(
              height: 13.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 85.w, right: 85.w),
              child: Text(
                "Select your photographer, then go to session!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  color: MyColors.blackWithOpacity,
                ),
              ),
            ),
            SizedBox(height: 79.h),
            Image.asset(
              Images.Illustration,
              height: 289.h,
              width: 241.w,
            ),
            SizedBox(
              height: 98.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w),
              child: Row(
                children: [
                  Expanded(
                      child: AppTextButton(
                    text: "Sign in",
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, Routes.signIn),
                  )),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: AppTextButton(
                      text: "Sign up",
                      isHasBackgroundColor: false,
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, Routes.signUp),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

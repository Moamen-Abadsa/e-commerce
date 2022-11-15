import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/widgets/app_text_button.dart';
import 'package:e_commerce/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 27.w),
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                "assets/vectors/back_arrow.svg",
              ),
              label: Text(
                "Back",
                style: TextStyle(color: MyColors.blue),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              width: 172.w,
              height: 73.h,
              child: Text(
                "Recover      your account",
                style: TextStyle(
                    color: MyColors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Poppins"),
              ),
            ),
            SizedBox(
              height: 189.h,
            ),
            AppTextField(
              controller: _controller,
              text: "Enter email or phone number ",
              prefIcon: null,
              onPressed: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextButton(text: "Next", onPressed: () {})
          ],
        ),
      ),
    );
  }
}

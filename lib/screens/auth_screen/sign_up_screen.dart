import 'package:e_commerce/controllers/fb_controller/auth_controller.dart';
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/values/routes.dart';
import 'package:e_commerce/widgets/app_rich_text.dart';
import 'package:e_commerce/widgets/app_text_button.dart';
import 'package:e_commerce/widgets/app_text_field_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce/values/images.dart';
import 'package:email_validator/email_validator.dart';
import '../../widgets/app_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure = true;

  bool _emailError = false;
  bool _passwordError = false;
  bool _phoneError = false;

  String? _emailErrorMessage = "";
  String? _passwordErrorMessage = "";
  String? _phoneErrorMessage = "";

  bool _isClick = false;

  late final TapGestureRecognizer _recognizer;

  late TextEditingController _emailController;
  late TextEditingController _passwordcontroller;
  late TextEditingController _phonecontroller;

  @override
  void initState() {
    super.initState();
    _recognizer = TapGestureRecognizer()..onTap = NavigateToSigninScreen;
    _emailController = TextEditingController();
    _passwordcontroller = TextEditingController();
    _phonecontroller = TextEditingController();
  }

  @override
  void dispose() {
    _recognizer.dispose();
    _emailController.dispose();
    _passwordcontroller.dispose();
    _phonecontroller.dispose();
    super.dispose();
  }

  void NavigateToSigninScreen() {
    Navigator.pushNamed(context, Routes.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80.5.h,
                ),
                Image.asset(Images.logo),
                SizedBox(
                  height: 100.5.h,
                ),
                AppTextField(
                  controller: _emailController,
                  text: "Email",
                  prefIcon: Icon(Icons.email),
                  onPressed: () {},
                  isVisibal: _isClick,
                  isChecked: _emailError ? false : true,
                  error: _emailError,
                  errorText: _emailErrorMessage,
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextField(
                  controller: _phonecontroller,
                  text: "Mobile Number",
                  prefIcon: Icon(Icons.phone_android),
                  onPressed: () {},
                  type: TextInputType.phone,
                  maxLength: 10,
                  isVisibal: _isClick,
                  errorText: _phoneErrorMessage,
                  error: _phoneError,
                  isChecked: _phoneError ? false : true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextFieldPassword(
                  errorText: _passwordErrorMessage,
                  error: _passwordError ?? false,
                  controller: _passwordcontroller,
                  onPressed: () {
                    setState(() {
                      this._isObscure = _isObscure ? false : true;
                    });
                  },
                  obscureText: _isObscure,
                ),
                SizedBox(
                  height: 40.h,
                ),
                AppTextButton(
                    text: "Create an account",
                    onPressed: () {
                      _isClick = true;

                      validateFields();
                      if (!_emailError && !_passwordError && !_phoneError) {
                        createUser();
                      }
                    }),
                SizedBox(
                  height: 127.h,
                ),
                AppRichText(
                  Text: "Already have account?",
                  recognizer: _recognizer,
                ),
                SizedBox(
                  height: 39.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void performSignUp(){
    validateFields();
    // createUser();
  }

  void validateFields(){
    validateEmail(_emailController.text);
    validatePassword(_passwordcontroller.text);
    validatePhone(_phonecontroller.text);
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _emailErrorMessage = "This field is required";
        _emailError = true;
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _emailErrorMessage = "Invalid Email Address";
        _emailError = true;
      });
    } else {
      setState(() {
        _emailErrorMessage = null;
        _emailError = false;
      });
    }
  }

  void validatePhone(String val) {
    if (val.isEmpty) {
      setState(() {
        _phoneErrorMessage = "Phone can not be empty";
        _phoneError = true;
      });
    } else if (_phonecontroller.text.length != 10) {
      setState(() {
        _phoneErrorMessage = "Invalid phone number";
        _phoneError = true;
      });
    } else {
      setState(() {
        _phoneErrorMessage = null;
        _phoneError = false;
      });
    }
  }

  void validatePassword(String val) {
    if (val.isEmpty) {
      setState(() {
        _passwordErrorMessage = "This is field is required";
        _passwordError = true;
      });
    } else if (_passwordcontroller.text.length < 8) {
      setState(() {
        _passwordErrorMessage = "Password is weak";
        _passwordError = true;
      });
    } else {
      setState(() {
        _passwordErrorMessage = null;
        _passwordError = false;
      });
    }
  }

  Future<void> createUser() async {
    bool status = await FbAuthController().createUser(
        context: context,
        email: _emailController.text.trim(),
        password: _passwordcontroller.text.trim(),
        phone: _phonecontroller.text.trim());


    if(status){
      Navigator.pushReplacementNamed(context, Routes.signIn);
    }
  }
}

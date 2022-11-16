import 'package:e_commerce/controllers/fb_controller/auth_controller.dart';
import 'package:e_commerce/values/routes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/images.dart';
import '../../widgets/app_rich_text.dart';
import '../../widgets/app_text_button.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/app_text_field_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isObscure = true;

  late TextEditingController _emailController;
  late TextEditingController _passwordcontroller;

  late final TapGestureRecognizer _createAccountRecognizer;
  late final TapGestureRecognizer _forgotPasswordRecognizer;

  bool _emailError = false;
  bool _passwordError = false;

  String? _emailErrorMessage = "";
  String? _passwordErrorMessage = "";

  bool _isClick = false;

  @override
  void initState() {
    super.initState();
    _createAccountRecognizer = TapGestureRecognizer()
      ..onTap = NavigateToSignupScreen;
    _forgotPasswordRecognizer = TapGestureRecognizer()
      ..onTap = NavigateToForgotScreen;
    _emailController = TextEditingController();
    _passwordcontroller = TextEditingController();

  }

  @override
  void dispose() {
    _createAccountRecognizer.dispose();
    _forgotPasswordRecognizer.dispose();
    _emailController.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  void NavigateToForgotScreen() {
    Navigator.pushNamed(context, Routes.forgot);
  }

  void NavigateToSignupScreen() {
    Navigator.pushNamed(context, Routes.signUp);
  }

  void NavigateToHomeScreen() {
    Navigator.pushNamed(context, Routes.home);
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
                  height: 125.5.h,
                ),
                AppTextField(
                  controller: _emailController,
                  text: "Email",
                  prefIcon: Icon(Icons.email),
                  onPressed: () {},
                  errorText: _emailErrorMessage,
                  error: _emailError,
                  isVisibal: _isClick,
                  isChecked: _emailError ? false : true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextFieldPassword(
                  controller: _passwordcontroller,
                  onPressed: () {
                    setState(() {
                      this._isObscure = _isObscure ? false : true;
                    });
                  },
                  obscureText: _isObscure,
                  error: _passwordError,
                  errorText: _passwordErrorMessage,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: AppRichText(
                      Text: "Forgot Password?",
                      recognizer: _forgotPasswordRecognizer,
                      fontWeight: FontWeight.w800,
                    )),
                SizedBox(
                  height: 39.h,
                ),
                AppTextButton(
                    text: "Sign in",
                    onPressed: () async {
                      _isClick = true;

                      validateFields();
                      if (!_emailError && !_passwordError) {
                        signIn();
                      }
                    }),
                SizedBox(
                  height: 169.h,
                ),
                AppRichText(
                  Text: "Create an account?",
                  recognizer: _createAccountRecognizer,
                ),
                SizedBox(
                  height: 20.h,
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

  }

  void validateFields(){
    validateEmail(_emailController.text);
    validatePassword(_passwordcontroller.text);
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

  Future<void> signIn() async {
    bool status = await FbAuthController().SignIn(
        context: context,
        email: _emailController.value.text,
        password: _passwordcontroller.value.text);

    print("Email issssss"+_emailController.text);

    if(status){
      Navigator.pushReplacementNamed(context, "/home_screen");
    }
  }
}

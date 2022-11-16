import 'package:e_commerce/screens/auth_screen/forgot_password_screen.dart';
import 'package:e_commerce/screens/auth_screen/sign_in_screen.dart';
import 'package:e_commerce/screens/auth_screen/sign_up_screen.dart';
import 'package:e_commerce/screens/business_screens/home_screen.dart';
import 'package:e_commerce/screens/launch_screen.dart';
import 'package:e_commerce/screens/auth_screen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/sign_up_screen',

          routes: {
            '/launch_screen' : (context) => const LaunchScreen(),
            '/welcome_screen' : (context) => const WelcomeScreen(),
            '/sign_up_screen' : (context) => const SignUpScreen(),
            '/sign_in_screen' : (context) => const SignInScreen(),
            '/forgot_screen' : (context) => const ForgotPasswordScreen(),
            '/home_screen' : (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}

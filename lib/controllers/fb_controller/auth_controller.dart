import 'package:e_commerce/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FbAuthController with Helpers {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> SignIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      // if(userCredential != null){
      //   if(userCredential.user!.emailVerified){
      //     return true;
      //   }else{
      //     await userCredential.user!.sendEmailVerification();
      //   }
      //   showSnackBar(context: context, message: "Verify email to login into the app",error: true);
      // }
      return true;

      return false;
    } on FirebaseAuthException catch (e) {
      _controlException(context, e);
    } catch (e) {
      //
    }
    return false;
  }


  Future<bool> createUser(
      {required BuildContext context,
        required String email,
        required String password,
        required String phone}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user?.reload();
      await userCredential.user?.sendEmailVerification();
      return true;
    } on FirebaseAuthException catch (e) {
      _controlException(context, e);
    } catch (e) {
      print(e);
    }
    return false;
  }


  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  void _controlException(
      BuildContext context, FirebaseAuthException exception) {
    showSnackBar(context: context, message: exception.message ?? 'Error!' , error: true);
    switch (exception.code) {
      case 'invalid-email':
        break;

      case 'user-disabled':
        break;

      case 'user-not-found':
        break;

      case 'wrong-password':
        break;
    }
  }
}

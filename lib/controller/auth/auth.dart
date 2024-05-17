// ignore_for_file: camel_case_types, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authServices {
  void userLogin({email, password, required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String errorMsg;
      if (e.code == 'user-not-found') {
        errorMsg = 'User not found for that email';
      } else if (e.code == 'wrong-password') {
        errorMsg = 'Wrong password provided for that user';
      } else {
        errorMsg = 'Login with proper Email and Password';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMsg),
        ),
      );
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> createUser({email, password, username, context}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('------The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('------The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

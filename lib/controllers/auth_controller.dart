import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../screens/auth/login_screen.dart';
import '../screens/welcome_page.dart';

class AuthController extends GetxController {
  static AuthController authenticate = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();

    _user = Rx<User?>(auth.currentUser);
    //Our user get notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("Login page");

      //The user has not yet logged into the system
      //redirect them to the login screen
      Get.offAll(() => LoginScreen());
    } else {
      //The user has already logged in to the system
      Get.offAll(() => WelcomePage(
            email: user.email!,
          ));
    }
  }

  void regsiter(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        backgroundColor: Colors.redAccent,
        "About User",
        "Account Creation",
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text("Acoount creation failed"),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        backgroundColor: Colors.redAccent,
        "About Login",
        "Login message",
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Login failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void logout() async {
    await auth.signOut();
  }
}

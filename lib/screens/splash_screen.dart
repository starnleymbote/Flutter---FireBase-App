import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kazilink_mvp_1/screens/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1000), () {
      Get.to(LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          child: Image.asset('assets/logo.jpeg'),
          tag: "Logo Here",
        ),
      ),
    );
  }
}

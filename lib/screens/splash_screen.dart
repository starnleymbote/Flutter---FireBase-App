import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kazilink_mvp_1/controllers/auth_controller.dart';
import 'package:kazilink_mvp_1/screens/auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var userEmail;
  var userPassword;

  @override
  void _setData() {
    setState(() {
      userEmail = emailController.text.trim();
      userPassword = passwordController.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    double s_width = MediaQuery.of(context).size.width;
    double s_height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: s_width,
              height: s_height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/loginimg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: s_width,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                        letterSpacing: 2.5,
                        fontSize: 45,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Sign in to continue",
                    style: TextStyle(
                        letterSpacing: 1.5,
                        fontSize: 18,
                        color: Color(0xFF90CAF9),
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 7,
                          offset: Offset(13, 13),
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        prefixIcon: Icon(
                          Icons.email_sharp,
                          color: Colors.deepOrangeAccent,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black54, width: 2.0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 7,
                          offset: Offset(13, 13),
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ],
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        prefixIcon: Icon(
                          Icons.password_sharp,
                          color: Colors.deepOrangeAccent,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black54, width: 2.0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        "Forgot your password?",
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () {
                AuthController.authenticate
                    .login(emailController.text, passwordController.text);
              },
              child: Container(
                width: s_width * 0.5,
                height: s_height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('images/loginbtn.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: s_height * 0.08,
            ),
            RichText(
              text: TextSpan(
                text: "Don\`t have an account?",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: " Create",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => SignUpScreen()),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kazilink_mvp_1/controllers/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var userEmail;
  var userPassword;

  @override
  void _setData() {
    setState(() {
      userEmail = emailController.text;
      userPassword = passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    double s_width = MediaQuery.of(context).size.width;
    double s_height = MediaQuery.of(context).size.height;

    List socialImages = [
      'g.png',
      'f.png',
      't.png',
    ];

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
                  image: AssetImage('images/signup.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: s_height * 0.19,
                  ),
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white60,
                    backgroundImage: AssetImage("images/profile1.png"),
                  )
                ],
              ),
            ),
            Container(
              width: s_width,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Sign up here",
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
                        hintText: "Enter your email address",
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
                      controller: passwordController,
                      obscureText: true,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        prefixIcon: Icon(
                          Icons.password_sharp,
                          color: Colors.deepOrangeAccent,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black54, width: 2.0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () {
                AuthController.authenticate.regsiter(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
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
                    "Sign up",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Already have an account?",
                  style: TextStyle(color: Colors.blueGrey)),
            ),
            SizedBox(
              height: s_height * 0.08,
            ),
            RichText(
              text: TextSpan(
                text: "Sign up using the following methods",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            Wrap(
              children: List<Widget>.generate(
                3,
                (int index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.deepOrangeAccent,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("images/" + socialImages[index]),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

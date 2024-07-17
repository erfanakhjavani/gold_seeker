import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_seeker/features/features_intro/feature_login/screens/forgot_password.dart';
import 'package:gold_seeker/features/features_intro/feature_signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.jpg'),
              fit: BoxFit.fitHeight),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100.0, right: 100.0),
                child: MainText(
                  size: 40,
                  text: 'Welcome to',
                ),
              ),
              const MainText(
                size: 40,
                text: 'Gold Seeker!',
              ),
              const SizedBox(
                height: 60,
              ),
              TextFields(
                colorSide: const Color.fromARGB(203, 149, 0, 0),
                controller: userController,
                isObscured: false,
                text: 'Username or Email',
                icon: CupertinoIcons.person_solid,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFields(
                colorSide: const Color.fromARGB(203, 149, 0, 0),
                controller: passController,
                isObscured: true,
                text: 'Password',
                icon: CupertinoIcons.lock_fill,
              ),
              FuncText(
                text: 'Forgot Password?',
                size: 15,
                onPressed: () {
                  Get.to(const ForgotPasswordScreen(),transition: Transition.fadeIn);
                },
              ),
              middleWidget(),
              const Padding(
                padding: EdgeInsets.only(top: 50.0, bottom: 10),
                child: MainText(text: "I don't have account!", size: 20),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Get.to(const SignupScreen(),
                        transition: Transition.rightToLeftWithFade);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.redAccent, width: 2),
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Create account',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  //! Middle Widget
  Padding middleWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const MainText(text: "Sign In", size: 30),
          IconButton(
            iconSize: 25,
            splashColor: const Color.fromRGBO(248, 75, 42, 1.0),
            style: IconButton.styleFrom(
                elevation: 10,
                backgroundColor: const Color.fromRGBO(248, 75, 42, 1.0),
                fixedSize: const Size.fromRadius(30),
                shape: const CircleBorder()),
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_rounded),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

//! Main Text Widget
class MainText extends StatelessWidget {
  final String text;
  final double size;

  const MainText({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: size),
        ),
      ],
    );
  }
}

//! Function Text
class FuncText extends StatelessWidget {
  final String text;
  final double size;
  final Function() onPressed;

  const FuncText(
      {super.key,
      required this.text,
      required this.size,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 20),
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(66, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: size),
                ),
              ),
            )),
      ],
    );
  }
}

//! Text Field Widget
class TextFields extends StatefulWidget {
  final TextEditingController controller;
  final bool isObscured;
  final String text;
  final IconData icon;
  final Color colorSide;

  const TextFields(
      {super.key,
      required this.colorSide,
      required this.controller,
      required this.isObscured,
      required this.text,
      required this.icon});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

//* username and password is state full widget
class _TextFieldsState extends State<TextFields> {
  bool obscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(203, 38, 38, 38),
              borderRadius: BorderRadius.circular(12)),
          child: TextField(
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            controller: widget.controller,
            obscureText: widget.isObscured ? obscured : widget.isObscured,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15.0),
                child: Icon(
                  widget.icon,
                  color: const Color.fromARGB(203, 98, 98, 98),
                  size: 25,
                ),
              ),
              suffixIcon: widget.isObscured
                  ? Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15.0),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              obscured = !obscured;
                            });
                          },
                          icon: Icon(
                            obscured
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                            color: const Color.fromARGB(203, 98, 98, 98),
                            size: 25,
                          )),
                    )
                  : null,
              hintText: widget.text,
              hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 118, 118, 118),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              fillColor: const Color.fromARGB(150, 38, 38, 38),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Color.fromARGB(150, 38, 38, 38), width: 10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.colorSide,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ));
  }
}

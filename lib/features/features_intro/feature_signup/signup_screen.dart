import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../feature_login/screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/signup.jpg'),
              fit: BoxFit.fitHeight),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50.0, right: 100.0, bottom: 50.0),
                child: MainText(
                  size: 30,
                  text: 'Create account',
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              TextFields(
                colorSide: const Color.fromRGBO(0, 117, 250, 1.0),
                controller: TextEditingController(),
                isObscured: false,
                text: 'Username or Email',
                icon: CupertinoIcons.person_solid,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFields(
                colorSide: const Color.fromRGBO(0, 117, 250, 1.0),
                controller: TextEditingController(),
                isObscured: true,
                text: 'Password',
                icon: CupertinoIcons.lock_fill,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFields(
                colorSide: const Color.fromRGBO(0, 117, 250, 1.0),
                controller: TextEditingController(),
                isObscured: true,
                text: 'Confirm Password',
                icon: CupertinoIcons.lock_fill,
              ),
              const SizedBox(
                height: 15,
              ),
              acceptText(),
              middleWidget(),
              const Padding(
                padding: EdgeInsets.only(top: 50.0, bottom: 10),
                child: MainText(text: "I have already account!", size: 20),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Get.to(LoginScreen(),
                        transition: Transition.leftToRightWithFade);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromRGBO(0, 117, 250, 1.0),
                              width: 2),
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Login account',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Container acceptText() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 38, 38, 38),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: RichText(
        text: const TextSpan(
          text: 'By Clicking the',
          children: <TextSpan>[
            TextSpan(
              text: ' Register ',
              style: TextStyle(color: Color.fromRGBO(0, 117, 250, 1.0)),
            ),
            TextSpan(
              text: 'Button, you agree to \nthe public offer',
            ),
          ],
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
          const MainText(text: "Register", size: 30),
          IconButton(
            iconSize: 25,
            splashColor: const Color.fromRGBO(248, 75, 42, 1.0),
            style: IconButton.styleFrom(
                elevation: 10,
                backgroundColor: const Color.fromRGBO(0, 117, 250, 1.0),
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

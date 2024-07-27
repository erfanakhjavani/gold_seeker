import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../appodeal/appodeal_main.dart';
import '../../feature_signup/screens/signup_screen.dart';
import 'forgot_password.dart';

class LoginScreen extends StatelessWidget {


  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     // backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.gif'),
              fit: BoxFit.fitHeight
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100.0, right: 100.0,),
                child: MainText(
                  size: 40,
                  text: 'Welcome to',
                  color: Colors.black,
                ),
              ),
              const MainText(
                size: 40,
                text: 'Gold Seeker!',
                color: Colors.black,
              ),
              const SizedBox(
                height: 114,
              ),
              TextFields(

                controller: userController,
                isObscured: false,
                text: 'Username or Email',
                icon: CupertinoIcons.person_solid,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFields(

                controller: passController,
                isObscured: true,
                text: 'Password',
                icon: CupertinoIcons.lock_fill,
              ),
              FuncText(
                text: 'Forgot Password?',
                size: 15,
                onPressed: () {
                  Get.to(ForgotPasswordScreen(), transition: Transition.fadeIn);
                },
              ),
              middleWidget(),
              const Padding(
                padding: EdgeInsets.only(top: 50.0, bottom: 10),
                child: MainText(text: "I don't have account!", size: 20),
              ),
              ButtonColorSide(
                textColor: Colors.white,
                colorSide: Colors.redAccent,
                onPressed: () {
                  Navigator.canPop(context);
                  Get.to(SignupScreen(),
                      transition: Transition.rightToLeftWithFade);
                },
                text: 'Create account',
              )
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
          const MainText(text: "Appodeal", size: 30),
          IconButton(
            iconSize: 25,
            splashColor: const Color.fromRGBO(248, 75, 42, 1.0),
            style: IconButton.styleFrom(
                elevation: 20,
                backgroundColor: const Color.fromRGBO(248, 75, 42, 1.0),
                shadowColor: const Color.fromRGBO(248, 75, 42, 1.0),

                fixedSize: const Size.fromRadius(30),
                shape: const CircleBorder()),
            onPressed: () {
              Get.to(AppodealDemoApp(), transition: Transition.fadeIn);
            },
            icon: const Icon(Icons.arrow_forward_rounded),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}


//! Button Color Side
class ButtonColorSide extends StatelessWidget {

  final Color colorSide;
  final String text;
  final Function() onPressed;
  final double? width;
  final double? height;
  final double? textSize;
  final Color? textColor;


  ButtonColorSide(
      {
        required this.colorSide,
        required this.text,
        required this.onPressed,
         this.width,
         this.height,
         this.textSize,
         this.textColor,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                side:  BorderSide(
                    color: colorSide, width: 2),
                borderRadius: BorderRadius.circular(10))),
        child:  Text(
        text,
        style: TextStyle(color: textColor == null ? Colors.white : textColor,fontSize: textSize),
      )),
    );
  }
}

//! Main Text Widget
class MainText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;

  const MainText({ required this.text, required this.size,this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
              color: color == null ? Colors.white : color,
              fontWeight: FontWeight.w900, fontSize: size),
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

  const FuncText({
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


  const TextFields({
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
              color: const Color.fromARGB(179, 38, 38, 38),
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
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),

              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              const WelcomeText(),
              const SizedBox(
                height: 60,
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
              GetText(
                text: 'Forgot Password?',
                size: 15,
                onPressed: (){},

              )
            ],
          ),
        ),
      ),
    );
  }
}

class GetText extends StatelessWidget {
  String text;
  double size;
  Function() onPressed;


  GetText({super.key, required this.text, required this.size,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 20),
            child: TextButton(
              onPressed: onPressed,
              child:  Text(
                text,
                style:  TextStyle(color: Colors.white, fontSize: size),
              ),
            )),
      ],
    );
  }
}

//! Text Field Widget
class TextFields extends StatefulWidget {
  final TextEditingController controller;
  late bool isObscured;
  final String text;
  final IconData icon;

  TextFields(
      {super.key,
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
              fillColor: const Color.fromARGB(203, 38, 38, 38),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Color.fromARGB(203, 38, 38, 38), width: 10),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(203, 38, 38, 38),
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ));
  }
}

//! Welcome Text Widget
class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 100.0, right: 100.0),
      child: Column(
        children: [
          Text(
            'Welcome to ',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 40),
          ),
          Text(
            'Gold Seeker!',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 40),
          ),
        ],
      ),
    );
  }
}

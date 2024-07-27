import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/images/forgot_password.jpg'),
        //       fit: BoxFit.cover),
        // ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100.0, right: 100.0, bottom: 50.0),
                child: MainText(text: 'Recovery \n Password', size: 40),
              ),
              const SizedBox(
                height: 50,
              ),

              TextFields(
                controller: TextEditingController(),
                isObscured: false,
                text: 'Enter your email address',
                icon: Icons.mail,
              ),
              const SizedBox(
                height: 30,
              ),


              acceptText(),
              const SizedBox(height: 50,),
              middleWidget(),
              const SizedBox(height: 65,),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Get.back();
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color:  Color.fromRGBO(78, 24, 220, 1.0),
                              width: 2),
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Back',
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
        color: const Color.fromARGB(148, 38, 38, 38),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Text('we will send you a message to set or reset your \nNew Password',
      style: TextStyle(color: Colors.white),
      )
    );
  }

  //! Middle Widget
  Padding middleWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const MainText(text: "Send code", size: 30),


          IconButton(
            iconSize: 25,
            style: IconButton.styleFrom(
                elevation: 20,
                backgroundColor: const Color.fromRGBO(78, 24, 220, 1.0),
                shadowColor: const Color.fromRGBO(78, 24, 220, 1.0),
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

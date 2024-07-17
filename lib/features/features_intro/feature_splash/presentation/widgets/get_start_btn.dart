
import 'package:flutter/material.dart';

class GetStartBtn extends StatefulWidget {
  final String text;
  final Function onTap;
  const GetStartBtn({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  State<GetStartBtn> createState() => _GetStartBtnState();
}

class _GetStartBtnState extends State<GetStartBtn> with TickerProviderStateMixin{

  late AnimationController fadeController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fadeController = AnimationController(
      value: 0,
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    fadeAnimation = CurvedAnimation(parent: fadeController, curve: Curves.ease);
    fadeController.forward();
  }

  @override
  void dispose() {
    fadeController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SizedBox(
        height: 50,
        width: 120,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // <-- Radius
            ),
          ),
          onPressed: (){
            widget.onTap();
          },
          child: Text(widget.text, style: const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500, fontFamily: 'Irs'),),),
      ),
    );
  }
}

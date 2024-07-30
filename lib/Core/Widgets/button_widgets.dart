 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import '../Constants/app_colors.dart';


//! Button Widget
class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final TextStyle? textStyle;


  const ButtonWidget({super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.color,
    this.radius,
    this.height,
    this.textStyle
  });

  @override
   Widget build(BuildContext context) {
     return SizedBox(
       width: width ?? width,
       height: height ?? height,
       child: TextButton(
           style: TextButton.styleFrom(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 5)),
             backgroundColor: color ?? AppColors.primary
           ),
           onPressed: onPressed,
           child: Text(text,style: textStyle ?? Get.textTheme.bodyLarge),
       ),
     );
   }
 }





//! Gif
 class GifBG extends StatelessWidget {
   final ImageProvider<Object> image;
   final BoxFit? fit;
   final double? fps;
   final double? width;
   final double? height;


   const GifBG({required this.image, this.fit, this.fps, this.width,super.key, this.height});


  @override
   Widget build(BuildContext context) {
    return Gif(
       image: image,
       fit: BoxFit.cover,
       fps: 20,
       width: double.infinity,
       height: double.infinity,
       autostart: Autostart.loop,
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
                     onPressed: () {},
                     icon: const Icon(

                       CupertinoIcons.eye_slash,
                       color: Color.fromARGB(203, 98, 98, 98),
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




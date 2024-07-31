import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
//  class GifBG extends StatelessWidget {
//    final ImageProvider<Object> image;
//    final BoxFit? fit;
//    final double? fps;
//    final double? width;
//    final double? height;
//
//
//    const GifBG({required this.image, this.fit, this.fps, this.width,super.key, this.height});
//
//
//   @override
//    Widget build(BuildContext context) {
//     return Gif(
//        image: image,
//        fit: BoxFit.cover,
//        fps: 20,
//        width: double.infinity,
//        height: double.infinity,
//        autostart: Autostart.loop,
//      );
//    }
//  }









 //! Text Field Widget
 class TextFields extends StatelessWidget {

   final TextEditingController controller;
   final String text;
   final IconData? icon;
   final EdgeInsets? padding;
   final TextStyle? inputStyle;
   final TextStyle? hintStyle;
   final Color? backgroundColor;

   const TextFields({super.key,
     required this.controller,
     required this.text,
     this.icon,
     this.padding,
     this.inputStyle,
     this.hintStyle,
     this.backgroundColor
   });

   @override
   Widget build(BuildContext context) {
     return Padding(
         padding: padding ?? const EdgeInsets.only(left: 20, right: 20),
         child: Container(
           decoration: BoxDecoration(
               color: backgroundColor ?? Colors.black45,
               borderRadius: BorderRadius.circular(12)),
           child: TextField(
             style: inputStyle ?? const TextStyle(
                 inherit: true,
                 color: Colors.white, fontSize: 16,
                 fontWeight: FontWeight.w500),
             controller: controller,
             cursorColor: Colors.white,
             decoration: InputDecoration(
               prefixIcon: icon == null ? null : Padding(
                 padding: const EdgeInsets.only(left: 15, right: 15.0),
                 child: Icon(
                   icon,
                   color: const Color.fromARGB(203, 98, 98, 98),
                   size: 25,
                 ),
               ),
               hintText: text,
               hintStyle: hintStyle ?? const TextStyle(
                   color: Color.fromARGB(255, 118, 118, 118),
                   fontSize: 14,
                   letterSpacing: 1,
                   fontWeight: FontWeight.w400),
               hintTextDirection: TextDirection.ltr,
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
             textAlign: TextAlign.center,
           ),
         ));
   }
 }



//! Leading
class Leading extends StatelessWidget {

   final String? text;
   final Color? color;


   const Leading({super.key, this.text, this.color});

   @override
   Widget build(BuildContext context) {
     return AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0,
       leading: Padding(
         padding: const EdgeInsets.only(left: 12.0,top: 10,right: 10),
         child: GestureDetector(
           onTap: () => Navigator.pop(context),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             mainAxisSize: MainAxisSize.max,
             children: [
               const Icon(Icons.arrow_back_ios,size: 30,),
               Text(
                 text ?? 'Back',
                 style: Get.textTheme.bodyLarge?.copyWith(color: color ?? Colors.black),
               ),
             ],
           ),
         ),
       ),
     );
   }
 }




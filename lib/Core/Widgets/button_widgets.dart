import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/app_colors.dart';


//! Button Widget
class ButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final TextStyle? textStyle;
  final Widget? widget;


  const ButtonWidget({super.key,
     this.text,
    required this.onPressed,
    this.width,
    this.color,
    this.radius,
    this.height,
    this.textStyle,
    this.widget
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? width,
      height: height ?? height,
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 5)),
            backgroundColor: color ?? AppColors.primary
        ),
        onPressed: onPressed,
        child: widget ?? Text(text ?? '', style: textStyle ?? Get.textTheme.bodyLarge),
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
  final Function()? onComplete;

  const TextFields({super.key,
    required this.controller,
    required this.text,
    this.icon,
    this.padding,
    this.inputStyle,
    this.hintStyle,
    this.backgroundColor,
    this.onComplete
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
            keyboardType: TextInputType.text,
            style: inputStyle ?? const TextStyle(
                inherit: true,
                letterSpacing: 1,
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


AppBar customAppBar({
  final String? text,
  final Color? color,
  final Color? backColor,
  final List<Widget>? actions,
  final IconData? icon,


}) {
  return AppBar(

      elevation: 0,
      automaticallyImplyLeading: false,

      flexibleSpace: FlexibleSpaceBar.createSettings(currentExtent: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0,top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon != null ? IconButton(onPressed: () {},

                icon:  Icon(
                  icon),
              ) : const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,top: 5),
                child: Text(
                  text!,
                  style: Get.textTheme.bodyLarge?.copyWith(
                      color: color ?? Colors.black),
                ),
              ),
            ],
          ),
        ),),
      backgroundColor: backColor ?? AppColors.primary,

      actions: actions
  );
}
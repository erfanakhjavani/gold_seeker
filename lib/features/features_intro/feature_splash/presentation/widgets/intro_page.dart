import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const IntroPage({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    /// get device size
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// image
          SizedBox(
            width: width,
            height: height * 0.6,
            child: DelayedWidget(
                delayDuration: const Duration(milliseconds: 200),// Not required
                animationDuration: const Duration(seconds: 1),// Not required
                animation: DelayedAnimations.SLIDE_FROM_BOTTOM,//
                child: Image.asset(image))),

          const SizedBox(
            height: 40,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(8,0,8,0),
            child: DelayedWidget(
              delayDuration: const Duration(milliseconds: 400), // Not required
              animationDuration: const Duration(seconds: 1), // Not required
              animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // Not required
              child: Text(title,
                  style: textTheme.titleMedium),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: DelayedWidget(
                delayDuration: const Duration(milliseconds: 600),
                // Not required
                animationDuration: const Duration(seconds: 1),
                // Not required
                animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                // Not required
                child: Text(description,
                    style: textTheme.bodyMedium)),
          ),
        ],
      ),
    );
  }
}

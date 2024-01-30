import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.child,
    this.type = "elevated",
    this.width = 200,
    this.height = 47,
    this.backgroundColor,
  });

  final Function()? onPressed;
  final Widget? child;
  final String type;
  final double width;
  final double height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (type == "elevated") {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width, height),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor:
              backgroundColor ?? const Color.fromARGB(255, 98, 7, 114),
        ),
        child: child,
      );
    }
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        fixedSize: Size(width, height),
      ),
      child: child ?? const SizedBox(),
    );
  }
}

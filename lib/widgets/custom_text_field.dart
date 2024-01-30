import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isSecure = false,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.validator,
    this.autovalidateMode,
    this.height = 54,
    this.width = double.infinity,
  });

  final TextEditingController controller;
  final String labelText;
  final bool isSecure;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final String? Function(String? value)? validator;
  final AutovalidateMode? autovalidateMode;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        controller: controller,
        keyboardType: textInputType,
        obscureText: isSecure,
        cursorColor: Colors.white,
        decoration: InputDecoration(
            errorStyle: const TextStyle(height: 0),
            constraints:
                BoxConstraints(maxHeight: height * 0.065, maxWidth: width),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white70),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 224, 15, 0))),
            hintText: labelText,
            hintStyle: const TextStyle(fontSize: 14),
            suffixIcon: suffixIcon),
        validator:
            validator == null ? (value) => "" : (value) => validator!(value),
      ),
    );
  }
}

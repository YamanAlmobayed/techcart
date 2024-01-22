import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key, this.onPressed, required this.buttonText, this.focusNode});
  final void Function()? onPressed;
  final String buttonText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      focusNode: focusNode,
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 41.0.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

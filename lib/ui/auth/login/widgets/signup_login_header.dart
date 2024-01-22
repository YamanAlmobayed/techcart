import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupLoginHeader extends StatelessWidget {
  const SignupLoginHeader(
      {super.key,
      required this.text,
      required this.crossAlignment,
      required this.isCurrent,
      this.onTap});

  final String text;
  final CrossAxisAlignment crossAlignment;
  final bool isCurrent;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAlignment,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 45.0.sp,
            ),
          ),
        ),
        SizedBox(
          height: 10.0.w,
        ),
        if (isCurrent)
          Container(
            height: 5,
            width: 120,
            color: Colors.blue,
          ),
      ],
    );
  }
}

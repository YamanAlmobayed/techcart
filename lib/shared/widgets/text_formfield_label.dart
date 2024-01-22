import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldLabel extends StatelessWidget {
  const TextFormFieldLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 28.0.sp,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

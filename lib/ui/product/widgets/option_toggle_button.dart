import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionToggleButton extends StatelessWidget {
  const OptionToggleButton(
      {super.key,
      required this.optionSelection,
      required this.optionSize,
      required this.onPressed});

  final bool optionSelection;
  final String optionSize;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(10),
      borderColor: Colors.black,
      borderWidth: 3.0.w,
      selectedBorderColor: Colors.blue,
      fillColor: Colors.blue,
      selectedColor: Colors.white,
      isSelected: [optionSelection],
      onPressed: onPressed,
      children: [
        Text(
          optionSize,
          style: TextStyle(
            fontSize: 34.0.w,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

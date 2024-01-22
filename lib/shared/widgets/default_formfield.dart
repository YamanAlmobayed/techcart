import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.icon,
      this.obsecureText = false,
      this.keyboardType,
      this.onTap,
      this.readOnly = false,
      this.onEditingComplete,
      this.focusNode,
      this.textAlignVertical});

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final IconData? icon;
  final bool obsecureText;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final bool readOnly;
  final Function()? onEditingComplete;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      textAlignVertical: textAlignVertical,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        prefix: SizedBox(
          width: 20.0.w,
        ),
        filled: true,
        fillColor: const Color.fromARGB(121, 203, 208, 237),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
            width: 3.0.w,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
            width: 3.0.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 3.0.w,
          ),
        ),
      ),
      obscureText: obsecureText,
    );
  }
}

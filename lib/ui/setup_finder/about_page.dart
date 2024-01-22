import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupFinderAboutPage extends StatelessWidget {
  const SetupFinderAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'Setup Finder is an expert system developed by Yaman Almobayed and Yazan Shakhasiro that guide the user to find the best Desktop that fits his need based on a questions that don’t require any expertise in the tech world.',
          style: TextStyle(fontSize: 40.0.sp),
        ),
      ),
    );
  }
}

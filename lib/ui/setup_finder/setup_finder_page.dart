import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/ui/setup_finder/cubit/setupfinder_cubit.dart';

class SetupFinderPage extends StatelessWidget {
  const SetupFinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setup Finder',
          style: TextStyle(
            fontSize: 38.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  context.read<SetupfinderCubit>().getSetupfinderInit();
                  context.pushReplacementNamed(AppRoutes().quiz);
                },
                color: Colors.blue,
                height: 100.0.w,
                minWidth: 300.0.w,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 35.0.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0.w,
              ),
              MaterialButton(
                onPressed: () {
                  context.pushNamed(AppRoutes().setupFinderAbout);
                },
                color: Colors.blue,
                height: 100.0.w,
                minWidth: 300.0.w,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 35.0.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

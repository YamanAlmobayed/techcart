import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/shared/gen/assets.gen.dart';
import 'package:techcart/shared/router/routes.dart';

class CongratulationPage extends StatelessWidget {
  const CongratulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 200.0.w,
              ),
              Expanded(
                child: Center(
                  child: const $AssetsImagesGen().congratulations.image(),
                ),
              ),
              Text(
                "Congratulations",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 53.0.sp,
                ),
              ),
              SizedBox(
                height: 27.0.w,
              ),
              Text(
                " Your order was placed successfully.\n For more details, Check my orders page\n under profile tab",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 30.0.sp,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5.0,
                ),
                child: MaterialButton(
                  highlightElevation: 0.0,
                  onPressed: () {
                    context.pushReplacementNamed(AppRoutes().index);
                  },
                  color: Colors.blue,
                  height: 120.0.w,
                  minWidth: 400.0.w,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/models/categories_model.dart';
import 'package:techcart/shared/router/routes.dart';

class NavigateToAllCategoriesButton extends StatelessWidget {
  const NavigateToAllCategoriesButton({super.key, required this.model});

  final CategoriesDataModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRoutes().category,
          pathParameters: {
            'title': model.name!,
          },
          extra: model.products,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(60),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 115.0.sp,
                child: Icon(
                  model.name == "Mobile"
                      ? Icons.phone_android_outlined
                      : model.name == "Laptop"
                          ? Icons.laptop
                          : model.name == "Tablet"
                              ? Icons.tablet_android_outlined
                              : model.name == "Watch"
                                  ? Icons.watch_outlined
                                  : Icons.desktop_mac_rounded,
                  size: 100.0.sp,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 10.0.w,
            ),
            Text(
              model.name!,
              style: TextStyle(
                fontSize: 30.0.sp,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}

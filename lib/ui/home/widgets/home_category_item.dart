import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/models/categories_model.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/shared/router/routes.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({
    super.key,
    required this.label,
    required this.icon,
    this.labelColor = Colors.black,
    this.fontWeight = FontWeight.w400,
    this.products,
    this.categories,
    this.isCategories = false,
  });
  final String label;
  final List<ProductDataModel>? products;
  final CategoriesModel? categories;
  final bool isCategories;
  final IconData icon;
  final Color labelColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isCategories) {
          context.pushNamed(
            AppRoutes().categories,
            extra: categories,
          );
        } else {
          context.pushNamed(
            AppRoutes().category,
            pathParameters: {'title': label},
            extra: products,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(40),
              elevation: 5,
              child: CircleAvatar(
                radius: 80.r,
                backgroundColor: Colors.white,
                child: Icon(
                  icon,
                  color: Colors.blue,
                  size: 60.0.sp,
                ),
              ),
            ),
            SizedBox(
              height: 15.0.w,
            ),
            Text(
              label,
              style: TextStyle(
                color: labelColor,
                fontSize: 30.0.sp,
                fontWeight: fontWeight,
              ),
            )
          ],
        ),
      ),
    );
  }
}

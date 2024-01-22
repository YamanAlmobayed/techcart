import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/shared/widgets/default_gridview.dart';

class HomeProductItem extends StatelessWidget {
  const HomeProductItem({
    super.key,
    required this.model,
    required this.type,
  });

  final List<ProductDataModel> model;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 38.0.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0.w,
        ),
        ConditionalBuilder(
          condition: model.isNotEmpty,
          builder: (context) => SizedBox(
            height: 200,
            child: DefaultGridView(
              products: model,
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}

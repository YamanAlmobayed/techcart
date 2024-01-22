import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/models/orders_model.dart';
import 'package:techcart/shared/router/routes.dart';

class MyOrderCard extends StatelessWidget {
  const MyOrderCard({super.key, required this.index, required this.model});

  final int index;
  final OrdersDataModel model;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 4.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          final Map<String, dynamic> orderInfo = {
            'orderProducts': model.cart!,
            'address': model.address!,
            'deliveryType': model.deliveryOption!,
            'paymentMathod': model.paymentMethod!,
            'orderTotalPrice': model.totalPrice!,
            'index': index,
          };
          context.pushNamed(
            AppRoutes().order,
            extra: orderInfo,
          );
        },
        child: SizedBox(
          height: 147.0.w,
          width: double.infinity,
          child: Center(
            child: Text(
              "Order ${index + 1}",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 38.0.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

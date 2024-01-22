import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/models/cart_model.dart';
import 'package:techcart/ui/orders/widgets/order_details_item.dart';
import 'package:techcart/ui/orders/widgets/order_product_list.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({
    super.key,
    required this.orderProducts,
    required this.address,
    required this.deliveryType,
    required this.paymentMathod,
    required this.orderTotalPrice,
    required this.index,
  });
  final List<CartDataModel> orderProducts;
  final String address;
  final String deliveryType;
  final String paymentMathod;
  final int orderTotalPrice;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => context.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Order ${index + 1}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 38.0.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderDetailsItem(
              option: "Address:",
              data: address,
            ),
            SizedBox(
              height: 28.0.sp,
            ),
            OrderDetailsItem(
              option: "Delivery Type:",
              data: deliveryType,
            ),
            SizedBox(
              height: 28.0.sp,
            ),
            OrderDetailsItem(
              option: "Payment Method:",
              data: paymentMathod,
            ),
            SizedBox(
              height: 28.0.sp,
            ),
            OrderDetailsItem(
              option: "Total Cost:",
              data: "$orderTotalPrice\$",
            ),
            SizedBox(
              height: 38.0.w,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => OrderProductList(
                    product: orderProducts[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.0.w,
                  ),
                  itemCount: orderProducts.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

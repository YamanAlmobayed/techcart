import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techcart/repository/models/cart_model.dart';

class OrderProductList extends StatelessWidget {
  const OrderProductList({super.key, required this.product});

  final CartDataModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(15.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 180.0.w,
                width: 200.0.w,
                child: ConditionalBuilder(
                  condition: product.product!.photo != null,
                  builder: (context) => ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image:
                          CachedNetworkImageProvider(product.product!.photo!),
                      height: 198.0.w,
                      width: 198.0.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  fallback: (context) => const Center(
                    child: Text('No Image'),
                  ),
                ),
              ),
              SizedBox(
                width: 297.0.w,
                child: Text(
                  product.product!.name!,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 34.0.sp,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: 48.0.w,
                child: Text(
                  product.quantity!.toString(),
                  style: TextStyle(
                    fontSize: 38.0.sp,
                    fontWeight: FontWeight.w500,
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

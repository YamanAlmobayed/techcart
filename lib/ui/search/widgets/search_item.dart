import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/shared/router/routes.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.product});

  final ProductDataModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes().product, extra: product);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .13,
        height: MediaQuery.of(context).size.height * .12,
        child: Row(
          children: [
            product.photo == null
                ? SizedBox(
                    width: 230.0.w,
                    child: Center(
                      child: Text(
                        "No Image",
                        style: TextStyle(
                          fontSize: 35.0.w,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                : Image(
                    image: CachedNetworkImageProvider(product.photo!),
                    fit: BoxFit.contain,
                    width: 230.0.w,
                    height: 190.0.w,
                  ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 5.0, left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name!,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.w400,
                        fontSize: 35.0.sp,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 30.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

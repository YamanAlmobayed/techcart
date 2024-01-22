import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:techcart/ui/favortie/cubit/favorite_cubit.dart';
import 'package:techcart/ui/product/product_page.dart';

import '../constants.dart';

class DefaultGridViewItem extends StatelessWidget {
  const DefaultGridViewItem({
    super.key,
    required this.product,
  });

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 5,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.5),
      ),
      closedBuilder: ((context, action) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            right: 7.0,
            left: 7.0,
          ),
          child: Column(
            children: [
              product.photo == null
                  ? const Expanded(
                      child: SizedBox(
                          child: Center(
                        child: Text(
                          "No image",
                        ),
                      )),
                    )
                  : Expanded(
                      child: Image(
                        image: CachedNetworkImageProvider(product.photo),
                        fit: BoxFit.contain,
                      ),
                    ),
              SizedBox(
                height: 8.0.w,
              ),
              SizedBox(
                width: double.infinity,
                child: AutoSizeText(
                  product.name,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.grey[650],
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (AppConstants.appContants.token != "null")
                    LikeButton(
                      size: 20,
                      isLiked: context
                          .watch<FavoriteCubit>()
                          .isLiked(productId: product.id),
                      onTap: (isLiked) async {
                        if (isLiked) {
                          context
                              .read<FavoriteCubit>()
                              .userDeleteFavorite(product: product);
                          return !isLiked;
                        } else {
                          context
                              .read<FavoriteCubit>()
                              .userAddFavorite(product: product);
                          return !isLiked;
                        }
                      },
                    ),
                ],
              ),
            ],
          ),
        );
      }),
      openBuilder: (context, action) {
        return ProductPage(
          product: product,
        );
      },
    );
  }
}

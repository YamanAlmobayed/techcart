import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techcart/repository/models/cart_model.dart';
import 'package:techcart/ui/cart/cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cart});

  final CartDataModel cart;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    return Dismissible(
      background: Container(
        color: Colors.white,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete_outline_outlined,
          color: Colors.blue,
          size: 135.0.sp,
        ),
      ),
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        cartCubit.deleteFromCart(cartId: cart.id!);
      },
      child: Container(
        height: 200.0.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Colors.grey[350]!,
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cart.product!.photo == null
                  ? SizedBox(
                      width: 200.0.w,
                      child: Text(
                        "No Image",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 33.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ))
                  : Image(
                      image: CachedNetworkImageProvider(cart.product!.photo!),
                      width: 200.0.w,
                    ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart.product!.name!,
                        maxLines: 2,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                          fontSize: 35.0.sp,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "\$${cart.product!.price!}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 34.0.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 67.0.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(10),
                        topStart: Radius.circular(10),
                      ),
                    ),
                    child: MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(10),
                          topStart: Radius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        if (cart.quantity == 1) return;

                        cartCubit.updateCart(
                            productId: cart.product!.id!,
                            qunatity: cart.quantity! - 1);
                      },
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Icon(
                        color: Colors.black,
                        Icons.minimize,
                        size: 57.0.sp,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 94.0.w,
                    width: 57.w,
                    alignment: Alignment.center,
                    child: Text(
                      "${cart.quantity}",
                      style: TextStyle(
                        fontSize: 37.0.w,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 67.0.w,
                    child: MaterialButton(
                      elevation: 0.0,
                      highlightElevation: 0.0,
                      color: Colors.white,
                      padding: EdgeInsets.zero,
                      height: 94.0.w,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(10),
                          topEnd: Radius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        if (cart.quantity == 99) return;
                        cartCubit.updateCart(
                            productId: cart.product!.id!,
                            qunatity: cart.quantity! + 1);
                      },
                      child: Icon(
                        color: Colors.black,
                        Icons.add,
                        size: 57.0.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

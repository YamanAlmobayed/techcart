import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techcart/repository/models/cart_model.dart';
import 'package:techcart/ui/cart/cubit/cart_cubit.dart';

class PlaceOrderItem extends StatelessWidget {
  const PlaceOrderItem({super.key, required this.cart});

  final CartDataModel cart;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    return Dismissible(
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.blue[500],
        child: const Icon(
          Icons.delete_outline_outlined,
          color: Colors.white,
          size: 70,
        ),
      ),
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cartCubit.deleteFromCart(cartId: cart.id!);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .129,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[350]!,
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cart.product!.photo == null
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                      child: const Text(
                        "No pic",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.5, fontWeight: FontWeight.w600),
                      ))
                  : Image(
                      image: CachedNetworkImageProvider(cart.product!.photo!),
                      width: MediaQuery.of(context).size.width * .3,
                    ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .28,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cart.product!.name!,
                      maxLines: 2,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "\$${cart.product!.price!}",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 35,
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
                      child: const Icon(
                        color: Colors.black,
                        Icons.minimize,
                        size: 27,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 48,
                    width: 30,
                    alignment: Alignment.center,
                    child: Text(
                      "${cartCubit.getProductQuantity(productID: cart.product!.id!)}",
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 35,
                    child: MaterialButton(
                      elevation: 0.0,
                      highlightElevation: 0.0,
                      color: Colors.white,
                      padding: EdgeInsets.zero,
                      height: 48,
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
                      child: const Icon(
                        color: Colors.black,
                        Icons.add,
                        size: 27,
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

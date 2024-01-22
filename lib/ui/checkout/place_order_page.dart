import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/shared/utils.dart';

import 'package:techcart/ui/cart/cubit/cart_cubit.dart';
import 'package:techcart/shared/widgets/cart_item.dart';
import 'package:techcart/ui/checkout/cubit/checkout_cubit.dart';
import 'package:techcart/ui/checkout/widgets/place_order_button.dart';

class PlaceOrderPage extends StatelessWidget {
  const PlaceOrderPage({
    super.key,
    required this.street,
    required this.city,
    required this.country,
    required this.masterCardLastTwoDigit,
    required this.userMasterCard,
  });
  final String street;
  final String city;
  final String country;
  final String masterCardLastTwoDigit;
  final String userMasterCard;

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = context.read<CheckoutCubit>();
    final cartCubit = context.read<CartCubit>();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        checkoutCubit.currentStep = 0;
        context.pushReplacementNamed(AppRoutes().checkout);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: MaterialButton(
            onPressed: () {
              checkoutCubit.currentStep = 0;
              context.pushReplacementNamed(AppRoutes().checkout);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
          ),
          title: Text(
            "Checkout",
            style: TextStyle(
              color: Colors.black,
              fontSize: 42.0.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SHIPPING ADDRESS",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w900,
                        fontSize: 38.0.sp,
                      ),
                    ),
                    SizedBox(
                      height: 17.0.w,
                    ),
                    Text(
                      street,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 33.0.sp,
                      ),
                    ),
                    Text(
                      city,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 33.0.sp,
                      ),
                    ),
                    Text(
                      country,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 33.0.sp,
                      ),
                    ),
                    SizedBox(
                      height: 21.0.w,
                    ),
                    Text(
                      "PAYMENT METHOD",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w900,
                        fontSize: 38.0.sp,
                      ),
                    ),
                    SizedBox(
                      height: 17.0.w,
                    ),
                    Text(
                      "Master Card ending **$masterCardLastTwoDigit",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 38.0.sp,
                      ),
                    ),
                    SizedBox(
                      height: 14.0.w,
                    ),
                    ConditionalBuilder(
                      condition: cartCubit.carts.cartList!.isNotEmpty,
                      builder: (context) => BlocBuilder<CartCubit, CartState>(
                        buildWhen: (_, current) =>
                            current is UpdateCartLocalSuccess ||
                            current is DeleteFromCartLocalSuccess ||
                            current is ModifyingCartError,
                        builder: (_, __) {
                          return Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "PRODUCTS",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 38.0.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 37.0.w,
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => CartItem(
                                      cart: cartCubit.carts.cartList![index],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: 8.0.w,
                                    ),
                                    itemCount: cartCubit.carts.cartList!.length,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      fallback: (context) => const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(112, 100, 180, 246),
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<CartCubit, CartState>(
                    buildWhen: (_, current) =>
                        current is UpdateCartLocalSuccess ||
                        current is DeleteFromCartLocalSuccess ||
                        current is ModifyingCartError,
                    builder: (_, __) {
                      return Text(
                        "Total: \$${cartCubit.totalPrice().toInt()}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 42.0.sp,
                        ),
                      );
                    },
                  ),
                  ConditionalBuilder(
                    condition: cartCubit.carts.cartList!.isNotEmpty,
                    builder: (context) =>
                        BlocBuilder<CheckoutCubit, CheckoutState>(
                      buildWhen: (_, current) =>
                          current is PlaceOrdersLoading ||
                          current is PlaceOrdersSuccess ||
                          current is PlaceOrdersError,
                      builder: (context, state) {
                        if (state is PlaceOrdersLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return PlaceOrderButton(
                            textColor: Colors.white,
                            onPressed: () async {
                              String address = "$street $city $country ";

                              await checkoutCubit.placeOrder(
                                  address: address,
                                  deliveryMethod:
                                      checkoutCubit.deliveryMethodValue,
                                  paymentMethod:
                                      "Master Card ending **$masterCardLastTwoDigit",
                                  totalPrice: cartCubit.totalPrice().toInt(),
                                  carts: cartCubit.getCartIds());
                              await cartCubit.deleteCartWhileCheckouting();
                              checkoutCubit.currentStep = 0;
                              // ignore: use_build_context_synchronously
                              clearAndNavigate(
                                  context, AppRoutes().congratulation);
                            },
                          );
                        }
                      },
                    ),
                    fallback: (context) => const PlaceOrderButton(
                      textColor: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

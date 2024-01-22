import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/shared/constants.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/shared/utils.dart';
import 'package:techcart/shared/widgets/cart_item.dart';
import 'package:techcart/ui/cart/cubit/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return ConditionalBuilder(
      condition: AppConstants.appContants.token != "null",
      builder: (context) => BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is GetCartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetCartError) {
            showToast(text: state.errorMessage, state: ToastStates.error);
            return Center(
              child: OutlinedButton(
                onPressed: () {
                  cartCubit.getCart();
                },
                child: const Text('Retry'),
              ),
            );
          } else {
            return context.read<CartCubit>().carts.cartList!.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20.0,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) => CartItem(
                              cart: cartCubit.carts.cartList![index],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 15.0,
                            ),
                            itemCount: cartCubit.carts.cartList!.length,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Total: \$${cartCubit.totalPrice().toInt()}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 5.0,
                              ),
                              child: MaterialButton(
                                highlightElevation: 0.0,
                                onPressed: () {
                                  context.pushNamed(AppRoutes().checkout);
                                },
                                color: Colors.blue,
                                height:
                                    MediaQuery.of(context).size.height * .08,
                                minWidth:
                                    MediaQuery.of(context).size.width * .5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: const Text(
                                  "CHECKOUT",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                      "Your cart is empty right now!",
                      style: TextStyle(
                        fontSize: 40.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
          }
        },
      ),
      fallback: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            "You have to signin to have a cart!",
            style: TextStyle(
              fontSize: 35.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

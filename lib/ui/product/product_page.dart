import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/utils.dart';
import 'package:techcart/ui/cart/cubit/cart_cubit.dart';
import 'package:techcart/ui/product/cubit/product_cubit.dart';
import 'package:techcart/ui/product/widgets/option_toggle_button.dart';
import 'package:techcart/ui/product/widgets/reviews_item.dart';
import '../../shared/constants.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.product,
  });

  final ProductDataModel product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  double userRating = 3;
  late int productQuantity;
  late final CartCubit cartCubit;

  @override
  void initState() {
    super.initState();
    cartCubit = context.read<CartCubit>();
    if (AppConstants.appContants.token != 'null') {
      productQuantity = cartCubit.isInCart(productID: widget.product.id!)
          ? cartCubit.carts.cartList!
              .firstWhere(
                (element) => element.product!.id == widget.product.id,
              )
              .quantity!
          : 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ramOptions = widget.product.ram!.split(',');
    final capacityOptions = widget.product.capacity!.split(',');

    return BlocProvider(
      create: (context) => ProductCubit(context.read<TechcartRepository>())
        ..getProductReviews(productId: widget.product.id!),
      child: Builder(builder: (context) {
        final productCubit = context.read<ProductCubit>();
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              leading: MaterialButton(
                onPressed: () async {
                  context.pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                ),
              ),
              title: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                  right: 50.0,
                ),
                child: AutoSizeText(
                  widget.product.name!,
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontSize: 45.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$${widget.product.price!}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 34.0.sp,
                        ),
                      ),
                      SizedBox(
                        width: 38.0.w,
                      ),
                      BlocBuilder<ProductCubit, ProductState>(
                        buildWhen: (_, current) =>
                            current is GetReviewsLoading ||
                            current is GetReviewsError ||
                            current is GetReviewsSuccess,
                        builder: (context, state) {
                          if (state is GetReviewsLoading) {
                            return Center(
                              child: SizedBox(
                                  height: 47.0.w,
                                  width: 47.0.w,
                                  child: const CircularProgressIndicator()),
                            );
                          } else if (state is GetReviewsError) {
                            showToast(
                                text: state.errorMessage,
                                state: ToastStates.error);
                            return const SizedBox.shrink();
                          } else if (productCubit.reviews.reviews.isNotEmpty) {
                            return Container(
                              padding: const EdgeInsets.only(right: 3),
                              width: 97.0.w,
                              height: 50.0.w,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 64, 30, 214),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 28.0.sp,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      context
                                          .read<ProductCubit>()
                                          .avgRating(productCubit.reviews)
                                          .toStringAsFixed(2),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.0.w,
                  ),
                  widget.product.photo == null
                      ? SizedBox(
                          height: 400.0.w,
                          child: const Center(
                            child: Text("No image",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                          ),
                        )
                      : Image(
                          image:
                              CachedNetworkImageProvider(widget.product.photo!),
                          height: 400.0.w,
                        ),
                  SizedBox(
                    height: 28.0.w,
                  ),
                  TabBar(
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.blue,
                    labelPadding: EdgeInsets.zero,
                    tabs: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Product",
                          style: TextStyle(
                            fontSize: 47.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Details",
                        style: TextStyle(
                          fontSize: 48.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: double.infinity,
                        child: Text(
                          "Reviews",
                          style: TextStyle(
                            fontSize: 48.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0.w,
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      Column(children: [
                        SizedBox(
                          height: 10.0.w,
                        ),
                        //REVIEW - refactor conditional builder i felt its shity code lol
                        ConditionalBuilder(
                          condition: widget.product.ram == null &&
                              widget.product.capacity == null,
                          builder: (context) => Expanded(
                            child: Center(
                              child: Text(
                                "No Selectable Options for this product",
                                style: TextStyle(fontSize: 38.0.sp),
                              ),
                            ),
                          ),
                          fallback: (context) => Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "Select RAM:",
                                  style: TextStyle(
                                    fontSize: 47.0.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 38.0.w,
                              ),
                              BlocBuilder<ProductCubit, ProductState>(
                                buildWhen: (previous, current) =>
                                    current is RamSelectionToggle,
                                builder: (context, state) {
                                  return SizedBox(
                                    width: double.maxFinite,
                                    height: 115.0.w,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          OptionToggleButton(
                                              optionSelection: productCubit
                                                  .ramSelectionList[index],
                                              optionSize: ramOptions[index],
                                              onPressed: (value) {
                                                productCubit
                                                    .ramSelecionToggle(index);
                                              }),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        width: 38.0.w,
                                      ),
                                      itemCount: ramOptions.length,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 38.0.w,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "Select Capacity:",
                                  style: TextStyle(
                                    fontSize: 47.0.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 38.0.w,
                              ),
                              BlocBuilder<ProductCubit, ProductState>(
                                buildWhen: (previous, current) =>
                                    current is CapacitySelectionToggle,
                                builder: (context, state) {
                                  return SizedBox(
                                    width: double.maxFinite,
                                    height: 115.0.w,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          OptionToggleButton(
                                        optionSelection: productCubit
                                            .capacitySelectionList[index],
                                        optionSize: capacityOptions[index],
                                        onPressed: (value) {
                                          productCubit
                                              .capacitySelecionToggle(index);
                                        },
                                      ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        width: 38.0.w,
                                      ),
                                      itemCount: capacityOptions.length,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ]),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            right: 10.0,
                            left: 10.0,
                          ),
                          child: Text(
                            widget.product.details!,
                            style: TextStyle(
                              wordSpacing: 3,
                              fontWeight: FontWeight.w600,
                              fontSize: 32.0.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 697.0.w,
                        child: Column(
                          children: [
                            BlocBuilder<ProductCubit, ProductState>(
                              buildWhen: (_, current) =>
                                  current is GetReviewsLoading ||
                                  current is GetReviewsError ||
                                  current is GetReviewsSuccess,
                              builder: (context, state) {
                                if (state is GetReviewsLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is GetReviewsError) {
                                  return Center(
                                    child: OutlinedButton(
                                      onPressed: () {
                                        context
                                            .read<ProductCubit>()
                                            .getProductReviews(
                                                productId: widget.product.id!);
                                      },
                                      child: const Text('Retry'),
                                    ),
                                  );
                                } else {
                                  return ConditionalBuilder(
                                    condition:
                                        productCubit.reviews.reviews.isNotEmpty,
                                    builder: (context) => Expanded(
                                      child: ListView.builder(
                                        itemBuilder: ((context, index) =>
                                            ReviewsItem(
                                              model: productCubit
                                                  .reviews.reviews[index],
                                            )),
                                        itemCount:
                                            productCubit.reviews.reviews.length,
                                        physics: const BouncingScrollPhysics(),
                                      ),
                                    ),
                                    fallback: (context) => Expanded(
                                      child: Center(
                                        child: Text(
                                          'This product has no reviews yet!!!',
                                          style: TextStyle(
                                            fontSize: 38.0.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            Visibility(
                              visible: AppConstants.appContants.token != 'null',
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Add Review",
                                    style: TextStyle(
                                      fontSize: 42.0.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  RatingBar(
                                      minRating: 1,
                                      maxRating: 5,
                                      initialRating: 3,
                                      itemSize: 25,
                                      itemPadding: const EdgeInsets.only(
                                        right: 1.5,
                                        left: 1.5,
                                      ),
                                      ratingWidget: RatingWidget(
                                        empty: const Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                        ),
                                        half: const Icon(
                                          Icons.star_half,
                                          color:
                                              Color.fromARGB(255, 235, 88, 78),
                                        ),
                                        full: const Icon(
                                          Icons.star,
                                          color:
                                              Color.fromARGB(255, 240, 105, 96),
                                        ),
                                      ),
                                      onRatingUpdate: (value) {
                                        userRating = value;
                                      }),
                                  Expanded(
                                    child: TextButton(
                                        onPressed: AppConstants
                                                    .appContants.token ==
                                                "null"
                                            ? null
                                            : () async {
                                                await productCubit
                                                    .addProductReview(
                                                  productId: widget.product.id!,
                                                  rating: userRating,
                                                );
                                                productCubit.getProductReviews(
                                                    productId:
                                                        widget.product.id!);
                                              },
                                        child: FittedBox(
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                              fontSize: 38.0.sp,
                                            ),
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  ConditionalBuilder(
                    condition: AppConstants.appContants.token != "null",
                    builder: (context) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<CartCubit, CartState>(
                          buildWhen: (_, current) =>
                              current is GetCartLoading ||
                              current is GetCartSuccess ||
                              current is AddToCartLocalSuccess ||
                              current is UpdateCartLocalSuccess ||
                              current is ModifyingCartError,
                          builder: (context, state) {
                            if (state is GetCartLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 68.0.w,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[400],
                                      borderRadius:
                                          const BorderRadiusDirectional.only(
                                        bottomStart: Radius.circular(10),
                                        topStart: Radius.circular(10),
                                      ),
                                    ),
                                    child: MaterialButton(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.only(
                                          bottomStart: Radius.circular(10),
                                          topStart: Radius.circular(10),
                                        ),
                                      ),
                                      onPressed: cartCubit.isInCart(
                                              productID: widget.product.id!)
                                          ? () async {
                                              if (productQuantity == 1) {
                                                return;
                                              }

                                              productQuantity--;

                                              cartCubit.updateCart(
                                                productId: widget.product.id!,
                                                qunatity: productQuantity,
                                              );
                                            }
                                          : () {
                                              showToast(
                                                  text:
                                                      'Add product to cart to change quantity!!!',
                                                  state: ToastStates.warning);
                                            },
                                      padding:
                                          const EdgeInsets.only(bottom: 18),
                                      child: Icon(
                                        color: Colors.white,
                                        Icons.minimize,
                                        size: 57.0.sp,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.blue[100],
                                    height: 92.0.w,
                                    width: 57.0.w,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "$productQuantity",
                                      style: TextStyle(
                                        fontSize: 37.0.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 56, 55, 55),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 68.0.w,
                                    child: MaterialButton(
                                      elevation: 0.0,
                                      highlightElevation: 0.0,
                                      color: Colors.blue[400],
                                      padding: EdgeInsets.zero,
                                      height: 92.0.w,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.only(
                                          bottomEnd: Radius.circular(10),
                                          topEnd: Radius.circular(10),
                                        ),
                                      ),
                                      onPressed: cartCubit.isInCart(
                                              productID: widget.product.id!)
                                          ? () async {
                                              if (productQuantity == 99) {
                                                return;
                                              }
                                              productQuantity++;

                                              cartCubit.updateCart(
                                                  productId: widget.product.id!,
                                                  qunatity: productQuantity);
                                            }
                                          : () {
                                              showToast(
                                                  text:
                                                      'Add product to cart to change quantity!!!',
                                                  state: ToastStates.warning);
                                            },
                                      child: Icon(
                                        color: Colors.white,
                                        Icons.add,
                                        size: 58.0.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                        BlocBuilder<CartCubit, CartState>(
                          buildWhen: (_, current) =>
                              current is GetCartLoading ||
                              current is GetCartSuccess ||
                              current is AddToCartLocalSuccess ||
                              current is ModifyingCartError,
                          builder: (context, state) {
                            if (state is GetCartLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: MaterialButton(
                                  highlightElevation: 0.0,
                                  disabledColor: cartCubit.isInCart(
                                          productID: widget.product.id!)
                                      ? Colors.green
                                      : Colors.grey,
                                  onPressed: productQuantity == 0 ||
                                          cartCubit.isInCart(
                                              productID: widget.product.id!)
                                      ? null
                                      : () async {
                                          cartCubit.addToCart(
                                            product: widget.product,
                                            quantity: productQuantity,
                                          );
                                        },
                                  color: Colors.blue,
                                  height: 105.0.w,
                                  minWidth: 350.0.w,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: cartCubit.isInCart(
                                          productID: widget.product.id!)
                                      ? Text(
                                          "ADDED TO CART",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 38.0.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      : Text(
                                          "ADD TO CART",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 38.0.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    fallback: (context) => const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

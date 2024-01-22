import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:techcart/repository/models/cart_model.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/constants.dart';
import 'package:techcart/shared/utils.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._techcartRepository) : super(CartInitial());

  final TechcartRepository _techcartRepository;

  late CartModel carts;

  void getCart() async {
    if (AppConstants.appContants.token == 'null') return;
    emit(GetCartLoading());
    try {
      carts = await _techcartRepository.getCart();
      emit(GetCartSuccess());
    } catch (e) {
      emit(GetCartError(e.toString()));
    }
  }

  void addToCart(
      {required int quantity, required ProductDataModel product}) async {
    carts.cartList!.add(CartDataModel(quantity: quantity, product: product));
    emit(AddToCartLocalSuccess());
    try {
      final cartId = await _techcartRepository.addToCart(
          productId: product.id!, productQuantity: quantity);

      carts.cartList!.last.id = cartId;
    } catch (e) {
      showToast(text: e.toString(), state: ToastStates.error);
      carts.cartList!.removeLast();
      emit(ModifyingCartError());
    }
  }

  void updateCart({required int productId, required int qunatity}) async {
    final cart = carts.cartList!
        .firstWhere((element) => element.product!.id == productId);
    final oldQuantity = cart.quantity;
    cart.quantity = qunatity;
    emit(UpdateCartLocalSuccess());
    try {
      await _techcartRepository.updateCart(
          cartId: cart.id!, quantity: qunatity);
    } catch (e) {
      showToast(text: e.toString(), state: ToastStates.error);
      cart.quantity = oldQuantity;
      emit(ModifyingCartError());
    }
  }

  void deleteFromCart({required int cartId}) async {
    final cart = carts.cartList!.firstWhere((element) => element.id == cartId);
    carts.cartList!.remove(cart);
    emit(DeleteFromCartLocalSuccess());

    try {
      await _techcartRepository.deleteFromCart(cartId: cartId);
    } catch (e) {
      showToast(text: e.toString(), state: ToastStates.error);
      carts.cartList!.add(cart);
      emit(ModifyingCartError());
    }
  }

  double totalPrice() {
    double total = 0;
    for (var element in carts.cartList!) {
      total = element.quantity! * element.product!.price! + total;
    }
    return total;
  }

  bool isInCart({required int productID}) {
    return carts.cartList!.any(
      (element) => element.product!.id == productID,
    );
  }

  int getProductQuantity({required int productID}) {
    if (isInCart(productID: productID)) {
      return carts.cartList!
          .firstWhere((element) => element.product!.id == productID)
          .quantity!;
    } else {
      return 0;
    }
  }

  List<int?> getCartIds() {
    return carts.cartList!.map((e) => e.id).toList();
  }

  Future<void> deleteCartWhileCheckouting() async {
    try {
      final cartIds = getCartIds();
      for (int? cartId in cartIds) {
        await _techcartRepository.deleteCartWhileCheckouting(cartId: cartId!);
      }
      carts.cartList!.clear();
    } catch (e) {
      showToast(text: e.toString(), state: ToastStates.error);
    }
  }
}

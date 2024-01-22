part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartLoading extends CartState {}

final class GetCartSuccess extends CartState {}

final class GetCartError extends CartState {
  final String errorMessage;

  GetCartError(this.errorMessage);
}

final class AddToCartLocalSuccess extends CartState {}

final class UpdateCartLocalSuccess extends CartState {}

final class DeleteFromCartLocalSuccess extends CartState {}

final class ModifyingCartError extends CartState {}

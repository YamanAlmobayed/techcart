part of 'checkout_cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class ChangeStepperIndex extends CheckoutState {}

final class ChangeDeliveryMethod extends CheckoutState {}

final class PlaceOrdersLoading extends CheckoutState {}

final class PlaceOrdersSuccess extends CheckoutState {}

final class PlaceOrdersError extends CheckoutState {}

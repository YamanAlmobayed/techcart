part of 'orders_cubit.dart';

sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class GetUserOrdersLoading extends OrdersState {}

final class GetUserOrdersSuccess extends OrdersState {
  final OrdersModel orders;

  GetUserOrdersSuccess(this.orders);
}

final class GetUserOrdersError extends OrdersState {
  final String errorMessage;

  GetUserOrdersError(this.errorMessage);
}

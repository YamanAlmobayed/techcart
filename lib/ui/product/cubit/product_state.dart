part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetReviewsLoading extends ProductState {}

final class GetReviewsSuccess extends ProductState {}

final class GetReviewsError extends ProductState {
  final String errorMessage;

  GetReviewsError(this.errorMessage);
}

final class AddReviewLoading extends ProductState {}

final class AddReviewSuccess extends ProductState {}

final class AddReviewError extends ProductState {
  final String errorMessage;

  AddReviewError(this.errorMessage);
}

final class RamSelectionToggle extends ProductState {}

final class CapacitySelectionToggle extends ProductState {}

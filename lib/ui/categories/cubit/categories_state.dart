part of 'categories_cubit.dart';

sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class GetCategoriesLoading extends CategoriesState {}

final class GetCategoriesSuccess extends CategoriesState {
  final CategoriesModel categories;

  GetCategoriesSuccess(this.categories);
}

final class GetCategoriesError extends CategoriesState {
  final String errorMessage;

  GetCategoriesError(this.errorMessage);
}

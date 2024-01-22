part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class GetFavoriteLoading extends FavoriteState {}

final class GetFavoriteSuccess extends FavoriteState {}

final class GetFavoriteError extends FavoriteState {
  final String errorMessage;

  GetFavoriteError(this.errorMessage);
}

final class AddFavoriteLocalSuccess extends FavoriteState {}

final class AddFavoriteError extends FavoriteState {
  final String errorMessage;

  AddFavoriteError(this.errorMessage);
}

final class DeleteFavoriteLocalSuccess extends FavoriteState {}

final class DeleteFavoriteError extends FavoriteState {
  final String errorMessage;

  DeleteFavoriteError(this.errorMessage);
}

final class ModifyingFavoriteError extends FavoriteState {}

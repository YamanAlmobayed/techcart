part of 'popularity_cubit.dart';

sealed class PopularityState {}

final class PopularityInitial extends PopularityState {}

final class GetPopularityRecommendationLoading extends PopularityState {}

final class GetPopularityRecommendationSuccess extends PopularityState {
  final ProductModel populartiyRecommendation;

  GetPopularityRecommendationSuccess(this.populartiyRecommendation);
}

final class GetPopularityRecommendationError extends PopularityState {
  final String errorMessage;

  GetPopularityRecommendationError(this.errorMessage);
}

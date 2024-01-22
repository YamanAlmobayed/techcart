part of 'collaborative_cubit.dart';

sealed class CollaborativeState {}

final class CollaborativeInitial extends CollaborativeState {}

final class GetCollaborativeRecommendationLoading extends CollaborativeState {}

final class GetCollaborativeRecommendationSuccess extends CollaborativeState {
  final ProductModel collaborativeRecommendation;

  GetCollaborativeRecommendationSuccess(this.collaborativeRecommendation);
}

final class GetCollaborativeRecommendationError extends CollaborativeState {
  final String errorMessage;

  GetCollaborativeRecommendationError(this.errorMessage);
}

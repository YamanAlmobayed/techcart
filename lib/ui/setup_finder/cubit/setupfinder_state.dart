part of 'setupfinder_cubit.dart';

sealed class SetupfinderState {}

final class SetupfinderInitial extends SetupfinderState {}

final class GetQuestionLoading extends SetupfinderState {}

final class GetQuestionSuccess extends SetupfinderState {}

final class SetupfinderError extends SetupfinderState {}

final class GetOutputSuccess extends SetupfinderState {
  final SetupfinderOutputModel output;

  GetOutputSuccess(this.output);
}

final class ChangeAnswerState extends SetupfinderState {}

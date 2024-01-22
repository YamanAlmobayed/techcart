part of 'password_reset_cubit.dart';

sealed class PasswordResetState {}

final class PasswordResetInitial extends PasswordResetState {}

final class PasswordResetLoadingState extends PasswordResetState {}

final class PasswordResetSuccessState extends PasswordResetState {}

final class PasswordResetErrorState extends PasswordResetState {
  final String errorMessage;

  PasswordResetErrorState(this.errorMessage);
}

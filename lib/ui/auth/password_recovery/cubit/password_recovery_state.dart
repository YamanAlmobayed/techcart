part of 'password_recovery_cubit.dart';

sealed class PasswordRecoveryState {}

final class PasswordRecoveryInitial extends PasswordRecoveryState {}

final class GetVerificationCodeLoadingState extends PasswordRecoveryState {}

final class GetVerificationCodeSuccessState extends PasswordRecoveryState {
  final PasswordResetVerificationModel userResetInfo;

  GetVerificationCodeSuccessState(this.userResetInfo);
}

final class GetVerificationCodeErrorState extends PasswordRecoveryState {
  final String errorMessage;

  GetVerificationCodeErrorState(this.errorMessage);
}

part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileLoading extends ProfileState {}

final class GetProfileSuccess extends ProfileState {}

final class GetProfileError extends ProfileState {
  final String errorMessage;

  GetProfileError(this.errorMessage);
}

final class PickProfileImage extends ProfileState {}

final class EditProfileDatePickerStatusBarSwitchColor extends ProfileState {}

final class EditMyProfileLoading extends ProfileState {}

final class EditMyProfileSuccess extends ProfileState {}

final class EditMyProfileError extends ProfileState {}

final class LogoutState extends ProfileState {}

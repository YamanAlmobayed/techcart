// ignore_for_file: public_member_api_docs, sort_constructors_first
class PasswordResetVerificationModel {
  int code;
  String email;

  PasswordResetVerificationModel({
    required this.email,
    required this.code,
  });
}

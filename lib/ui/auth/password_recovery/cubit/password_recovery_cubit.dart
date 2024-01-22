import 'package:bloc/bloc.dart';
import 'package:techcart/repository/models/password_reset_verification_model.dart';
import 'package:techcart/repository/techcart_repository.dart';

part 'password_recovery_state.dart';

class PasswordRecoveryCubit extends Cubit<PasswordRecoveryState> {
  PasswordRecoveryCubit(this._techcartRepository)
      : super(PasswordRecoveryInitial());

  final TechcartRepository _techcartRepository;

  void getVerificationCode(
    context, {
    required email,
  }) async {
    emit(GetVerificationCodeLoadingState());
    try {
      final userResetInfo = await _techcartRepository
          .getPasswordResetVerificationCode(email: email);
      emit(GetVerificationCodeSuccessState(userResetInfo));
    } catch (e) {
      emit(GetVerificationCodeErrorState(e.toString()));
    }
  }
}

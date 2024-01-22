import 'package:bloc/bloc.dart';
import 'package:techcart/repository/techcart_repository.dart';

part 'password_reset_state.dart';

class PasswordResetCubit extends Cubit<PasswordResetState> {
  PasswordResetCubit(this._techcartRepository) : super(PasswordResetInitial());
  final TechcartRepository _techcartRepository;

  void userPasswordReset({
    required String email,
    required String password,
  }) async {
    emit(PasswordResetLoadingState());
    try {
      _techcartRepository.passwordReset(
        email: email,
        password: password,
      );
      emit(PasswordResetSuccessState());
    } catch (e) {
      emit(PasswordResetErrorState(e.toString()));
    }
  }
}

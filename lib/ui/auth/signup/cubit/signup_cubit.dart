import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:techcart/repository/techcart_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._techcartRepository) : super(SignupInitial());

  final TechcartRepository _techcartRepository;

  void userSignup({
    required username,
    required email,
    required birthDate,
    required password,
  }) async {
    emit(SignupLoadingState());
    try {
      await _techcartRepository.userSignup(
          username: username,
          email: email,
          birthDate: birthDate,
          password: password);
      emit(SignupSuccessState());
    } catch (e) {
      emit(SignupErrorState(e.toString()));
    }
  }
}

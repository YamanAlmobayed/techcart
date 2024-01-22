import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/cache_helper.dart';
import 'package:techcart/shared/constants.dart';
import 'package:techcart/ui/cart/cubit/cart_cubit.dart';
import 'package:techcart/ui/favortie/cubit/favorite_cubit.dart';
import 'package:techcart/ui/home/cubit/collaborative_cubit/collaborative_cubit.dart';
import 'package:techcart/ui/index/cubit/index_cubit.dart';
import 'package:techcart/ui/profile/cubit/profile_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._techcartRepository) : super(LoginInitial());

  final TechcartRepository _techcartRepository;

  void userLogin({
    required String email,
    required String password,
    required IndexCubit indexCubit,
    required CollaborativeCubit collaborativeCubit,
    required ProfileCubit profileCubit,
    required FavoriteCubit favoriteCubit,
    required CartCubit cartCubit,
  }) async {
    emit(LoginLoadingState());
    try {
      final user =
          await _techcartRepository.userLogin(email: email, password: password);
      AppConstants.appContants.profileEmail = user.email!;
      AppConstants.appContants.profileName = user.name!;
      AppConstants.appContants.token = user.token!;
      AppConstants.appContants.userId = user.userId;
      AppConstants.appContants.profileBirthdate = user.dateOfBirth.toString();
      CacheHelper.saveData(key: "token", value: user.token);
      CacheHelper.saveData(key: "userId", value: user.userId);
      CacheHelper.saveData(key: "profileEmail", value: user.email);
      CacheHelper.saveData(key: "profileName", value: user.name);
      CacheHelper.saveData(
          key: "profileBirthdate", value: user.dateOfBirth.toString());
      indexCubit.bottomNavBarReturnToHome();
      collaborativeCubit.getCollaborativeRecommendation(userId: user.userId!);
      profileCubit.getUserProfile(userId: user.userId!);
      favoriteCubit.getMyFavorite();
      cartCubit.getCart();
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}

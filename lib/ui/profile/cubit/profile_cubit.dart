import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/cache_helper.dart';
import 'package:techcart/shared/constants.dart';
import 'package:techcart/shared/utils.dart';
import 'package:techcart/ui/cart/cubit/cart_cubit.dart';
import 'package:techcart/ui/favortie/cubit/favorite_cubit.dart';
import 'package:techcart/ui/index/cubit/index_cubit.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._techcartRepository) : super(ProfileInitial());

  final TechcartRepository _techcartRepository;

  Future<void> getUserProfile({required int? userId}) async {
    if (userId == null || AppConstants.appContants.token == 'null') return;

    emit(GetProfileLoading());
    try {
      final user = await _techcartRepository.getUserProfile(id: userId);
      AppConstants.appContants.pickedProfileImage = null;
      AppConstants.appContants.profilePhoto = user.photo;
      AppConstants.appContants.profileName = user.name!;
      AppConstants.appContants.profileEmail = user.email!;

      if (user.photo != null) {
        CacheHelper.saveData(key: "profilePhoto", value: user.photo);
      }
      emit(GetProfileSuccess());
    } catch (e) {
      showToast(text: e.toString(), state: ToastStates.error);
      emit(GetProfileError(e.toString()));
    }
  }

  void logout({
    required IndexCubit indexCubit,
    required FavoriteCubit favoriteCubit,
    required CartCubit cartCubit,
  }) {
    AppConstants.appContants.token = "null";
    CacheHelper.saveData(key: "token", value: "null");
    CacheHelper.saveData(key: "profilePhoto", value: "null");
    indexCubit.bottomNavBarReturnToHome();
    favoriteCubit.favoriteLocal = [];
    cartCubit.carts.cartList = [];

    emit(LogoutState());
  }

  Future<void> getProfileImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      AppConstants.appContants.pickedProfileImage = File(pickedFile.path);
      emit(PickProfileImage());
    }
  }

  Color color = Colors.white;

  void editProfileDatePickerStatusBarSwitchColor(bool isGrey) {
    if (isGrey) {
      color = Colors.grey[600]!;
      emit(EditProfileDatePickerStatusBarSwitchColor());
    } else {
      color = Colors.white;
      emit(EditProfileDatePickerStatusBarSwitchColor());
    }
  }

  //REVIEW - Try to refactor this 💩💩💩
  void editMyProfile({
    String? username,
    String? birthdate,
    dynamic photo,
  }) async {
    emit(EditMyProfileLoading());
    FormData formData;
    if (photo.runtimeType == String || photo.runtimeType == Null) {
      formData = FormData.fromMap({
        "name": username,
        "date_of_birth": birthdate,
      });
    } else {
      String fileName = photo.path.split('/').last;
      formData = FormData.fromMap({
        "photo": await MultipartFile.fromFile(photo.path, filename: fileName),
        "name": username,
        "date_of_birth": birthdate,
      });
    }
    try {
      final updatedProfileImage =
          await _techcartRepository.editMyProfile(formData: formData);
      AppConstants.appContants.profileName = username!;
      AppConstants.appContants.profileBirthdate = birthdate!;
      AppConstants.appContants.profilePhoto = updatedProfileImage;
      if (updatedProfileImage.runtimeType != String &&
          updatedProfileImage.runtimeType != Null) {
        CacheHelper.saveData(key: "profilePhoto", value: updatedProfileImage);
      }
      showToast(
          text: "Profile updated successfully", state: ToastStates.success);
      emit(EditMyProfileSuccess());
    } catch (e) {
      showToast(text: e.toString(), state: ToastStates.error);
      emit(EditMyProfileError());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:techcart/shared/gen/assets.gen.dart';
import 'package:techcart/ui/cart/cart_page.dart';
import 'package:techcart/ui/favortie/favorite_page.dart';
import 'package:techcart/ui/home/home_page.dart';
import 'package:techcart/ui/profile/profile_page.dart';

part 'index_state.dart';

class IndexCubit extends Cubit<IndexState> {
  IndexCubit() : super(IndexInitial());

  int currentIndex = 0;

  void bottomNavBarReturnToHome() {
    currentIndex = 0;
    emit(ResetBottomNavBarIndex());
  }

  void bottomNavBarChangeIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarIndex());
  }

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_border_outlined,
      ),
      label: "Favorite",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_cart_outlined,
      ),
      label: "Cart",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline,
      ),
      label: "Profile",
    ),
  ];

  List<Widget> screens = [
    const HomePage(),
    const FavoritePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  final List<String> imgList = [
    const $AssetsImagesGen().slider1.path,
    const $AssetsImagesGen().slider2.path,
    const $AssetsImagesGen().slider3.path,
    const $AssetsImagesGen().slider4.path,
  ];
}

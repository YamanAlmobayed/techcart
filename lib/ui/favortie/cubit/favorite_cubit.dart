import 'package:bloc/bloc.dart';
import 'package:techcart/repository/models/favorite_model.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/constants.dart';
import 'package:techcart/shared/utils.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this._techcartRepository) : super(FavoriteInitial());

  final TechcartRepository _techcartRepository;

  List<ProductDataModel> favoriteLocal = [];

  late FavoriteModel favoriteDB;

  Future<void> getMyFavorite() async {
    if (AppConstants.appContants.token == 'null') return;

    emit(GetFavoriteLoading());
    try {
      favoriteDB = await _techcartRepository.getFavorite();

      if (favoriteDB.favorites.isNotEmpty) {
        favoriteLocal =
            favoriteDB.favorites.map((e) => e.products![0]).toList();
      }
      emit(GetFavoriteSuccess());
    } catch (e) {
      emit(GetFavoriteError(e.toString()));
    }
  }

  void userAddFavorite({required ProductDataModel product}) async {
    if (favoriteLocal.contains(product)) return;
    favoriteLocal.add(product);
    emit(AddFavoriteLocalSuccess());
    try {
      final newFav =
          await _techcartRepository.addFavorite(productID: [product.id!]);

      favoriteDB.favorites.add(newFav);
    } catch (e) {
      favoriteLocal.remove(product);
      showToast(text: e.toString(), state: ToastStates.error);
      emit(ModifyingFavoriteError());
    }
  }

  void userDeleteFavorite({required ProductDataModel product}) async {
    favoriteLocal.remove(product);
    emit(DeleteFavoriteLocalSuccess());

    final favDbId = favoriteDB.favorites
        .firstWhere((e) => e.products![0].id == product.id)
        .id;
    try {
      await _techcartRepository.deleteFavorite(favDbID: favDbId!);

      favoriteDB.favorites.removeWhere((e) => e.id == favDbId);
    } catch (e) {
      favoriteLocal.add(product);
      showToast(text: e.toString(), state: ToastStates.error);
      emit(ModifyingFavoriteError());
    }
  }

  bool isLiked({required int productId}) {
    return favoriteLocal.any((e) => e.id == productId);
  }
}

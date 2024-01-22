import 'package:bloc/bloc.dart';
import 'package:techcart/repository/models/categories_model.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/repository/techcart_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._techcartRepository) : super(CategoriesInitial());
  final TechcartRepository _techcartRepository;

  late CategoriesModel categories;

  void getCategories() async {
    emit(GetCategoriesLoading());
    try {
      categories = await _techcartRepository.getCategories();
      emit(GetCategoriesSuccess(categories));
    } catch (e) {
      emit(GetCategoriesError(e.toString()));
    }
  }

  List<ProductDataModel> getCategoryProducts({required String categoryName}) {
    return categories.categoriesList!
        .firstWhere((element) => element.name == categoryName)
        .products!;
  }
}

import 'package:bloc/bloc.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/repository/techcart_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._techcartRepository) : super(SearchInitial());
  final TechcartRepository _techcartRepository;

  void searchProduct({
    required String query,
  }) async {
    emit(SearchLoading());
    try {
      final searchProducts =
          await _techcartRepository.searchProduct(query: query);
      emit(SearchSuccess(searchProducts));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}

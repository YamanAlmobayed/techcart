import 'package:bloc/bloc.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/repository/techcart_repository.dart';

part 'popularity_state.dart';

class PopularityCubit extends Cubit<PopularityState> {
  PopularityCubit(this._techcartRepository) : super(PopularityInitial());
  final TechcartRepository _techcartRepository;

  void getPopularityRecommendation() async {
    emit(GetPopularityRecommendationLoading());
    try {
      final populartiyRecommendation =
          await _techcartRepository.getPopularityRecommendation();

      emit(GetPopularityRecommendationSuccess(populartiyRecommendation));
    } catch (e) {
      emit(GetPopularityRecommendationError(e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/constants.dart';

part 'collaborative_state.dart';

class CollaborativeCubit extends Cubit<CollaborativeState> {
  CollaborativeCubit(this._techcartRepository) : super(CollaborativeInitial());
  final TechcartRepository _techcartRepository;

  void getCollaborativeRecommendation({required int? userId}) async {
    if (userId == null || AppConstants.appContants.token == 'null') return;
    emit(GetCollaborativeRecommendationLoading());
    try {
      final collaborativeRecommendation = await _techcartRepository
          .getCollaborativeRecommendation(userId: userId);
      emit(GetCollaborativeRecommendationSuccess(collaborativeRecommendation));
    } catch (e) {
      emit(GetCollaborativeRecommendationError(e.toString()));
    }
  }
}

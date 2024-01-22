import 'package:bloc/bloc.dart';
import 'package:techcart/repository/models/reviews_model.dart';
import 'package:techcart/repository/techcart_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._techcartRepository) : super(ProductInitial());
  final TechcartRepository _techcartRepository;

  late ReviewsModel reviews;

  void getProductReviews({required int productId}) async {
    emit(GetReviewsLoading());
    try {
      reviews =
          await _techcartRepository.getProductReviews(productId: productId);
      emit(GetReviewsSuccess());
    } catch (e) {
      emit(GetReviewsError(e.toString()));
    }
  }

  List<bool> ramSelectionList = [true, false, false, false];

  void ramSelecionToggle(int index) {
    for (int i = 0; i < ramSelectionList.length; i++) {
      if (i == index) {
        ramSelectionList[i] = true;
      } else {
        ramSelectionList[i] = false;
      }
    }
    emit(RamSelectionToggle());
  }

  List<bool> capacitySelectionList = [true, false, false, false];

  void capacitySelecionToggle(int index) {
    for (int i = 0; i < capacitySelectionList.length; i++) {
      if (i == index) {
        capacitySelectionList[i] = true;
      } else {
        capacitySelectionList[i] = false;
      }
      emit(CapacitySelectionToggle());
    }
  }

  double avgRating(ReviewsModel reviews) {
    int totalRating = 0;
    for (dynamic review in reviews.reviews) {
      totalRating += review.rating! as int;
    }
    double avgRating = totalRating / reviews.reviews.length;
    return avgRating;
  }

  Future<void> addProductReview(
      {required int productId, required double rating}) async {
    emit(AddReviewLoading());
    try {
      await _techcartRepository.addProductReview(
        productId: productId,
        rating: rating,
      );
      emit(AddReviewSuccess());
    } catch (e) {
      emit(AddReviewError(e.toString()));
    }
  }
}

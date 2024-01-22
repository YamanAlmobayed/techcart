import 'package:dio/dio.dart';
import 'package:techcart/repository/models/cart_model.dart';
import 'package:techcart/repository/models/categories_model.dart';
import 'package:techcart/repository/models/favorite_model.dart';
import 'package:techcart/repository/models/login_user_model.dart';
import 'package:techcart/repository/models/orders_model.dart';
import 'package:techcart/repository/models/password_reset_verification_model.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/repository/models/reviews_model.dart';
import 'package:techcart/repository/models/setupfinder_question_model.dart';
import 'package:techcart/repository/models/user_model.dart';
import 'package:techcart/repository/services/techcart_service.dart';

class TechcartRepository {
  final TechcartService _techcartService;

  TechcartRepository({required TechcartService techcartService})
      : _techcartService = techcartService;

  Future<LoginUserModel> userLogin({
    required String email,
    required String password,
  }) async =>
      _techcartService.userLogin(email: email, password: password);

  Future<void> userSignup({
    required username,
    required email,
    required birthDate,
    required password,
  }) async =>
      _techcartService.userSignup(
          username: username,
          email: email,
          birthDate: birthDate,
          password: password);

  Future<UserModel> getUserProfile({required int id}) async =>
      _techcartService.getUserProfile(id: id);

  Future<PasswordResetVerificationModel> getPasswordResetVerificationCode(
          {required String email}) async =>
      _techcartService.getPasswordResetVerficationCode(email: email);

  Future<void> passwordReset({
    required String email,
    required String password,
  }) async =>
      _techcartService.passwordReset(email: email, password: password);

  Future<ProductModel> getAllProducts() async =>
      _techcartService.getAllProduct();

  Future<ProductModel> searchProduct({
    required String query,
  }) async =>
      _techcartService.searchProduct(query: query);

  Future<int> addToCart({
    required int productId,
    required int productQuantity,
  }) async =>
      _techcartService.addToCart(
          productId: productId, productQuantity: productQuantity);

  Future<CartModel> getCart() async => _techcartService.getCart();

  Future<void> updateCart({
    required int cartId,
    required int quantity,
  }) async =>
      _techcartService.updateCart(cartId: cartId, quantity: quantity);

  Future<CategoriesModel> getCategories() async =>
      _techcartService.getCategories();

  Future<OrdersModel> getUserOrders() async => _techcartService.getUserOrders();

  Future<void> placeOrder({
    required String paymentMethod,
    required String address,
    required String deliveryMethod,
    required int totalPrice,
    required List<int?> carts,
  }) async =>
      _techcartService.placeOrder(
        paymentMethod: paymentMethod,
        address: address,
        deliveryMethod: deliveryMethod,
        totalPrice: totalPrice,
        carts: carts,
      );

  Future<void> deleteFromCart({required int cartId}) async =>
      _techcartService.deleteFromCart(cartId: cartId);

  Future<void> deleteCartWhileCheckouting({required int cartId}) async =>
      _techcartService.deleteCartWhileCheckouting(cartId: cartId);

  Future<ReviewsModel> getProductReviews({required int productId}) async =>
      _techcartService.getProductReviews(productId: productId);

  Future<ProductModel> getPopularityRecommendation() async =>
      _techcartService.getPopularityRecommendation();

  Future<ProductModel> getCollaborativeRecommendation({
    required int userId,
  }) async =>
      _techcartService.getCollaborativeRecommendation(userId: userId);

  Future<void> addProductReview({
    required int productId,
    required double rating,
  }) async =>
      _techcartService.addProductReview(productId: productId, rating: rating);

  Future<String?> editMyProfile({required FormData formData}) async =>
      _techcartService.editMyProfile(formData: formData);

  Future<FavoriteModel> getFavorite() async => _techcartService.getFavorite();

  Future<FavoriteDataModel> addFavorite({required List<int> productID}) async =>
      _techcartService.addFavorite(productID: productID);

  Future<void> deleteFavorite({required int favDbID}) async =>
      _techcartService.deleteFavorite(favDbID: favDbID);

  Future<SetupfinderQuestionModel> getSetupfinderInit() =>
      _techcartService.getSetupfinderInit();

//it post an answer and gets the next question
  Future<dynamic> addQuizAnsewr({required String answer}) async =>
      _techcartService.addQuizAnsewr(answer: answer);
}

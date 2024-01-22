import 'package:dio/dio.dart';
import 'package:techcart/repository/models/cart_model.dart';
import 'package:techcart/repository/models/categories_model.dart';
import 'package:techcart/repository/models/favorite_model.dart';
import 'package:techcart/repository/models/login_user_model.dart';
import 'package:techcart/repository/models/orders_model.dart';
import 'package:techcart/repository/models/password_reset_verification_model.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/repository/models/reviews_model.dart';
import 'package:techcart/repository/models/setupfinder_output_model.dart';
import 'package:techcart/repository/models/setupfinder_question_model.dart';
import 'package:techcart/repository/models/user_model.dart';
import 'package:techcart/shared/api_urls.dart';
import 'package:techcart/shared/constants.dart';

class TechcartService {
  final _dio = Dio(BaseOptions(
    // baseUrl: 'http://10.0.2.2:8000/techcart/',
    baseUrl: 'http://192.168.1.113:8000/techcart/',
    headers: {
      'lang': 'en',
    },
  ));

  Future<LoginUserModel> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      final body = {
        "username": email,
        "password": password,
      };
      final response = await _dio.post(
        APIUrls().loginEndpoint,
        data: body,
      );
      return LoginUserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error in login: $e');
    }
  }

  Future<void> userSignup({
    required username,
    required email,
    required birthDate,
    required password,
  }) async {
    try {
      final body = {
        "name": username,
        "email": email,
        "date_of_birth": birthDate,
        "password": password,
        "photo": null
      };

      await _dio.post(
        APIUrls().profileEndPoint,
        data: body,
      );
    } catch (e) {
      throw Exception('Error in signup: $e');
    }
  }

  Future<UserModel> getUserProfile({required int id}) async {
    try {
      final response = await _dio.get("${APIUrls().profileEndPoint}$id/",
          options: Options(headers: {
            'Authorization': 'Token ${AppConstants.appContants.token}',
          }));
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting user profile: $e');
    }
  }

  Future<PasswordResetVerificationModel> getPasswordResetVerficationCode(
      {required String email}) async {
    try {
      final body = {
        "email": email,
      };
      final response = await _dio.post(
        APIUrls().forgetEndPoint,
        data: body,
      );

      return PasswordResetVerificationModel(
        email: email,
        code: response.data['code'],
      );
    } catch (e) {
      throw Exception('Error sending verfication code: $e');
    }
  }

  Future<void> passwordReset({
    required String email,
    required String password,
  }) async {
    try {
      final queryParams = {"email": email};
      final body = {"new_password": password};
      await _dio.put(
        APIUrls().passwordResetEndPoint,
        queryParameters: queryParams,
        data: body,
      );
    } catch (e) {
      throw Exception('Error resetting password: $e');
    }
  }

  Future<ProductModel> getAllProduct() async {
    try {
      final response = await _dio.get(
        APIUrls().productsEndPoint,
      );

      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting all products: $e');
    }
  }

  Future<FavoriteModel> getFavorite() async {
    try {
      final response = await _dio.get(APIUrls().favoriteEndPoint,
          options: Options(headers: {
            'Authorization': 'Token ${AppConstants.appContants.token}',
          }));

      return FavoriteModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting favorite: $e');
    }
  }

  Future<FavoriteDataModel> addFavorite({required List<int> productID}) async {
    try {
      Response response = await _dio.post(
        APIUrls().favoriteEndPoint,
        options: Options(headers: {
          'Authorization': 'Token ${AppConstants.appContants.token}',
        }),
        data: {
          "user": AppConstants.appContants.userId,
          "products": productID,
        },
      );
      return FavoriteDataModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteFavorite({required int favDbID}) async {
    try {
      await _dio.delete('${APIUrls().favoriteEndPoint}$favDbID/',
          options: Options(headers: {
            'Authorization': 'Token ${AppConstants.appContants.token}',
          }));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ProductModel> searchProduct({
    required String query,
  }) async {
    try {
      final queryParams = {"search": query};

      final response = await _dio.get(
        APIUrls().searchEndPoint,
        queryParameters: queryParams,
      );
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error searching: $e');
    }
  }

  Future<int> addToCart({
    required int productId,
    required int productQuantity,
  }) async {
    try {
      final body = {
        "user": AppConstants.appContants.userId,
        "quantity": productQuantity,
        "product": productId,
      };
      final response = await _dio.post(
        APIUrls().addToCartEndPoint,
        options: Options(headers: {
          'Authorization': 'Token ${AppConstants.appContants.token}',
        }),
        data: body,
      );
      return response.data['id'];
    } catch (e) {
      throw Exception('Error adding to cart: $e');
    }
  }

  Future<CartModel> getCart() async {
    try {
      final response = await _dio.get(APIUrls().getCartEndPoint,
          options: Options(headers: {
            'Authorization': 'Token ${AppConstants.appContants.token}',
          }));
      return CartModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting Cart: $e');
    }
  }

  Future<void> updateCart({
    required int cartId,
    required int quantity,
  }) async {
    try {
      final body = FormData.fromMap(
        {
          "cart_id": cartId,
          "quantity": quantity,
        },
      );
      await _dio.post(APIUrls().updateCartEndPoint,
          data: body,
          options: Options(headers: {
            'Authorization': 'Token ${AppConstants.appContants.token}',
          }));
    } catch (e) {
      throw Exception('Error updating product quantity: $e');
    }
  }

  Future<CategoriesModel> getCategories() async {
    try {
      final response = await _dio.get(
        APIUrls().categoriesEndPoint,
      );
      return CategoriesModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting all categories: $e');
    }
  }

  Future<OrdersModel> getUserOrders() async {
    try {
      final response = await _dio.get(APIUrls().ordersEndPoint,
          options: Options(headers: {
            'Authorization': 'Token ${AppConstants.appContants.token}',
          }));
      return OrdersModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting user orders: $e');
    }
  }

  Future<void> placeOrder({
    required String paymentMethod,
    required String address,
    required String deliveryMethod,
    required int totalPrice,
    required List<int?> carts,
  }) async {
    try {
      final body = {
        "payment_method": paymentMethod,
        "address": address,
        "user": AppConstants.appContants.userId,
        "delivery_option": deliveryMethod,
        "cart": carts,
        "total_price": totalPrice,
      };

      await _dio.post(
        APIUrls().postOrdersEndPoint,
        options: Options(headers: {
          'Authorization': 'Token ${AppConstants.appContants.token}',
        }),
        data: body,
      );
    } catch (e) {
      throw Exception('Error placing order: $e');
    }
  }

  Future<void> deleteFromCart({required int cartId}) async {
    try {
      final body = FormData.fromMap({
        "cart_id": cartId,
      });
      await _dio.post(
        APIUrls().deleteFromCart,
        data: body,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token ${AppConstants.appContants.token}',
        }),
      );
    } catch (e) {
      throw Exception('Error removing product from cart: $e');
    }
  }

  Future<void> deleteCartWhileCheckouting({required int cartId}) async {
    try {
      final body = FormData.fromMap({
        'cart_id': cartId,
      });
      await _dio.post(
        APIUrls().deleteFromCartWhileCheckoutingEndPoint,
        options: Options(headers: {
          'Authorization': 'Token ${AppConstants.appContants.token}',
        }),
        data: body,
      );
    } catch (e) {
      throw Exception('Error deleting cart while checkouting: $e');
    }
  }

  Future<String?> editMyProfile({required FormData formData}) async {
    try {
      final response = await _dio.patch(
        "${APIUrls().profileEndPoint}${AppConstants.appContants.userId}/",
        options: Options(headers: {
          'Authorization': 'Token ${AppConstants.appContants.token}',
        }),
        data: formData,
      );
      return response.data['photo'];
    } catch (e) {
      throw Exception('Error editing my profile: $e');
    }
  }

  Future<ReviewsModel> getProductReviews({required int productId}) async {
    try {
      final queryParams = {"product": productId};
      final response = await _dio.get(
        APIUrls().getReviewEndPoint,
        queryParameters: queryParams,
      );
      return ReviewsModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting product reviews: $e');
    }
  }

  Future<ProductModel> getPopularityRecommendation() async {
    try {
      final queryParams = {"user": 1};
      final response = await _dio.get(
        APIUrls().popularityEndPoint,
        queryParameters: queryParams,
      );
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting popular product: $e');
    }
  }

  Future<ProductModel> getCollaborativeRecommendation({
    required int userId,
  }) async {
    try {
      final queryParams = {"user_id": userId};
      final response = await _dio.get(
        APIUrls().collaborativeEndPoint,
        queryParameters: queryParams,
      );
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting collaborative popular product: $e');
    }
  }

  Future<void> addProductReview({
    required int productId,
    required double rating,
  }) async {
    try {
      await _dio.post(APIUrls().postReviewEndPoint,
          data: {
            "user": AppConstants.appContants.userId,
            "product": productId,
            "rating": rating,
          },
          options: Options(headers: {
            'Authorization': 'Token ${AppConstants.appContants.token}',
          }));
    } catch (e) {
      throw Exception('Error adding product review: $e');
    }
  }

  Future<SetupfinderQuestionModel> getSetupfinderInit() async {
    try {
      final response = await _dio.get(
        APIUrls().setupfinderEndPoint,
      );

      return SetupfinderQuestionModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error adding product review: $e');
    }
  }

//it post an answer and gets the next question
  Future<dynamic> addQuizAnsewr({
    required String answer,
  }) async {
    try {
      final body = FormData.fromMap({
        'user_answer': answer,
      });
      final response = await _dio.post(
        APIUrls().setupfinderEndPoint,
        data: body,
      );
      if (response.data['is_output']) {
        return SetupfinderOutputModel.fromJson(response.data);
      } else {
        return SetupfinderQuestionModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception('Error adding product review: $e');
    }
  }
}

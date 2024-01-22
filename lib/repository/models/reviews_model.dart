import 'package:techcart/repository/models/user_model.dart';

class ReviewsModel {
  List<ReviewsDataModel> reviews = [];

  ReviewsModel(this.reviews);

  ReviewsModel.fromJson(List<dynamic> json) {
    for (var review in json) {
      reviews.add(ReviewsDataModel.fromJson(review));
    }
  }
}

class ReviewsDataModel {
  int? id;
  int? rating;
  UserModel? user;

  ReviewsDataModel({this.id, this.rating, this.user});

  ReviewsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
}

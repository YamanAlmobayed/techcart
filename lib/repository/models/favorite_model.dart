import 'package:techcart/repository/models/product_model.dart';

class FavoriteModel {
  final List<FavoriteDataModel> favorites = [];

  FavoriteModel.fromJson(List<dynamic> json) {
    for (var element in json) {
      favorites.add(FavoriteDataModel.fromJson(element));
    }
  }
}

class FavoriteDataModel {
  final int? id;
  final List<ProductDataModel>? products;

  FavoriteDataModel({
    this.id,
    this.products,
  });

  factory FavoriteDataModel.fromJson(Map<String, dynamic> json) =>
      FavoriteDataModel(
        id: json["id"],
        products: json["products"] == null
            ? []
            : List<ProductDataModel>.from(json["products"]!.map((x) {
                if (x.runtimeType == int) {
                  return ProductDataModel(id: x);
                }
                return ProductDataModel.fromJson(x);
              })),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

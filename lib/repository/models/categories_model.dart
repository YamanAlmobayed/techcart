import 'package:techcart/repository/models/product_model.dart';

class CategoriesModel {
  List<CategoriesDataModel>? categoriesList = [];

  CategoriesModel(this.categoriesList);

  CategoriesModel.fromJson(List<dynamic> json) {
    for (var categories in json) {
      categoriesList!.add(CategoriesDataModel.fromJson(categories));
    }
  }
}

class CategoriesDataModel {
  int? id;
  String? name;
  List<ProductDataModel>? products;

  CategoriesDataModel({this.id, this.name, this.products});

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['products'] != null) {
      products = <ProductDataModel>[];
      json['products'].forEach((v) {
        products!.add(ProductDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

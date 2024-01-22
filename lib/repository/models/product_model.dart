import 'package:equatable/equatable.dart';

class ProductModel {
  List<ProductDataModel>? products = [];
  ProductModel(this.products);

  ProductModel.fromJson(List<dynamic> json) {
    for (var product in json) {
      products!.add(ProductDataModel.fromJson(product));
    }
  }
}

// ignore: must_be_immutable
class ProductDataModel extends Equatable {
  int? id;
  String? name;
  String? catiegory;
  String? details;
  bool? isBestselling;
  String? photo;
  double? price;
  String? ram;
  String? capacity;

  ProductDataModel({
    this.id,
    this.name,
    this.catiegory,
    this.details,
    this.isBestselling,
    this.photo,
    this.price,
    this.ram,
    this.capacity,
  });

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    catiegory = json['catiegory'];
    details = json['details'];
    isBestselling = json['is_bestselling'];
    photo = json['photo'];
    price = json['price'];
    ram = json['Ram'];
    capacity = json['Capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['catiegory'] = catiegory;
    data['details'] = details;
    data['price'] = price;
    data['is_bestselling'] = isBestselling;
    data['photo'] = photo;

    data['Ram'] = ram;
    data['Capacity'] = capacity;
    return data;
  }

  @override
  List<Object?> get props => [id];
}

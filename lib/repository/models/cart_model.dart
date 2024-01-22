import 'package:equatable/equatable.dart';
import 'package:techcart/repository/models/product_model.dart';

class CartModel {
  List<CartDataModel>? cartList = [];

  CartModel(this.cartList);

  CartModel.fromJson(List<dynamic> json) {
    for (var cart in json) {
      cartList!.add(CartDataModel.fromJson(cart));
    }
  }
}

// ignore: must_be_immutable
class CartDataModel extends Equatable {
  int? id;
  int? quantity;
  bool? isDeleted;
  ProductDataModel? product;

  CartDataModel({this.id, this.quantity, this.isDeleted, this.product});

  CartDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    isDeleted = json['is_deleted'];
    product = json['product'] != null
        ? ProductDataModel.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['is_deleted'] = isDeleted;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [id];
}

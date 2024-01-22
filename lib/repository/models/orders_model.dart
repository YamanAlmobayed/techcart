import 'package:techcart/repository/models/cart_model.dart';

class OrdersModel {
  List<OrdersDataModel>? orders = [];

  OrdersModel(this.orders);

  OrdersModel.fromJson(List<dynamic> json) {
    for (var order in json) {
      orders!.add(OrdersDataModel.fromJson(order));
    }
  }
}

class OrdersDataModel {
  int? id;
  String? deliveryOption;
  String? paymentMethod;
  String? address;
  int? totalPrice;
  List<CartDataModel>? cart;

  OrdersDataModel(
      {this.id,
      this.deliveryOption,
      this.paymentMethod,
      this.address,
      this.totalPrice,
      this.cart});

  OrdersDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliveryOption = json['delivery_option'];
    paymentMethod = json['payment_method'];
    address = json['address'];
    totalPrice = json['total_price'];
    if (json['cart'] != null) {
      cart = <CartDataModel>[];
      json['cart'].forEach((v) {
        cart!.add(CartDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['delivery_option'] = deliveryOption;
    data['payment_method'] = paymentMethod;
    data['address'] = address;
    data['total_price'] = totalPrice;
    if (cart != null) {
      data['cart'] = cart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

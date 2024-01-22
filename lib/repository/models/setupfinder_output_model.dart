// To parse this JSON data, do
//
//     final setupfinderQuestionModel = setupfinderQuestionModelFromJson(jsonString);

import 'dart:convert';

import 'package:techcart/repository/models/product_model.dart';

SetupfinderOutputModel setupfinderQuestionModelFromJson(String str) =>
    SetupfinderOutputModel.fromJson(json.decode(str));

String setupfinderQuestionModelToJson(SetupfinderOutputModel data) =>
    json.encode(data.toJson());

class SetupfinderOutputModel {
  final String? recommendation;
  final ProductDataModel? product;
  final List<String>? categories;
  final String? outputType;
  final bool? isOutput;

  SetupfinderOutputModel({
    this.recommendation,
    this.product,
    this.categories,
    this.outputType,
    this.isOutput,
  });

  factory SetupfinderOutputModel.fromJson(Map<String, dynamic> json) =>
      SetupfinderOutputModel(
        recommendation: json["recommendation"],
        product: json["product"] == null
            ? null
            : ProductDataModel.fromJson(json["product"]),
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        outputType: json["output_type"],
        isOutput: json["is_output"],
      );

  Map<String, dynamic> toJson() => {
        "recommendation": recommendation,
        "product": product?.toJson(),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "output_type": outputType,
        "is_output": isOutput,
      };
}

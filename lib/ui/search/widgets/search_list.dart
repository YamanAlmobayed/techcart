import 'package:flutter/material.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/ui/search/widgets/search_item.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) =>
            SearchItem(product: products.products![index]),
        separatorBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          height: 1,
          width: double.infinity,
          color: Colors.grey,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: products.products!.length,
      ),
    );
  }
}

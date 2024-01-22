import 'package:flutter/material.dart';
import 'package:techcart/shared/widgets/default_gridview_item.dart';

class DefaultGridView extends StatelessWidget {
  const DefaultGridView({
    super.key,
    required this.products,
  });

  final dynamic products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(7),
        child: DefaultGridViewItem(
          product: products[index],
        ),
      ),
      itemCount: products.length,
    );
  }
}

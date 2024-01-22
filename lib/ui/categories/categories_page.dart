import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/models/categories_model.dart';
import '../../shared/widgets/navigate_to_all_categories_button.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.categories});
  final CategoriesModel categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
        title: Text(
          "All Categories",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => NavigateToAllCategoriesButton(
          model: categories.categoriesList![index],
        ),
        itemCount: categories.categoriesList!.length,
      ),
    );
  }
}

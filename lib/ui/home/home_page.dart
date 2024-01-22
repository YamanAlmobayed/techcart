import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/shared/constants.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/ui/home/cubit/collaborative_cubit/collaborative_cubit.dart';
import 'package:techcart/ui/categories/cubit/categories_cubit.dart';
import 'package:techcart/ui/home/cubit/popularity_cubit/popularity_cubit.dart';
import 'package:techcart/ui/home/widgets/home_category_item.dart';
import 'package:techcart/ui/home/widgets/home_product_item.dart';
import 'package:techcart/ui/index/cubit/index_cubit.dart';
import '../../shared/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
          child: Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  context.pushNamed(AppRoutes().search);
                },
                child: Container(
                  width: double.infinity,
                  height: 100.w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(84, 226, 234, 242),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 36.w,
                      ),
                      Text(
                        "Search",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 35.sp,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey[600],
                          size: 45.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 38.w,
              ),
              CarouselSlider.builder(
                itemCount: context.read<IndexCubit>().imgList.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  height: 270.0.w,
                ),
                itemBuilder: (context, index, realIdx) {
                  // ignore: avoid_unnecessary_containers
                  return Container(
                    child: Center(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                          context.read<IndexCubit>().imgList[index],
                          fit: BoxFit.cover,
                          width: double.infinity),
                    )),
                  );
                },
              ),
              SizedBox(
                height: 38.w,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Categories",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 38.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 38.w,
              ),
              BlocBuilder<CategoriesCubit, CategoriesState>(
                buildWhen: (_, current) =>
                    current is GetCategoriesLoading ||
                    current is GetCategoriesError ||
                    current is GetCategoriesSuccess,
                builder: (context, state) {
                  if (state is GetCategoriesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is GetCategoriesError) {
                    showToast(
                        text: state.errorMessage, state: ToastStates.error);
                    return Center(
                      child: OutlinedButton(
                        onPressed: () {
                          context.read<CategoriesCubit>().getCategories();
                        },
                        child: const Text('Retry'),
                      ),
                    );
                  }
                  if (state is GetCategoriesSuccess) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: HomeCategoryItem(
                            label: state.categories.categoriesList![0].name!,
                            products:
                                state.categories.categoriesList![0].products!,
                            icon: Icons.phone_android_outlined,
                          ),
                        ),
                        Expanded(
                          child: HomeCategoryItem(
                              label: state.categories.categoriesList![1].name!,
                              products:
                                  state.categories.categoriesList![1].products!,
                              icon: Icons.laptop),
                        ),
                        Expanded(
                          child: HomeCategoryItem(
                              label: state.categories.categoriesList![2].name!,
                              products:
                                  state.categories.categoriesList![2].products!,
                              icon: Icons.tablet_android_outlined),
                        ),
                        Expanded(
                          child: HomeCategoryItem(
                            icon: Icons.arrow_forward_ios,
                            label: "See All",
                            fontWeight: FontWeight.bold,
                            categories: state.categories,
                            isCategories: true,
                            labelColor: Colors.blue,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              SizedBox(
                height: 38.0.w,
              ),
              BlocBuilder<PopularityCubit, PopularityState>(
                builder: (context, state) {
                  if (state is GetPopularityRecommendationLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetPopularityRecommendationError) {
                    showToast(
                        text: state.errorMessage, state: ToastStates.error);
                    return Center(
                      child: OutlinedButton(
                        onPressed: () {
                          context
                              .read<PopularityCubit>()
                              .getPopularityRecommendation();
                        },
                        child: const Text('Retry'),
                      ),
                    );
                  } else if (state is GetPopularityRecommendationSuccess) {
                    return Material(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border(
                            left: BorderSide(
                              color: Colors.grey.shade300,
                              width: 3.5.w,
                            ),
                            top: BorderSide(
                              color: Colors.grey.shade300,
                              width: 3.5.w,
                            ),
                            right: BorderSide(
                              width: 3.5.w,
                              color: Colors.grey.shade300,
                            ),
                            bottom: BorderSide(
                              width: 3.5.w,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: HomeProductItem(
                            model: state.populartiyRecommendation.products!,
                            type: "Popular Products",
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              if (AppConstants.appContants.token != "null")
                SizedBox(
                  height: 38.0.w,
                ),
              if (AppConstants.appContants.token != "null")
                BlocBuilder<CollaborativeCubit, CollaborativeState>(
                  builder: (context, state) {
                    if (state is GetCollaborativeRecommendationLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetCollaborativeRecommendationError) {
                      showToast(
                          text: state.errorMessage, state: ToastStates.error);
                      return Center(
                        child: OutlinedButton(
                          onPressed: () {
                            context
                                .read<CollaborativeCubit>()
                                .getCollaborativeRecommendation(
                                    userId: AppConstants().userId);
                          },
                          child: const Text('Retry'),
                        ),
                      );
                    } else if (state is GetCollaborativeRecommendationSuccess) {
                      return Material(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border(
                              left: BorderSide(
                                color: Colors.grey.shade300,
                                width: 3.5.w,
                              ),
                              top: BorderSide(
                                color: Colors.grey.shade300,
                                width: 3.5.w,
                              ),
                              right: BorderSide(
                                width: 3.5.w,
                                color: Colors.grey.shade300,
                              ),
                              bottom: BorderSide(
                                width: 3.5.w,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: HomeProductItem(
                              model:
                                  state.collaborativeRecommendation.products!,
                              type: "Recommended for you",
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}

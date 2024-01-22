import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techcart/ui/favortie/cubit/favorite_cubit.dart';
import '../../shared/constants.dart';
import '../../shared/widgets/default_gridview.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: AppConstants.appContants.token != 'null',
      builder: (context) => BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is GetFavoriteLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetFavoriteError) {
            return Center(
              child: OutlinedButton(
                onPressed: () {
                  context.read<FavoriteCubit>().getMyFavorite();
                },
                child: const Text('Retry'),
              ),
            );
          } else if (state is GetFavoriteSuccess ||
              state is AddFavoriteLocalSuccess ||
              state is DeleteFavoriteLocalSuccess ||
              state is ModifyingFavoriteError ||
              state is ModifyingFavoriteError) {
            if (context.watch<FavoriteCubit>().favoriteLocal.isEmpty) {
              return Center(
                child: FittedBox(
                  child: Text(
                    "You don't have favorite products yet!",
                    style: TextStyle(
                      fontSize: 40.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            } else {
              return DefaultGridView(
                products: context.read<FavoriteCubit>().favoriteLocal,
              );
            }
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      fallback: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: FittedBox(
            child: Text(
              "You have to signin to add to favorite!",
              style: TextStyle(
                fontSize: 40.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

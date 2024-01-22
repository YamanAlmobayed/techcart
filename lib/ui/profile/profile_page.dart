import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/shared/constants.dart';
import 'package:techcart/shared/gen/assets.gen.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/shared/utils.dart';
import 'package:techcart/ui/cart/cubit/cart_cubit.dart';
import 'package:techcart/ui/favortie/cubit/favorite_cubit.dart';
import 'package:techcart/ui/index/cubit/index_cubit.dart';
import 'package:techcart/ui/profile/cubit/profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ConditionalBuilder(
        condition: AppConstants.appContants.token != "null",
        builder: (context) => SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 3.0.w,
                            ),
                            borderRadius: BorderRadius.circular(
                              157.r,
                            )),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage:
                              AppConstants.appContants.profilePhoto == "null" ||
                                      AppConstants.appContants.profilePhoto ==
                                          null
                                  ? const $AssetsImagesGen()
                                      .defaultProfileImage
                                      .provider()
                                  : Image(
                                      image: CachedNetworkImageProvider(
                                        AppConstants.appContants.profilePhoto!,
                                      ),
                                    ).image,
                          radius: 97.0.r,
                        ),
                      ),
                      SizedBox(
                        width: 38.0.w,
                      ),
                      SizedBox(
                        height: 200.0.w,
                        width: 415.0.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppConstants.appContants.profileName,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 37.0.sp,
                              ),
                            ),
                            Text(
                              AppConstants.appContants.profileEmail,
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30.0.w,
                                  color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                context.pushNamed(AppRoutes().editProfile);
                              },
                              child: Text(
                                "Edit profile",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 34.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                height: 57.0.w,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<IndexCubit>().bottomNavBarReturnToHome();
                      },
                      child: SizedBox(
                        height: 97.0.w,
                        child: Row(
                          children: [
                            Icon(
                              Icons.home_outlined,
                              size: 72.0.w,
                            ),
                            SizedBox(
                              width: 28.0.w,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 41.0.w,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 28.0.w,
                    ),
                    InkWell(
                      onTap: (() async {
                        context.pushNamed(AppRoutes().setupFinder);
                      }),
                      child: SizedBox(
                        height: 97.0.w,
                        child: Row(
                          children: [
                            Icon(
                              Icons.laptop,
                              size: 72.0.sp,
                            ),
                            SizedBox(
                              width: 28.0.w,
                            ),
                            Text(
                              "Setup Finder",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 41.0.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 28.0.w,
                    ),
                    InkWell(
                      onTap: () {
                        context.pushNamed(AppRoutes().orders);
                      },
                      child: SizedBox(
                        height: 97.0.w,
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 72.0.sp,
                            ),
                            SizedBox(
                              width: 28.0.w,
                            ),
                            Text(
                              "My orders",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 41.0.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 28.0.w,
                    ),
                    InkWell(
                      onTap: () {
                        final indexCubit = context.read<IndexCubit>();
                        final favoriteCubit = context.read<FavoriteCubit>();
                        final cartCubit = context.read<CartCubit>();

                        context.read<ProfileCubit>().logout(
                              indexCubit: indexCubit,
                              favoriteCubit: favoriteCubit,
                              cartCubit: cartCubit,
                            );
                        clearAndNavigate(context, AppRoutes().index);
                      },
                      child: SizedBox(
                        height: 97.0.w,
                        child: Row(
                          children: [
                            Icon(
                              Icons.power_settings_new_outlined,
                              size: 72.0.sp,
                            ),
                            SizedBox(
                              width: 28.0.w,
                            ),
                            Text(
                              "Log Out",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 41.0.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        fallback: (context) => Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You are not logged in",
                style: TextStyle(
                  fontSize: 40.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.pushNamed(AppRoutes().login);
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40.0.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

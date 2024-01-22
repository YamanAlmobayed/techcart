import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techcart/repository/services/techcart_service.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/bloc_observer.dart';
import 'package:techcart/shared/cache_helper.dart';
import 'package:techcart/shared/constants.dart';
import 'package:techcart/shared/router/router.dart';
import 'package:techcart/ui/cart/cubit/cart_cubit.dart';
import 'package:techcart/ui/categories/cubit/categories_cubit.dart';
import 'package:techcart/ui/checkout/cubit/checkout_cubit.dart';
import 'package:techcart/ui/favortie/cubit/favorite_cubit.dart';
import 'package:techcart/ui/home/cubit/collaborative_cubit/collaborative_cubit.dart';
import 'package:techcart/ui/home/cubit/popularity_cubit/popularity_cubit.dart';
import 'package:techcart/ui/index/cubit/index_cubit.dart';
import 'package:techcart/ui/profile/cubit/profile_cubit.dart';
import 'package:techcart/ui/setup_finder/cubit/setupfinder_cubit.dart';
import 'package:techcart/ui/style/app_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.inti();
  AppConstants.appContants.token = CacheHelper.getData(key: "token").toString();
  AppConstants.appContants.userId = CacheHelper.getData(key: "userId");
  AppConstants.appContants.profileBirthdate =
      CacheHelper.getData(key: "profileBirthdate");
  AppConstants.appContants.profilePhoto =
      CacheHelper.getData(key: "profilePhoto").toString();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          TechcartRepository(techcartService: TechcartService()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => IndexCubit(),
          ),
          BlocProvider(
            create: (context) =>
                PopularityCubit(context.read<TechcartRepository>())
                  ..getPopularityRecommendation(),
          ),
          BlocProvider(
            create: (context) =>
                CollaborativeCubit(context.read<TechcartRepository>())
                  ..getCollaborativeRecommendation(
                    userId: AppConstants.appContants.userId,
                  ),
          ),
          BlocProvider(
            create: (context) =>
                CategoriesCubit(context.read<TechcartRepository>())
                  ..getCategories(),
          ),
          BlocProvider(
            create: (context) =>
                FavoriteCubit(context.read<TechcartRepository>())
                  ..getMyFavorite(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) =>
                CartCubit(context.read<TechcartRepository>())..getCart(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) =>
                ProfileCubit(context.read<TechcartRepository>())
                  ..getUserProfile(userId: AppConstants.appContants.userId),
          ),
          BlocProvider(
              create: (context) =>
                  CheckoutCubit(context.read<TechcartRepository>())),
          BlocProvider(
            create: (context) =>
                SetupfinderCubit(context.read<TechcartRepository>()),
          )
        ],
        child: Builder(builder: (context) {
          return ScreenUtilInit(
            designSize: const Size(737, 392),
            minTextAdapt: true,
            builder: (context, child) => MaterialApp.router(
              title: 'Techcart',
              debugShowCheckedModeBanner: false,
              theme: AppStyle().lightTheme,
              routerConfig: _appRouter.router,
            ),
          );
        }),
      ),
    );
  }
}

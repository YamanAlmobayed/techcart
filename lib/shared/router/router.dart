import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/models/categories_model.dart';
import 'package:techcart/repository/models/password_reset_verification_model.dart';
import 'package:techcart/repository/models/product_model.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/ui/auth/login/login_page.dart';
import 'package:techcart/ui/auth/password_recovery/password_recovery_page.dart';
import 'package:techcart/ui/auth/password_recovery_verification/password_recovery_verification_page.dart';
import 'package:techcart/ui/auth/password_reset/password_reset_page.dart';
import 'package:techcart/ui/auth/signup/signup_page.dart';
import 'package:techcart/ui/categories/categories_page.dart';
import 'package:techcart/ui/categories/category_page.dart';
import 'package:techcart/ui/checkout/checkout_steps_page.dart';
import 'package:techcart/ui/checkout/congratulation_page.dart';
import 'package:techcart/ui/checkout/place_order_page.dart';
import 'package:techcart/ui/index/index_page.dart';
import 'package:techcart/ui/orders/order_page.dart';
import 'package:techcart/ui/orders/orders_page.dart';
import 'package:techcart/ui/product/product_page.dart';
import 'package:techcart/ui/profile/edit_profile_page.dart';
import 'package:techcart/ui/search/search_page.dart';
import 'package:techcart/ui/setup_finder/about_page.dart';
import 'package:techcart/ui/setup_finder/quiz_page.dart';
import 'package:techcart/ui/setup_finder/setup_finder_page.dart';

class AppRouter {
  GoRouter router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    routes: [
      GoRoute(
        name: AppRoutes().index,
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          child: IndexPage(),
        ),
      ),
      GoRoute(
        name: AppRoutes().login,
        path: '/login',
        pageBuilder: (context, state) => const MaterialPage(
          child: LoginPage(),
        ),
      ),
      GoRoute(
        name: AppRoutes().signup,
        path: '/signup',
        pageBuilder: (context, state) => const MaterialPage(
          child: SignupPage(),
        ),
      ),
      GoRoute(
          name: AppRoutes().signupAnimated,
          path: '/signupA',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const SignupPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                final tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          }),
      GoRoute(
          name: AppRoutes().loginAnimated,
          path: '/loginA',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const LoginPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(-1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                final tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          }),
      GoRoute(
        name: AppRoutes().passwordRecovery,
        path: '/password-recovery',
        pageBuilder: (context, state) => const MaterialPage(
          child: PasswordRecoveryPage(),
        ),
      ),
      GoRoute(
          name: AppRoutes().passwordEmailVerification,
          path: '/password-email-verification',
          pageBuilder: (context, state) {
            PasswordResetVerificationModel userResetInfo =
                state.extra as PasswordResetVerificationModel;
            return MaterialPage(
              child: PasswordRecoveryVerificationPage(
                verificationEmail: userResetInfo.email,
                verificationCode: userResetInfo.code,
              ),
            );
          }),
      GoRoute(
        name: AppRoutes().passwordReset,
        path: '/password-reset/:verificationEmail',
        pageBuilder: (context, state) => MaterialPage(
          child: PasswordResetPage(
            verificationEmail: state.pathParameters['verificationEmail']!,
          ),
        ),
      ),
      GoRoute(
          name: AppRoutes().categories,
          path: '/categories',
          pageBuilder: (context, state) {
            CategoriesModel categories = state.extra as CategoriesModel;
            return MaterialPage(
              child: CategoriesPage(
                categories: categories,
              ),
            );
          }),
      GoRoute(
          name: AppRoutes().category,
          path: '/category/:title',
          pageBuilder: (context, state) {
            List<ProductDataModel> products =
                state.extra as List<ProductDataModel>;
            return MaterialPage(
              child: CategoryPage(
                products,
                state.pathParameters['title']!,
              ),
            );
          }),
      GoRoute(
          name: AppRoutes().product,
          path: '/product',
          pageBuilder: (context, state) {
            ProductDataModel product = state.extra as ProductDataModel;
            return MaterialPage(
              child: ProductPage(
                product: product,
              ),
            );
          }),
      GoRoute(
          name: AppRoutes().search,
          path: '/search',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SearchPage(),
            );
          }),
      GoRoute(
          name: AppRoutes().checkout,
          path: '/checkout',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: CheckoutStepsPage(),
            );
          }),
      GoRoute(
          name: AppRoutes().placeOrder,
          path: '/placeOrder',
          pageBuilder: (context, state) {
            Map<String, String> checkoutInfo =
                state.extra as Map<String, String>;
            return MaterialPage(
              child: PlaceOrderPage(
                city: checkoutInfo['city']!,
                country: checkoutInfo['country']!,
                masterCardLastTwoDigit: checkoutInfo['masterCardLastTwoDigit']!,
                street: checkoutInfo['street']!,
                userMasterCard: checkoutInfo['userMasterCard']!,
              ),
            );
          }),
      GoRoute(
          name: AppRoutes().congratulation,
          path: '/congratulation',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: CongratulationPage(),
            );
          }),
      GoRoute(
          name: AppRoutes().editProfile,
          path: '/edit-profile',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: EditProfilePage(),
            );
          }),
      GoRoute(
          name: AppRoutes().orders,
          path: '/orders',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: OrdersPage(),
            );
          }),
      GoRoute(
          name: AppRoutes().order,
          path: '/order',
          pageBuilder: (context, state) {
            Map<String, dynamic> orderInfo =
                state.extra as Map<String, dynamic>;
            return MaterialPage(
              child: OrderPage(
                index: orderInfo['index']!,
                address: orderInfo['address']!,
                deliveryType: orderInfo['deliveryType']!,
                paymentMathod: orderInfo['paymentMathod']!,
                orderTotalPrice: orderInfo['orderTotalPrice']!,
                orderProducts: orderInfo['orderProducts']!,
              ),
            );
          }),
      GoRoute(
          name: AppRoutes().setupFinder,
          path: '/setup-finder',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SetupFinderPage(),
            );
          }),
      GoRoute(
          name: AppRoutes().quiz,
          path: '/quiz',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: QuizPage(),
            );
          }),
      GoRoute(
          name: AppRoutes().setupFinderAbout,
          path: '/setup-finder-about',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SetupFinderAboutPage(),
            );
          }),
    ],
  );
}

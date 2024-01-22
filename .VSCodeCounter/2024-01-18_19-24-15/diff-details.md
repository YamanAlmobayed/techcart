# Diff Details

Date : 2024-01-18 19:24:15

Directory e:\\AndroidStudioProject\\techcart\\lib

Total : 50 files,  1007 codes, -465 comments, 44 blanks, all 586 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/main.dart](/lib/main.dart) | Dart | 26 | 0 | -5 | 21 |
| [lib/repository/models/login_user_model.dart](/lib/repository/models/login_user_model.dart) | Dart | -11 | 0 | -2 | -13 |
| [lib/repository/services/techcart_service.dart](/lib/repository/services/techcart_service.dart) | Dart | 30 | -3 | 0 | 27 |
| [lib/repository/techcart_repository.dart](/lib/repository/techcart_repository.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/shared/bloc_observer.dart](/lib/shared/bloc_observer.dart) | Dart | 24 | 0 | 5 | 29 |
| [lib/shared/widgets/cart_item.dart](/lib/shared/widgets/cart_item.dart) | Dart | 0 | -2 | 0 | -2 |
| [lib/shared/widgets/option_toggle_button.dart](/lib/shared/widgets/option_toggle_button.dart) | Dart | 33 | 0 | 4 | 37 |
| [lib/shared/widgets/place_order_item.dart](/lib/shared/widgets/place_order_item.dart) | Dart | 5 | -2 | 0 | 3 |
| [lib/shared/widgets/ram_toggle_button.dart](/lib/shared/widgets/ram_toggle_button.dart) | Dart | -33 | 0 | -4 | -37 |
| [lib/ui/auth/login/cubit/login_cubit.dart](/lib/ui/auth/login/cubit/login_cubit.dart) | Dart | 5 | -17 | -1 | -13 |
| [lib/ui/auth/login/cubit/login_state.dart](/lib/ui/auth/login/cubit/login_state.dart) | Dart | -6 | 0 | -4 | -10 |
| [lib/ui/auth/login/login_page.dart](/lib/ui/auth/login/login_page.dart) | Dart | 17 | -23 | -1 | -7 |
| [lib/ui/auth/password_recovery/cubit/password_recovery_cubit.dart](/lib/ui/auth/password_recovery/cubit/password_recovery_cubit.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/ui/auth/password_recovery/cubit/password_recovery_state.dart](/lib/ui/auth/password_recovery/cubit/password_recovery_state.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/ui/auth/password_recovery/password_recovery_page.dart](/lib/ui/auth/password_recovery/password_recovery_page.dart) | Dart | 5 | -128 | -1 | -124 |
| [lib/ui/auth/password_reset/cubit/password_reset_cubit.dart](/lib/ui/auth/password_reset/cubit/password_reset_cubit.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/ui/auth/password_reset/cubit/password_reset_state.dart](/lib/ui/auth/password_reset/cubit/password_reset_state.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/ui/auth/password_reset/password_reset_page.dart](/lib/ui/auth/password_reset/password_reset_page.dart) | Dart | 9 | 0 | 0 | 9 |
| [lib/ui/auth/signup/cubit/signup_cubit.dart](/lib/ui/auth/signup/cubit/signup_cubit.dart) | Dart | -4 | -4 | 0 | -8 |
| [lib/ui/auth/signup/signup_page.dart](/lib/ui/auth/signup/signup_page.dart) | Dart | 2 | -256 | 0 | -254 |
| [lib/ui/cart/cart_page.dart](/lib/ui/cart/cart_page.dart) | Dart | 3 | -2 | 2 | 3 |
| [lib/ui/cart/cubit/cart_cubit.dart](/lib/ui/cart/cubit/cart_cubit.dart) | Dart | 16 | 0 | 2 | 18 |
| [lib/ui/checkout/checkout_steps_page.dart](/lib/ui/checkout/checkout_steps_page.dart) | Dart | 421 | 0 | 16 | 437 |
| [lib/ui/checkout/congratulation_page.dart](/lib/ui/checkout/congratulation_page.dart) | Dart | 68 | 3 | 3 | 74 |
| [lib/ui/checkout/cubit/checkout_cubit.dart](/lib/ui/checkout/cubit/checkout_cubit.dart) | Dart | 58 | 0 | 17 | 75 |
| [lib/ui/checkout/cubit/checkout_state.dart](/lib/ui/checkout/cubit/checkout_state.dart) | Dart | 8 | 0 | 8 | 16 |
| [lib/ui/checkout/place_order_page.dart](/lib/ui/checkout/place_order_page.dart) | Dart | 258 | 1 | 4 | 263 |
| [lib/ui/edit_profile/cubit/edit_profile_cubit.dart](/lib/ui/edit_profile/cubit/edit_profile_cubit.dart) | Dart | -71 | -5 | -9 | -85 |
| [lib/ui/edit_profile/cubit/edit_profile_state.dart](/lib/ui/edit_profile/cubit/edit_profile_state.dart) | Dart | -10 | -5 | -11 | -26 |
| [lib/ui/edit_profile/edit_profile_page.dart](/lib/ui/edit_profile/edit_profile_page.dart) | Dart | -166 | -2 | -8 | -176 |
| [lib/ui/favortie/cubit/favorite_cubit.dart](/lib/ui/favortie/cubit/favorite_cubit.dart) | Dart | 1 | 0 | 1 | 2 |
| [lib/ui/favortie/cubit/favorite_state.dart](/lib/ui/favortie/cubit/favorite_state.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/ui/favortie/favorite_page.dart](/lib/ui/favortie/favorite_page.dart) | Dart | -6 | 0 | 0 | -6 |
| [lib/ui/home/cubit/home_cubit.dart](/lib/ui/home/cubit/home_cubit.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/ui/home/cubit/home_state.dart](/lib/ui/home/cubit/home_state.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/ui/home/home_page.dart](/lib/ui/home/home_page.dart) | Dart | 0 | 2 | 0 | 2 |
| [lib/ui/index/cubit/index_cubit.dart](/lib/ui/index/cubit/index_cubit.dart) | Dart | 7 | -5 | 0 | 2 |
| [lib/ui/orders/cubit/orders_cubit.dart](/lib/ui/orders/cubit/orders_cubit.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/ui/orders/cubit/orders_state.dart](/lib/ui/orders/cubit/orders_state.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/ui/orders/orders_page.dart](/lib/ui/orders/orders_page.dart) | Dart | 5 | 0 | 0 | 5 |
| [lib/ui/product/cubit/product_cubit.dart](/lib/ui/product/cubit/product_cubit.dart) | Dart | 1 | -1 | 0 | 0 |
| [lib/ui/product/cubit/product_state.dart](/lib/ui/product/cubit/product_state.dart) | Dart | 1 | 0 | 2 | 3 |
| [lib/ui/product/product_page.dart](/lib/ui/product/product_page.dart) | Dart | 52 | -4 | -1 | 47 |
| [lib/ui/profile/cubit/profile_cubit.dart](/lib/ui/profile/cubit/profile_cubit.dart) | Dart | 87 | -1 | 10 | 96 |
| [lib/ui/profile/cubit/profile_state.dart](/lib/ui/profile/cubit/profile_state.dart) | Dart | 11 | 0 | 9 | 20 |
| [lib/ui/profile/edit_profile_page.dart](/lib/ui/profile/edit_profile_page.dart) | Dart | 166 | 2 | 8 | 176 |
| [lib/ui/profile/profile_page.dart](/lib/ui/profile/profile_page.dart) | Dart | -7 | -13 | 0 | -20 |
| [lib/ui/search/cubit/search_cubit.dart](/lib/ui/search/cubit/search_cubit.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/ui/search/cubit/search_state.dart](/lib/ui/search/cubit/search_state.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/ui/search/search_page.dart](/lib/ui/search/search_page.dart) | Dart | 8 | 0 | 0 | 8 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details
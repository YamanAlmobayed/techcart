# Details

Date : 2024-01-19 23:52:43

Directory e:\\AndroidStudioProject\\techcart\\lib

Total : 91 files,  7262 codes, 48 comments, 663 blanks, all 7973 lines

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/main.dart](/lib/main.dart) | Dart | 90 | 1 | 6 | 97 |
| [lib/repository/models/cart_model.dart](/lib/repository/models/cart_model.dart) | Dart | 38 | 1 | 9 | 48 |
| [lib/repository/models/categories_model.dart](/lib/repository/models/categories_model.dart) | Dart | 35 | 0 | 8 | 43 |
| [lib/repository/models/favorite_model.dart](/lib/repository/models/favorite_model.dart) | Dart | 35 | 0 | 7 | 42 |
| [lib/repository/models/login_user_model.dart](/lib/repository/models/login_user_model.dart) | Dart | 24 | 3 | 6 | 33 |
| [lib/repository/models/orders_model.dart](/lib/repository/models/orders_model.dart) | Dart | 50 | 0 | 8 | 58 |
| [lib/repository/models/password_reset_verification_model.dart](/lib/repository/models/password_reset_verification_model.dart) | Dart | 8 | 1 | 2 | 11 |
| [lib/repository/models/product_model.dart](/lib/repository/models/product_model.dart) | Dart | 58 | 1 | 9 | 68 |
| [lib/repository/models/reviews_model.dart](/lib/repository/models/reviews_model.dart) | Dart | 21 | 0 | 7 | 28 |
| [lib/repository/models/user_model.dart](/lib/repository/models/user_model.dart) | Dart | 21 | 0 | 3 | 24 |
| [lib/repository/services/techcart_service.dart](/lib/repository/services/techcart_service.dart) | Dart | 371 | 0 | 31 | 402 |
| [lib/repository/techcart_repository.dart](/lib/repository/techcart_repository.dart) | Dart | 101 | 0 | 26 | 127 |
| [lib/shared/api_urls.dart](/lib/shared/api_urls.dart) | Dart | 22 | 0 | 20 | 42 |
| [lib/shared/bloc_observer.dart](/lib/shared/bloc_observer.dart) | Dart | 24 | 0 | 5 | 29 |
| [lib/shared/cache_helper.dart](/lib/shared/cache_helper.dart) | Dart | 32 | 0 | 7 | 39 |
| [lib/shared/constants.dart](/lib/shared/constants.dart) | Dart | 11 | 0 | 9 | 20 |
| [lib/shared/gen/assets.gen.dart](/lib/shared/gen/assets.gen.dart) | Dart | 109 | 19 | 24 | 152 |
| [lib/shared/gen/fonts.gen.dart](/lib/shared/gen/fonts.gen.dart) | Dart | 5 | 9 | 5 | 19 |
| [lib/shared/router/router.dart](/lib/shared/router/router.dart) | Dart | 238 | 0 | 4 | 242 |
| [lib/shared/router/routes.dart](/lib/shared/router/routes.dart) | Dart | 21 | 0 | 19 | 40 |
| [lib/shared/utils.dart](/lib/shared/utils.dart) | Dart | 57 | 0 | 7 | 64 |
| [lib/shared/widgets/cart_item.dart](/lib/shared/widgets/cart_item.dart) | Dart | 168 | 0 | 5 | 173 |
| [lib/shared/widgets/default_button.dart](/lib/shared/widgets/default_button.dart) | Dart | 27 | 0 | 3 | 30 |
| [lib/shared/widgets/default_formfield.dart](/lib/shared/widgets/default_formfield.dart) | Dart | 78 | 0 | 4 | 82 |
| [lib/shared/widgets/default_gridview.dart](/lib/shared/widgets/default_gridview.dart) | Dart | 25 | 0 | 4 | 29 |
| [lib/shared/widgets/default_gridview_item.dart](/lib/shared/widgets/default_gridview_item.dart) | Dart | 107 | 0 | 5 | 112 |
| [lib/shared/widgets/navigate_to_all_categories_button.dart](/lib/shared/widgets/navigate_to_all_categories_button.dart) | Dart | 61 | 1 | 4 | 66 |
| [lib/shared/widgets/text_formfield_label.dart](/lib/shared/widgets/text_formfield_label.dart) | Dart | 21 | 0 | 4 | 25 |
| [lib/ui/auth/login/cubit/login_cubit.dart](/lib/ui/auth/login/cubit/login_cubit.dart) | Dart | 49 | 0 | 5 | 54 |
| [lib/ui/auth/login/cubit/login_state.dart](/lib/ui/auth/login/cubit/login_state.dart) | Dart | 10 | 0 | 7 | 17 |
| [lib/ui/auth/login/login_page.dart](/lib/ui/auth/login/login_page.dart) | Dart | 217 | 0 | 6 | 223 |
| [lib/ui/auth/login/widgets/signup_login_header.dart](/lib/ui/auth/login/widgets/signup_login_header.dart) | Dart | 41 | 0 | 4 | 45 |
| [lib/ui/auth/password_recovery/cubit/password_recovery_cubit.dart](/lib/ui/auth/password_recovery/cubit/password_recovery_cubit.dart) | Dart | 22 | 0 | 5 | 27 |
| [lib/ui/auth/password_recovery/cubit/password_recovery_state.dart](/lib/ui/auth/password_recovery/cubit/password_recovery_state.dart) | Dart | 12 | 0 | 8 | 20 |
| [lib/ui/auth/password_recovery/password_recovery_page.dart](/lib/ui/auth/password_recovery/password_recovery_page.dart) | Dart | 151 | 1 | 6 | 158 |
| [lib/ui/auth/password_recovery_verification/password_recovery_verification_page.dart](/lib/ui/auth/password_recovery_verification/password_recovery_verification_page.dart) | Dart | 161 | 1 | 7 | 169 |
| [lib/ui/auth/password_recovery_verification/widgets/otp_verification_form.dart](/lib/ui/auth/password_recovery_verification/widgets/otp_verification_form.dart) | Dart | 41 | 0 | 4 | 45 |
| [lib/ui/auth/password_reset/cubit/password_reset_cubit.dart](/lib/ui/auth/password_reset/cubit/password_reset_cubit.dart) | Dart | 22 | 0 | 4 | 26 |
| [lib/ui/auth/password_reset/cubit/password_reset_state.dart](/lib/ui/auth/password_reset/cubit/password_reset_state.dart) | Dart | 9 | 0 | 7 | 16 |
| [lib/ui/auth/password_reset/password_reset_page.dart](/lib/ui/auth/password_reset/password_reset_page.dart) | Dart | 155 | 0 | 8 | 163 |
| [lib/ui/auth/signup/cubit/signup_cubit.dart](/lib/ui/auth/signup/cubit/signup_cubit.dart) | Dart | 26 | 0 | 5 | 31 |
| [lib/ui/auth/signup/cubit/signup_state.dart](/lib/ui/auth/signup/cubit/signup_state.dart) | Dart | 10 | 0 | 7 | 17 |
| [lib/ui/auth/signup/signup_page.dart](/lib/ui/auth/signup/signup_page.dart) | Dart | 282 | 3 | 6 | 291 |
| [lib/ui/cart/cart_page.dart](/lib/ui/cart/cart_page.dart) | Dart | 123 | 0 | 4 | 127 |
| [lib/ui/cart/cubit/cart_cubit.dart](/lib/ui/cart/cubit/cart_cubit.dart) | Dart | 99 | 1 | 16 | 116 |
| [lib/ui/cart/cubit/cart_state.dart](/lib/ui/cart/cubit/cart_state.dart) | Dart | 14 | 0 | 11 | 25 |
| [lib/ui/categories/categories_page.dart](/lib/ui/categories/categories_page.dart) | Dart | 42 | 0 | 3 | 45 |
| [lib/ui/categories/category_page.dart](/lib/ui/categories/category_page.dart) | Dart | 46 | 0 | 3 | 49 |
| [lib/ui/categories/cubit/categories_cubit.dart](/lib/ui/categories/cubit/categories_cubit.dart) | Dart | 17 | 0 | 4 | 21 |
| [lib/ui/categories/cubit/categories_state.dart](/lib/ui/categories/cubit/categories_state.dart) | Dart | 12 | 0 | 8 | 20 |
| [lib/ui/checkout/checkout_steps_page.dart](/lib/ui/checkout/checkout_steps_page.dart) | Dart | 423 | 0 | 9 | 432 |
| [lib/ui/checkout/congratulation_page.dart](/lib/ui/checkout/congratulation_page.dart) | Dart | 74 | 0 | 3 | 77 |
| [lib/ui/checkout/cubit/checkout_cubit.dart](/lib/ui/checkout/cubit/checkout_cubit.dart) | Dart | 58 | 0 | 17 | 75 |
| [lib/ui/checkout/cubit/checkout_state.dart](/lib/ui/checkout/cubit/checkout_state.dart) | Dart | 8 | 0 | 8 | 16 |
| [lib/ui/checkout/place_order_page.dart](/lib/ui/checkout/place_order_page.dart) | Dart | 238 | 1 | 5 | 244 |
| [lib/ui/checkout/widgets/place_order_button.dart](/lib/ui/checkout/widgets/place_order_button.dart) | Dart | 36 | 0 | 4 | 40 |
| [lib/ui/checkout/widgets/place_order_item.dart](/lib/ui/checkout/widgets/place_order_item.dart) | Dart | 162 | 0 | 6 | 168 |
| [lib/ui/favortie/cubit/favorite_cubit.dart](/lib/ui/favortie/cubit/favorite_cubit.dart) | Dart | 59 | 0 | 15 | 74 |
| [lib/ui/favortie/cubit/favorite_state.dart](/lib/ui/favortie/cubit/favorite_state.dart) | Dart | 20 | 0 | 14 | 34 |
| [lib/ui/favortie/favorite_page.dart](/lib/ui/favortie/favorite_page.dart) | Dart | 69 | 0 | 3 | 72 |
| [lib/ui/home/cubit/home_cubit.dart](/lib/ui/home/cubit/home_cubit.dart) | Dart | 39 | 0 | 10 | 49 |
| [lib/ui/home/cubit/home_state.dart](/lib/ui/home/cubit/home_state.dart) | Dart | 15 | 0 | 11 | 26 |
| [lib/ui/home/home_page.dart](/lib/ui/home/home_page.dart) | Dart | 306 | 1 | 3 | 310 |
| [lib/ui/home/widgets/home_category_item.dart](/lib/ui/home/widgets/home_category_item.dart) | Dart | 75 | 0 | 3 | 78 |
| [lib/ui/home/widgets/home_product_item.dart](/lib/ui/home/widgets/home_product_item.dart) | Dart | 49 | 0 | 4 | 53 |
| [lib/ui/index/cubit/index_cubit.dart](/lib/ui/index/cubit/index_cubit.dart) | Dart | 51 | 0 | 8 | 59 |
| [lib/ui/index/cubit/index_state.dart](/lib/ui/index/cubit/index_state.dart) | Dart | 6 | 0 | 5 | 11 |
| [lib/ui/index/index_page.dart](/lib/ui/index/index_page.dart) | Dart | 37 | 0 | 3 | 40 |
| [lib/ui/orders/cubit/orders_cubit.dart](/lib/ui/orders/cubit/orders_cubit.dart) | Dart | 17 | 0 | 4 | 21 |
| [lib/ui/orders/cubit/orders_state.dart](/lib/ui/orders/cubit/orders_state.dart) | Dart | 12 | 0 | 8 | 20 |
| [lib/ui/orders/order_page.dart](/lib/ui/orders/order_page.dart) | Dart | 96 | 0 | 3 | 99 |
| [lib/ui/orders/orders_page.dart](/lib/ui/orders/orders_page.dart) | Dart | 78 | 0 | 3 | 81 |
| [lib/ui/orders/widgets/my_order_card.dart](/lib/ui/orders/widgets/my_order_card.dart) | Dart | 47 | 0 | 4 | 51 |
| [lib/ui/orders/widgets/order_details_item.dart](/lib/ui/orders/widgets/order_details_item.dart) | Dart | 37 | 0 | 3 | 40 |
| [lib/ui/orders/widgets/order_product_list.dart](/lib/ui/orders/widgets/order_product_list.dart) | Dart | 57 | 0 | 4 | 61 |
| [lib/ui/product/cubit/product_cubit.dart](/lib/ui/product/cubit/product_cubit.dart) | Dart | 62 | 0 | 11 | 73 |
| [lib/ui/product/cubit/product_state.dart](/lib/ui/product/cubit/product_state.dart) | Dart | 17 | 0 | 13 | 30 |
| [lib/ui/product/product_page.dart](/lib/ui/product/product_page.dart) | Dart | 667 | 1 | 11 | 679 |
| [lib/ui/product/widgets/option_toggle_button.dart](/lib/ui/product/widgets/option_toggle_button.dart) | Dart | 34 | 0 | 4 | 38 |
| [lib/ui/product/widgets/reviews_item.dart](/lib/ui/product/widgets/reviews_item.dart) | Dart | 85 | 0 | 4 | 89 |
| [lib/ui/profile/cubit/profile_cubit.dart](/lib/ui/profile/cubit/profile_cubit.dart) | Dart | 105 | 1 | 14 | 120 |
| [lib/ui/profile/cubit/profile_state.dart](/lib/ui/profile/cubit/profile_state.dart) | Dart | 16 | 0 | 13 | 29 |
| [lib/ui/profile/edit_profile_page.dart](/lib/ui/profile/edit_profile_page.dart) | Dart | 189 | 2 | 7 | 198 |
| [lib/ui/profile/profile_page.dart](/lib/ui/profile/profile_page.dart) | Dart | 270 | 0 | 5 | 275 |
| [lib/ui/search/cubit/search_cubit.dart](/lib/ui/search/cubit/search_cubit.dart) | Dart | 20 | 0 | 4 | 24 |
| [lib/ui/search/cubit/search_state.dart](/lib/ui/search/cubit/search_state.dart) | Dart | 12 | 0 | 8 | 20 |
| [lib/ui/search/search_page.dart](/lib/ui/search/search_page.dart) | Dart | 130 | 0 | 6 | 136 |
| [lib/ui/search/widgets/search_item.dart](/lib/ui/search/widgets/search_item.dart) | Dart | 71 | 0 | 4 | 75 |
| [lib/ui/search/widgets/search_list.dart](/lib/ui/search/widgets/search_list.dart) | Dart | 24 | 0 | 4 | 28 |
| [lib/ui/setup_finder/setup_finder_page.dart](/lib/ui/setup_finder/setup_finder_page.dart) | Dart | 45 | 0 | 4 | 49 |
| [lib/ui/style/app_style.dart](/lib/ui/style/app_style.dart) | Dart | 27 | 0 | 2 | 29 |

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)
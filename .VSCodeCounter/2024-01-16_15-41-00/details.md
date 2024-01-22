# Details

Date : 2024-01-16 15:41:00

Directory e:\\AndroidStudioProject\\techcart\\lib

Total : 83 files,  5897 codes, 607 comments, 602 blanks, all 7106 lines

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/main.dart](/lib/main.dart) | Dart | 60 | 0 | 10 | 70 |
| [lib/repository/models/cart_model.dart](/lib/repository/models/cart_model.dart) | Dart | 38 | 1 | 9 | 48 |
| [lib/repository/models/categories_model.dart](/lib/repository/models/categories_model.dart) | Dart | 35 | 0 | 8 | 43 |
| [lib/repository/models/favorite_model.dart](/lib/repository/models/favorite_model.dart) | Dart | 35 | 0 | 7 | 42 |
| [lib/repository/models/login_user_model.dart](/lib/repository/models/login_user_model.dart) | Dart | 35 | 3 | 8 | 46 |
| [lib/repository/models/orders_model.dart](/lib/repository/models/orders_model.dart) | Dart | 50 | 0 | 8 | 58 |
| [lib/repository/models/password_reset_verification_model.dart](/lib/repository/models/password_reset_verification_model.dart) | Dart | 8 | 1 | 2 | 11 |
| [lib/repository/models/product_model.dart](/lib/repository/models/product_model.dart) | Dart | 58 | 1 | 9 | 68 |
| [lib/repository/models/reviews_model.dart](/lib/repository/models/reviews_model.dart) | Dart | 21 | 0 | 7 | 28 |
| [lib/repository/models/user_model.dart](/lib/repository/models/user_model.dart) | Dart | 21 | 0 | 3 | 24 |
| [lib/repository/services/techcart_service.dart](/lib/repository/services/techcart_service.dart) | Dart | 338 | 3 | 31 | 372 |
| [lib/repository/techcart_repository.dart](/lib/repository/techcart_repository.dart) | Dart | 98 | 0 | 26 | 124 |
| [lib/shared/api_urls.dart](/lib/shared/api_urls.dart) | Dart | 22 | 0 | 20 | 42 |
| [lib/shared/cache_helper.dart](/lib/shared/cache_helper.dart) | Dart | 32 | 0 | 7 | 39 |
| [lib/shared/constants.dart](/lib/shared/constants.dart) | Dart | 13 | 0 | 11 | 24 |
| [lib/shared/dio_helper.dart](/lib/shared/dio_helper.dart) | Dart | 85 | 5 | 8 | 98 |
| [lib/shared/utils.dart](/lib/shared/utils.dart) | Dart | 63 | 0 | 9 | 72 |
| [lib/shared/widgets/cart_item.dart](/lib/shared/widgets/cart_item.dart) | Dart | 162 | 2 | 5 | 169 |
| [lib/shared/widgets/color_toggle_button.dart](/lib/shared/widgets/color_toggle_button.dart) | Dart | 43 | 0 | 4 | 47 |
| [lib/shared/widgets/custom_page_route.dart](/lib/shared/widgets/custom_page_route.dart) | Dart | 17 | 0 | 4 | 21 |
| [lib/shared/widgets/default_button.dart](/lib/shared/widgets/default_button.dart) | Dart | 27 | 0 | 3 | 30 |
| [lib/shared/widgets/default_formfield.dart](/lib/shared/widgets/default_formfield.dart) | Dart | 77 | 0 | 4 | 81 |
| [lib/shared/widgets/default_gridview.dart](/lib/shared/widgets/default_gridview.dart) | Dart | 25 | 0 | 4 | 29 |
| [lib/shared/widgets/default_gridview_item.dart](/lib/shared/widgets/default_gridview_item.dart) | Dart | 105 | 0 | 5 | 110 |
| [lib/shared/widgets/home_category_item.dart](/lib/shared/widgets/home_category_item.dart) | Dart | 54 | 36 | 5 | 95 |
| [lib/shared/widgets/home_product_item.dart](/lib/shared/widgets/home_product_item.dart) | Dart | 48 | 0 | 4 | 52 |
| [lib/shared/widgets/my_order_card.dart](/lib/shared/widgets/my_order_card.dart) | Dart | 43 | 0 | 4 | 47 |
| [lib/shared/widgets/navigate_to_all_categories_button.dart](/lib/shared/widgets/navigate_to_all_categories_button.dart) | Dart | 53 | 0 | 4 | 57 |
| [lib/shared/widgets/order_details_item.dart](/lib/shared/widgets/order_details_item.dart) | Dart | 37 | 0 | 3 | 40 |
| [lib/shared/widgets/order_product_list.dart](/lib/shared/widgets/order_product_list.dart) | Dart | 53 | 0 | 4 | 57 |
| [lib/shared/widgets/otp_verification_form.dart](/lib/shared/widgets/otp_verification_form.dart) | Dart | 40 | 0 | 4 | 44 |
| [lib/shared/widgets/place_order_button.dart](/lib/shared/widgets/place_order_button.dart) | Dart | 36 | 0 | 4 | 40 |
| [lib/shared/widgets/place_order_item.dart](/lib/shared/widgets/place_order_item.dart) | Dart | 156 | 2 | 6 | 164 |
| [lib/shared/widgets/ram_toggle_button.dart](/lib/shared/widgets/ram_toggle_button.dart) | Dart | 33 | 0 | 4 | 37 |
| [lib/shared/widgets/reviews_item.dart](/lib/shared/widgets/reviews_item.dart) | Dart | 82 | 0 | 4 | 86 |
| [lib/shared/widgets/search_item.dart](/lib/shared/widgets/search_item.dart) | Dart | 78 | 0 | 4 | 82 |
| [lib/shared/widgets/search_list.dart](/lib/shared/widgets/search_list.dart) | Dart | 24 | 0 | 4 | 28 |
| [lib/shared/widgets/signup_login_header.dart](/lib/shared/widgets/signup_login_header.dart) | Dart | 40 | 0 | 4 | 44 |
| [lib/shared/widgets/text_formfield_label.dart](/lib/shared/widgets/text_formfield_label.dart) | Dart | 20 | 0 | 4 | 24 |
| [lib/ui/auth/login/cubit/login_cubit.dart](/lib/ui/auth/login/cubit/login_cubit.dart) | Dart | 51 | 22 | 6 | 79 |
| [lib/ui/auth/login/cubit/login_state.dart](/lib/ui/auth/login/cubit/login_state.dart) | Dart | 16 | 0 | 11 | 27 |
| [lib/ui/auth/login/login_page.dart](/lib/ui/auth/login/login_page.dart) | Dart | 189 | 23 | 6 | 218 |
| [lib/ui/auth/password_recovery/cubit/password_recovery_cubit.dart](/lib/ui/auth/password_recovery/cubit/password_recovery_cubit.dart) | Dart | 31 | 2 | 6 | 39 |
| [lib/ui/auth/password_recovery/cubit/password_recovery_state.dart](/lib/ui/auth/password_recovery/cubit/password_recovery_state.dart) | Dart | 10 | 0 | 7 | 17 |
| [lib/ui/auth/password_recovery/password_recovery_page.dart](/lib/ui/auth/password_recovery/password_recovery_page.dart) | Dart | 133 | 129 | 8 | 270 |
| [lib/ui/auth/password_recovery_verification/password_recovery_verification_page.dart](/lib/ui/auth/password_recovery_verification/password_recovery_verification_page.dart) | Dart | 151 | 1 | 12 | 164 |
| [lib/ui/auth/password_reset/cubit/password_reset_cubit.dart](/lib/ui/auth/password_reset/cubit/password_reset_cubit.dart) | Dart | 23 | 0 | 4 | 27 |
| [lib/ui/auth/password_reset/cubit/password_reset_state.dart](/lib/ui/auth/password_reset/cubit/password_reset_state.dart) | Dart | 10 | 0 | 7 | 17 |
| [lib/ui/auth/password_reset/password_reset_page.dart](/lib/ui/auth/password_reset/password_reset_page.dart) | Dart | 138 | 0 | 8 | 146 |
| [lib/ui/auth/signup/cubit/signup_cubit.dart](/lib/ui/auth/signup/cubit/signup_cubit.dart) | Dart | 34 | 7 | 6 | 47 |
| [lib/ui/auth/signup/cubit/signup_state.dart](/lib/ui/auth/signup/cubit/signup_state.dart) | Dart | 10 | 0 | 7 | 17 |
| [lib/ui/auth/signup/signup_page.dart](/lib/ui/auth/signup/signup_page.dart) | Dart | 266 | 259 | 11 | 536 |
| [lib/ui/cart/cart_page.dart](/lib/ui/cart/cart_page.dart) | Dart | 121 | 4 | 3 | 128 |
| [lib/ui/cart/cubit/cart_cubit.dart](/lib/ui/cart/cubit/cart_cubit.dart) | Dart | 83 | 1 | 14 | 98 |
| [lib/ui/cart/cubit/cart_state.dart](/lib/ui/cart/cubit/cart_state.dart) | Dart | 14 | 0 | 11 | 25 |
| [lib/ui/categories/categories_page.dart](/lib/ui/categories/categories_page.dart) | Dart | 40 | 0 | 3 | 43 |
| [lib/ui/categories/category_page.dart](/lib/ui/categories/category_page.dart) | Dart | 44 | 0 | 3 | 47 |
| [lib/ui/edit_profile/cubit/edit_profile_cubit.dart](/lib/ui/edit_profile/cubit/edit_profile_cubit.dart) | Dart | 71 | 5 | 9 | 85 |
| [lib/ui/edit_profile/cubit/edit_profile_state.dart](/lib/ui/edit_profile/cubit/edit_profile_state.dart) | Dart | 10 | 5 | 11 | 26 |
| [lib/ui/edit_profile/edit_profile_page.dart](/lib/ui/edit_profile/edit_profile_page.dart) | Dart | 166 | 2 | 8 | 176 |
| [lib/ui/favortie/cubit/favorite_cubit.dart](/lib/ui/favortie/cubit/favorite_cubit.dart) | Dart | 58 | 0 | 14 | 72 |
| [lib/ui/favortie/cubit/favorite_state.dart](/lib/ui/favortie/cubit/favorite_state.dart) | Dart | 21 | 0 | 14 | 35 |
| [lib/ui/favortie/favorite_page.dart](/lib/ui/favortie/favorite_page.dart) | Dart | 74 | 0 | 3 | 77 |
| [lib/ui/home/cubit/home_cubit.dart](/lib/ui/home/cubit/home_cubit.dart) | Dart | 45 | 0 | 7 | 52 |
| [lib/ui/home/cubit/home_state.dart](/lib/ui/home/cubit/home_state.dart) | Dart | 31 | 0 | 18 | 49 |
| [lib/ui/home/home_page.dart](/lib/ui/home/home_page.dart) | Dart | 313 | 0 | 3 | 316 |
| [lib/ui/index/cubit/index_cubit.dart](/lib/ui/index/cubit/index_cubit.dart) | Dart | 44 | 5 | 8 | 57 |
| [lib/ui/index/cubit/index_state.dart](/lib/ui/index/cubit/index_state.dart) | Dart | 6 | 0 | 5 | 11 |
| [lib/ui/index/index_page.dart](/lib/ui/index/index_page.dart) | Dart | 35 | 0 | 3 | 38 |
| [lib/ui/orders/cubit/orders_cubit.dart](/lib/ui/orders/cubit/orders_cubit.dart) | Dart | 18 | 0 | 4 | 22 |
| [lib/ui/orders/cubit/orders_state.dart](/lib/ui/orders/cubit/orders_state.dart) | Dart | 13 | 0 | 8 | 21 |
| [lib/ui/orders/order_page.dart](/lib/ui/orders/order_page.dart) | Dart | 97 | 0 | 4 | 101 |
| [lib/ui/orders/orders_page.dart](/lib/ui/orders/orders_page.dart) | Dart | 83 | 0 | 3 | 86 |
| [lib/ui/product/cubit/product_cubit.dart](/lib/ui/product/cubit/product_cubit.dart) | Dart | 60 | 4 | 10 | 74 |
| [lib/ui/product/cubit/product_state.dart](/lib/ui/product/cubit/product_state.dart) | Dart | 19 | 0 | 12 | 31 |
| [lib/ui/product/product_page.dart](/lib/ui/product/product_page.dart) | Dart | 614 | 50 | 16 | 680 |
| [lib/ui/profile/cubit/profile_cubit.dart](/lib/ui/profile/cubit/profile_cubit.dart) | Dart | 18 | 6 | 4 | 28 |
| [lib/ui/profile/cubit/profile_state.dart](/lib/ui/profile/cubit/profile_state.dart) | Dart | 5 | 0 | 4 | 9 |
| [lib/ui/profile/profile_page.dart](/lib/ui/profile/profile_page.dart) | Dart | 276 | 23 | 6 | 305 |
| [lib/ui/search/cubit/search_cubit.dart](/lib/ui/search/cubit/search_cubit.dart) | Dart | 21 | 0 | 4 | 25 |
| [lib/ui/search/cubit/search_state.dart](/lib/ui/search/cubit/search_state.dart) | Dart | 13 | 0 | 8 | 21 |
| [lib/ui/search/search_page.dart](/lib/ui/search/search_page.dart) | Dart | 113 | 5 | 5 | 123 |
| [lib/ui/setup_finder/setup_finder_page.dart](/lib/ui/setup_finder/setup_finder_page.dart) | Dart | 44 | 0 | 4 | 48 |

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)
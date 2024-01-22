import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/utils.dart';
import 'package:techcart/ui/search/cubit/search_cubit.dart';
import 'package:techcart/ui/search/widgets/search_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => SearchCubit(context.read<TechcartRepository>()),
      child: Builder(builder: (context) {
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
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _searchController,
                  onFieldSubmitted: (value) {
                    context.read<SearchCubit>().searchProduct(query: value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search products",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0.w,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 3.0.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 38.0.w,
                ),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitial) {
                      return Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 100.0),
                            child: Text(
                              "Search the product you want",
                              style: TextStyle(
                                fontSize: 40.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (state is SearchLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is SearchError) {
                      showToast(
                          text: state.errorMessage, state: ToastStates.error);
                      return Center(
                        child: OutlinedButton(
                          onPressed: () {
                            context
                                .read<SearchCubit>()
                                .searchProduct(query: _searchController.text);
                          },
                          child: const Text('Retry'),
                        ),
                      );
                    } else if (state is SearchSuccess) {
                      return state.searchProducts.products!.isEmpty
                          ? Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 100),
                                  child: Text(
                                    "No product found",
                                    style: TextStyle(
                                        fontSize: 40.0.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          : SearchList(products: state.searchProducts);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

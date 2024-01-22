import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/ui/orders/cubit/orders_cubit.dart';
import 'widgets/my_order_card.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrdersCubit(context.read<TechcartRepository>())..getUserOrders(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Orders",
            style: TextStyle(
              fontSize: 38.0.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: TextButton(
            onPressed: () => context.pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            if (state is GetUserOrdersLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetUserOrdersError) {
              return Center(
                child: OutlinedButton(
                  onPressed: () {
                    context.read<OrdersCubit>().getUserOrders();
                  },
                  child: const Text('Retry'),
                ),
              );
            } else if (state is GetUserOrdersSuccess) {
              return state.orders.orders!.isNotEmpty
                  ? ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20.0),
                      itemBuilder: (context, index) => MyOrderCard(
                            index: index,
                            model: state.orders.orders![index],
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 28.0.w,
                          ),
                      itemCount: state.orders.orders!.length)
                  : Center(
                      child: Text(
                        "You don't have any orders yet!",
                        style: TextStyle(
                          fontSize: 38.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

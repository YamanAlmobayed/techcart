import 'package:bloc/bloc.dart';
import 'package:techcart/repository/models/orders_model.dart';
import 'package:techcart/repository/techcart_repository.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._techcartRepository) : super(OrdersInitial());
  final TechcartRepository _techcartRepository;

  Future<void> getUserOrders() async {
    emit(GetUserOrdersLoading());
    try {
      final orders = await _techcartRepository.getUserOrders();
      emit(GetUserOrdersSuccess(orders));
    } catch (e) {
      emit(GetUserOrdersError(e.toString()));
    }
  }
}

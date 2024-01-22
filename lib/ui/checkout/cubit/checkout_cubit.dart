import 'package:bloc/bloc.dart';
import 'package:techcart/repository/techcart_repository.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this._techcartRepository) : super(CheckoutInitial());

  final TechcartRepository _techcartRepository;

  int currentStep = 0;

  void stepperIncreaseIndex() {
    currentStep++;
    emit(ChangeStepperIndex());
  }

  void stepperDecreaseIndex() {
    currentStep--;
    emit(ChangeStepperIndex());
  }

  bool isStandardDelivery = true;

  bool isNextDayDelivery = false;

  String deliveryMethodValue = "Standard Delivery";

  void deliveryMethod({
    bool isStandard = false,
    bool isNextDay = false,
    required bool value,
  }) {
    if (isStandard && isStandardDelivery) return;

    if (isNextDay && isNextDayDelivery) return;

    isStandardDelivery = isNextDayDelivery = false;

    if (isStandard) {
      isStandardDelivery = value;
      deliveryMethodValue = "Standard Delivery";
    }

    if (isNextDay) {
      isNextDayDelivery = value;
      deliveryMethodValue = "Next Day Delivery";
    }
    emit(ChangeDeliveryMethod());
  }

  Future<void> placeOrder({
    required String paymentMethod,
    required String address,
    required String deliveryMethod,
    required int totalPrice,
    required List<int?> carts,
  }) async {
    emit(PlaceOrdersLoading());
    try {
      await _techcartRepository.placeOrder(
        paymentMethod: paymentMethod,
        address: address,
        deliveryMethod: deliveryMethod,
        totalPrice: totalPrice,
        carts: carts,
      );

      emit(PlaceOrdersSuccess());
    } catch (e) {
      emit(PlaceOrdersError());
    }
  }
}

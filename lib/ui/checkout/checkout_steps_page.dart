import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/ui/checkout/cubit/checkout_cubit.dart';

class CheckoutStepsPage extends StatefulWidget {
  const CheckoutStepsPage({super.key});

  @override
  State<CheckoutStepsPage> createState() => _CheckoutStepsPageState();
}

class _CheckoutStepsPageState extends State<CheckoutStepsPage> {
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _nameOnCardController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardNumberFocusNode = FocusNode();
  final _expiryDateFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _nameOnCardController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _cardNumberFocusNode.dispose();
    _expiryDateFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = context.read<CheckoutCubit>();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (checkoutCubit.currentStep == 0) {
          context.pop();
          return;
        }
        checkoutCubit.stepperDecreaseIndex();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: MaterialButton(
            onPressed: () {
              FocusManager.instance.primaryFocus!.unfocus();
              if (checkoutCubit.currentStep == 0) {
                context.pop();
                return;
              }
              checkoutCubit.stepperDecreaseIndex();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
          ),
          title: Text(
            "Checkout",
            style: TextStyle(
              color: Colors.black,
              fontSize: 42.0.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Stepper(
          elevation: 0.0,
          controlsBuilder: (context, details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (checkoutCubit.currentStep > 0)
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 4.0.w,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: MaterialButton(
                        highlightElevation: 0.0,
                        onPressed: () {
                          details.onStepCancel!();
                        },
                        color: Colors.white,
                        height: 110.0.w,
                        minWidth: 400.0.w,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          "Back",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 38.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (checkoutCubit.currentStep > 0)
                  SizedBox(
                    width: 38.0.w,
                  ),
                Expanded(
                  child: MaterialButton(
                    highlightElevation: 0.0,
                    onPressed: () {
                      details.onStepContinue!();
                    },
                    color: Colors.blue,
                    height: 118.0.w,
                    minWidth: 400.0.w,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          type: StepperType.horizontal,
          steps: [
            Step(
              state: checkoutCubit.currentStep > 0
                  ? StepState.complete
                  : StepState.disabled,
              isActive: checkoutCubit.currentStep >= 0,
              title: const Text(
                "Delivery",
                style: TextStyle(color: Colors.black),
              ),
              content: SizedBox(
                height: 920.0.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Standard Delivery",
                      style: TextStyle(
                        fontSize: 48.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 117.0.w,
                        ),
                        SizedBox(
                          width: 500.0.w,
                          child: const Text(
                            "Order will be delivered between 3-5 days",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Checkbox(
                          value: checkoutCubit.isStandardDelivery,
                          onChanged: (value) {
                            checkoutCubit.deliveryMethod(
                                value: value!, isStandard: true);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80.0.w,
                    ),
                    Text(
                      "Next Day Delivery",
                      style: TextStyle(
                        fontSize: 48.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 137.0.w,
                        ),
                        SizedBox(
                          width: 500.0.w,
                          child: Text(
                            "Place your order before 6pm and your item will be deliverd next day",
                            style: TextStyle(
                              fontSize: 28.0.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Checkbox(
                          value: checkoutCubit.isNextDayDelivery,
                          onChanged: (value) {
                            checkoutCubit.deliveryMethod(
                                value: value!, isNextDay: true);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Step(
              state: checkoutCubit.currentStep > 1
                  ? StepState.complete
                  : StepState.disabled,
              isActive: checkoutCubit.currentStep >= 1,
              title: const Text(
                "Address",
                style: TextStyle(color: Colors.black),
              ),
              content: Form(
                key: _formkey1,
                child: SizedBox(
                  height: 920.0.w,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _streetController,
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Street must not be empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text("Street"),
                        ),
                      ),
                      SizedBox(
                        height: 37.0.w,
                      ),
                      TextFormField(
                        controller: _cityController,
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "City must not be empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text("City"),
                        ),
                      ),
                      SizedBox(
                        height: 37.0.w,
                      ),
                      TextFormField(
                        controller: _countryController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Country must not be empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text("Country"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Step(
              state: checkoutCubit.currentStep > 2
                  ? StepState.complete
                  : StepState.disabled,
              isActive: checkoutCubit.currentStep >= 2,
              title: const Text(
                "Payment",
                style: TextStyle(color: Colors.black),
              ),
              content: SizedBox(
                height: 920.0.w,
                child: Form(
                  key: _formkey2,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameOnCardController,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(_cardNumberFocusNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name must not be empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text("Name on card"),
                        ),
                      ),
                      SizedBox(
                        height: 37.0.w,
                      ),
                      TextFormField(
                        controller: _cardNumberController,
                        focusNode: _cardNumberFocusNode,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(_expiryDateFocusNode);
                        },
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Card number must not be empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text("Card Number"),
                        ),
                      ),
                      SizedBox(
                        height: 37.0.w,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _expiryController,
                              onEditingComplete: () {
                                FocusScope.of(context).nextFocus();
                              },
                              focusNode: _expiryDateFocusNode,
                              keyboardType: TextInputType.datetime,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Expiry date must not be empty";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                label: Text("Expiry Date"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 38.0.w,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _cvvController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "CVV must not be empty";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                label: Text("CVV"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          currentStep: context.watch<CheckoutCubit>().currentStep,
          onStepContinue: () {
            if (checkoutCubit.currentStep == 1) {
              if (_formkey1.currentState!.validate()) {
                checkoutCubit.stepperIncreaseIndex();
                return;
              }
              return;
            }
            if (checkoutCubit.currentStep == 2) {
              if (_formkey2.currentState!.validate()) {
                final checkoutInfo = {
                  'city': _cityController.text,
                  'country': _countryController.text,
                  'street': _streetController.text,
                  'userMasterCard': _cardNumberController.text,
                  'masterCardLastTwoDigit': _cardNumberController.text
                      .substring(_cardNumberController.text.length - 2),
                };

                context.pushReplacementNamed(AppRoutes().placeOrder,
                    extra: checkoutInfo);

                return;
              }
              return;
            }

            checkoutCubit.stepperIncreaseIndex();
          },
          onStepCancel: () {
            checkoutCubit.currentStep == 0
                ? null
                : checkoutCubit.stepperDecreaseIndex();
          },
        ),
      ),
    );
  }
}

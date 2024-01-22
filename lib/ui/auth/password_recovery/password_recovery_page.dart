import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/gen/assets.gen.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/shared/utils.dart';
import 'package:techcart/shared/widgets/default_button.dart';
import 'package:techcart/shared/widgets/default_formfield.dart';
import 'package:techcart/shared/widgets/text_formfield_label.dart';
import 'package:techcart/ui/auth/password_recovery/cubit/password_recovery_cubit.dart';

// ignore: must_be_immutable
class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({super.key});

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  final _formKey1 = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _color = Colors.white;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PasswordRecoveryCubit(context.read<TechcartRepository>()),
      child: BlocListener<PasswordRecoveryCubit, PasswordRecoveryState>(
        listener: (context, state) {
          if (state is GetVerificationCodeErrorState) {
            showToast(text: state.errorMessage, state: ToastStates.error);
          }
          if (state is GetVerificationCodeSuccessState) {
            context.pushNamed(
              AppRoutes().passwordEmailVerification,
              extra: state.userResetInfo,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: _color),
            leading: MaterialButton(
              onPressed: () {
                context.pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
            ),
            title: Text(
              "Password recovery",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 22, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const $AssetsImagesGen().forgetPassword1.image(
                        fit: BoxFit.cover,
                        height: 450.0.w,
                        width: double.maxFinite,
                      ),
                  SizedBox(
                    height: 58.0.w,
                  ),
                  Text(
                    "Enter your registered email address",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 38.0.sp,
                    ),
                  ),
                  SizedBox(
                    height: 67.0.w,
                  ),
                  const TextFormFieldLabel(
                    label: "Email",
                  ),
                  SizedBox(
                    height: 28.0.w,
                  ),
                  Form(
                    key: _formKey1,
                    child: DefaultFormField(
                      controller: _emailController,
                      hintText: "PeterParker@gmail.com",
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Email must not be empty";
                        }
                        if (!value.contains("@") || !value.contains(".")) {
                          return "Invalid email";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 67.0.w,
                  ),
                  BlocBuilder<PasswordRecoveryCubit, PasswordRecoveryState>(
                    builder: (context, state) {
                      if (state is! GetVerificationCodeLoadingState) {
                        return SizedBox(
                          width: double.infinity,
                          height: 118.0.w,
                          child: DefaultButton(
                            buttonText: "Send",
                            onPressed: () {
                              if (_formKey1.currentState!.validate()) {
                                context
                                    .read<PasswordRecoveryCubit>()
                                    .getVerificationCode(context,
                                        email: _emailController.text);
                              }
                            },
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

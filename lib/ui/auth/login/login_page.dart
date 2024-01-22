import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/shared/utils.dart';
import 'package:techcart/shared/widgets/default_button.dart';
import 'package:techcart/shared/widgets/default_formfield.dart';
import 'package:techcart/ui/auth/login/widgets/signup_login_header.dart';
import 'package:techcart/shared/widgets/text_formfield_label.dart';
import 'package:techcart/ui/auth/login/cubit/login_cubit.dart';
import 'package:techcart/ui/cart/cubit/cart_cubit.dart';
import 'package:techcart/ui/favortie/cubit/favorite_cubit.dart';
import 'package:techcart/ui/home/cubit/collaborative_cubit/collaborative_cubit.dart';
import 'package:techcart/ui/index/cubit/index_cubit.dart';
import 'package:techcart/ui/profile/cubit/profile_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _loginButtonFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _loginButtonFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read<TechcartRepository>()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            clearAndNavigate(context, AppRoutes().index);
          }
          if (state is LoginErrorState) {
            showToast(text: state.errorMessage, state: ToastStates.error);
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: SignupLoginHeader(
                              crossAlignment: CrossAxisAlignment.start,
                              text: "Login",
                              isCurrent: true,
                            ),
                          ),
                          Expanded(
                            child: SignupLoginHeader(
                              crossAlignment: CrossAxisAlignment.end,
                              text: "Sign up",
                              isCurrent: false,
                              onTap: () {
                                context.pushReplacementNamed(
                                    AppRoutes().signupAnimated);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 95.0.w,
                      ),
                      const TextFormFieldLabel(
                        label: "Email",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultFormField(
                        controller: _emailController,
                        hintText: "example@example.com",
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                        },
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
                      SizedBox(
                        height: 38.0.w,
                      ),
                      const TextFormFieldLabel(
                        label: "Password",
                      ),
                      SizedBox(
                        height: 28.0.w,
                      ),
                      DefaultFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        hintText: "**************",
                        icon: Icons.lock_outline,
                        textAlignVertical: TextAlignVertical.bottom,
                        obsecureText: true,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(_loginButtonFocusNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password must not be empty";
                          }
                          if (value.length < 2) {
                            return "Password is short";
                          }
                          if (value.length > 25) {
                            return "Password is long";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 48.0.w,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            context.pushNamed(AppRoutes().passwordRecovery);
                          },
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48.0.w,
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          if (state is! LoginLoadingState) {
                            return SizedBox(
                              width: double.infinity,
                              height: 118.0.w,
                              child: DefaultButton(
                                buttonText: "Login",
                                focusNode: _loginButtonFocusNode,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    final indexCubit =
                                        context.read<IndexCubit>();

                                    final collaborativeCubit =
                                        context.read<CollaborativeCubit>();
                                    final profileCubit =
                                        context.read<ProfileCubit>();
                                    final cartCubit = context.read<CartCubit>();
                                    final favoriteCubit =
                                        context.read<FavoriteCubit>();
                                    context.read<LoginCubit>().userLogin(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          indexCubit: indexCubit,
                                          collaborativeCubit:
                                              collaborativeCubit,
                                          profileCubit: profileCubit,
                                          cartCubit: cartCubit,
                                          favoriteCubit: favoriteCubit,
                                        );
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
        ),
      ),
    );
  }
}

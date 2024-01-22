import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/shared/utils.dart';
import 'package:techcart/shared/widgets/default_button.dart';
import 'package:techcart/shared/widgets/default_formfield.dart';
import 'package:techcart/ui/auth/login/widgets/signup_login_header.dart';
import 'package:techcart/shared/widgets/text_formfield_label.dart';
import 'package:techcart/ui/auth/signup/cubit/signup_cubit.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({
    super.key,
  });

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _birthdateController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(context.read<TechcartRepository>()),
      child: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupErrorState) {
            showToast(text: state.errorMessage, state: ToastStates.error);
          }
          if (state is SignupSuccessState) {
            clearAndNavigate(context, AppRoutes().login);
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Row(
                      children: [
                        Expanded(
                          child: SignupLoginHeader(
                            crossAlignment: CrossAxisAlignment.start,
                            text: "Login",
                            isCurrent: false,
                            onTap: () {
                              context.pushReplacementNamed(
                                  AppRoutes().loginAnimated);
                            },
                          ),
                        ),
                        const Expanded(
                          child: SignupLoginHeader(
                            crossAlignment: CrossAxisAlignment.end,
                            text: "Sign up",
                            isCurrent: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 98.0.w,
                    ),
                    const TextFormFieldLabel(
                      label: "Username",
                    ),
                    SizedBox(
                      height: 28.0.w,
                    ),
                    DefaultFormField(
                      controller: _usernameController,
                      hintText: "Your name",
                      icon: Icons.person_outline_outlined,
                      keyboardType: TextInputType.text,
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Username must not be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 28.0.w,
                    ),
                    const TextFormFieldLabel(
                      label: "Email",
                    ),
                    SizedBox(
                      height: 28.0.w,
                    ),
                    DefaultFormField(
                      controller: _emailController,
                      hintText: "example@gmail.com",
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
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
                      label: "Birthdate",
                    ),
                    SizedBox(
                      height: 28.0.w,
                    ),
                    Focus(
                      child: DefaultFormField(
                        controller: _birthdateController,
                        hintText: "1975-06-27",
                        icon: Icons.date_range_outlined,
                        readOnly: true,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Birthdate must not be empty";
                          }
                          return null;
                        },
                      ),
                      onFocusChange: (hasFocus) async {
                        if (hasFocus) {
                          try {
                            greyStatusBarTheme();
                            DateTime? birthDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.parse("2000-06-05"),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            String formmatedDate =
                                DateFormat("yyyy-MM-dd").format(birthDate!);
                            _birthdateController.text = formmatedDate;
                            // ignore: use_build_context_synchronously
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
                          } catch (e) {
                            whiteStatusBarTheme();
                            // ignore: use_build_context_synchronously
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
                            return;
                          }
                          whiteStatusBarTheme();
                          // ignore: use_build_context_synchronously
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                        }
                      },
                    ),
                    SizedBox(
                      height: 28.0.w,
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
                      textAlignVertical: TextAlignVertical.bottom,
                      hintText: "**************",
                      icon: Icons.lock_outline,
                      obsecureText: true,
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
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
                      height: 38.0.w,
                    ),
                    const TextFormFieldLabel(
                      label: "Confirm password",
                    ),
                    SizedBox(
                      height: 28.0.w,
                    ),
                    DefaultFormField(
                      controller: _passwordConfirmController,
                      hintText: "**************",
                      textAlignVertical: TextAlignVertical.bottom,
                      icon: Icons.lock_outline,
                      obsecureText: true,
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password must not be empty";
                        }
                        if (value != _passwordController.text) {
                          return "Password confirm field must be same as password field";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 66.0.w,
                    ),
                    BlocBuilder<SignupCubit, SignupState>(
                      builder: (context, state) {
                        if (state is! SignupLoadingState) {
                          return SizedBox(
                            width: double.infinity,
                            height: 115.0.w,
                            child: DefaultButton(
                              buttonText: "Signup",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<SignupCubit>().userSignup(
                                        username: _usernameController.text,
                                        email: _emailController.text,
                                        birthDate: _birthdateController.text,
                                        password: _passwordController.text,
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
                    )
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

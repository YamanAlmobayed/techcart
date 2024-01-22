import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/shared/utils.dart';

import 'package:techcart/shared/widgets/default_button.dart';
import 'package:techcart/shared/widgets/default_formfield.dart';
import 'package:techcart/shared/widgets/text_formfield_label.dart';
import 'package:techcart/ui/auth/password_reset/cubit/password_reset_cubit.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key, required this.verificationEmail});

  final String verificationEmail;

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PasswordResetCubit(context.read<TechcartRepository>()),
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
            title: Text(
              "Password reset",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0.w,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 58.0.w,
                    ),
                    Text(
                      "Your new password must be different from the password you used previosly",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34.0.w,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 58.0.w,
                    ),
                    const TextFormFieldLabel(
                      label: "Password",
                    ),
                    SizedBox(
                      height: 28.0.w,
                    ),
                    DefaultFormField(
                      controller: _passwordController,
                      hintText: "**************",
                      icon: Icons.lock_outline,
                      obsecureText: true,
                      textAlignVertical: TextAlignVertical.bottom,
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
                      icon: Icons.lock_outline,
                      obsecureText: true,
                      textAlignVertical: TextAlignVertical.bottom,
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
                      height: 67.0.w,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 117.0.w,
                      child: DefaultButton(
                        buttonText: "Save",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<PasswordResetCubit>()
                                .userPasswordReset(
                                  email: widget.verificationEmail,
                                  password: _passwordController.text,
                                );
                            clearAndNavigate(context, AppRoutes().login);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/shared/gen/assets.gen.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/shared/utils.dart';
import 'package:techcart/shared/widgets/default_button.dart';
import 'package:techcart/ui/auth/password_recovery_verification/widgets/otp_verification_form.dart';

// ignore: must_be_immutable
class PasswordRecoveryVerificationPage extends StatefulWidget {
  const PasswordRecoveryVerificationPage(
      {super.key,
      required this.verificationCode,
      required this.verificationEmail});

  final int verificationCode;
  final String verificationEmail;

  @override
  State<PasswordRecoveryVerificationPage> createState() =>
      _PasswordRecoveryVerificationPageState();
}

class _PasswordRecoveryVerificationPageState
    extends State<PasswordRecoveryVerificationPage> {
  final _pin1 = TextEditingController();
  final _pin2 = TextEditingController();
  final _pin3 = TextEditingController();
  final _pin4 = TextEditingController();
  final _pin5 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? _userEnteredVerificationCode;

  @override
  void dispose() {
    super.dispose();
    _pin1.dispose();
    _pin2.dispose();
    _pin3.dispose();
    _pin4.dispose();
    _pin5.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          "Verification",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0.w,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const $AssetsImagesGen().forgetPassword2.image(
                  fit: BoxFit.cover,
                  height: 450.0.w,
                ),
            SizedBox(
              height: 78.0.w,
            ),
            Text(
              "We Have Sent a code to the email you provided",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 38.0.sp,
              ),
            ),
            SizedBox(
              height: 155.0.w,
            ),
            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OTPVerificationForm(
                    controller: _pin1,
                    validator: (value) {
                      if (value!.isEmpty) return "";
                      return null;
                    },
                  ),
                  OTPVerificationForm(
                    controller: _pin2,
                    validator: (value) {
                      if (value!.isEmpty) return "";
                      return null;
                    },
                  ),
                  OTPVerificationForm(
                    controller: _pin3,
                    validator: (value) {
                      if (value!.isEmpty) return "";
                      return null;
                    },
                  ),
                  OTPVerificationForm(
                    controller: _pin4,
                    validator: (value) {
                      if (value!.isEmpty) return "";
                      return null;
                    },
                  ),
                  OTPVerificationForm(
                    controller: _pin5,
                    validator: (value) {
                      if (value!.isEmpty) return "";
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 57.0.w,
            ),
            SizedBox(
              width: double.infinity,
              height: 117.0.w,
              child: DefaultButton(
                buttonText: "Verify",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _userEnteredVerificationCode = int.parse(_pin1.text +
                        _pin2.text +
                        _pin3.text +
                        _pin4.text +
                        _pin5.text);
                    if (widget.verificationCode ==
                        _userEnteredVerificationCode) {
                      context.pushNamed(AppRoutes().passwordReset,
                          pathParameters: {
                            'verificationEmail': widget.verificationEmail
                          });
                    } else {
                      showToast(
                          text: "The code you've entered is wrong",
                          state: ToastStates.error);
                    }
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}

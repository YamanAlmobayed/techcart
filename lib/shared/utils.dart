import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/ui/setup_finder/cubit/setupfinder_cubit.dart';

void quizGoBackDialog(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black87,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'If you go back the progress you made in the quiz will be gone.\n Are your sure you want to go back?',
              style: TextStyle(color: Colors.white, fontSize: 30.0.sp),
            ),
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('No'),
              ),
              SizedBox(
                width: 20.0.w,
              ),
              OutlinedButton(
                onPressed: () {
                  context.read<SetupfinderCubit>().currentAnswer = '0';
                  context.pop();
                  context.pushReplacementNamed(AppRoutes().setupFinder);
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        ],
      ),
    );

void clearAndNavigate(BuildContext context, String path) {
  while (context.canPop()) {
    context.pop();
  }
  context.pushReplacementNamed(path);
}

void showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { success, error, warning }

Color? chooseToastColor(ToastStates state) {
  Color? color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

void greyStatusBarTheme() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.grey[600],
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.grey[600],
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

void whiteStatusBarTheme() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:techcart/shared/router/routes.dart';
import 'package:techcart/shared/utils.dart';
import 'package:techcart/ui/categories/cubit/categories_cubit.dart';
import 'package:techcart/ui/setup_finder/cubit/setupfinder_cubit.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    final setupfinderCubit = context.read<SetupfinderCubit>();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => quizGoBackDialog(context),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              quizGoBackDialog(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(
            'Quiz',
            style: TextStyle(
              fontSize: 38.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<SetupfinderCubit, SetupfinderState>(
            builder: (context, state) {
              if (state is GetQuestionLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetOutputSuccess) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        state.output.recommendation!,
                        style: TextStyle(
                          fontSize: 35.0.sp,
                        ),
                      ),
                      SizedBox(
                        height: 50.0.w,
                      ),
                      ConditionalBuilder(
                        condition: state.output.outputType == 'category',
                        builder: (context) => Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: state.output.categories!
                                .map(
                                  (category) => MaterialButton(
                                    onPressed: () {
                                      final categoryProducts = context
                                          .read<CategoriesCubit>()
                                          .getCategoryProducts(
                                              categoryName: category);
                                      context.pushNamed(
                                        AppRoutes().category,
                                        pathParameters: {'title': category},
                                        extra: categoryProducts,
                                      );
                                    },
                                    color: Colors.blue,
                                    height: 100.0.w,
                                    minWidth: 300.0.w,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      category,
                                      style: TextStyle(
                                        fontSize: 35.0.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        fallback: (context) => MaterialButton(
                          onPressed: () {
                            context.pushNamed(
                              AppRoutes().product,
                              extra: state.output.product,
                            );
                          },
                          color: Colors.blue,
                          height: 100.0.w,
                          minWidth: 300.0.w,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            state.output.product!.name!,
                            style: TextStyle(
                              fontSize: 35.0.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200.0.w,
                      width: double.maxFinite,
                      child: Text(
                        setupfinderCubit.question.qustion!,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 40.0.sp,
                        ),
                      ),
                    ),
                    ...setupfinderCubit.question.answers!.asMap().entries.map(
                          (answer) => RadioListTile(
                            title: Text(answer.value),
                            value: answer.key.toString(),
                            groupValue: setupfinderCubit.currentAnswer,
                            onChanged: (value) {
                              setupfinderCubit.changeAnswer(value!);
                            },
                          ),
                        ),
                    const Spacer(),
                    MaterialButton(
                      onPressed: () {
                        String answer =
                            (int.parse(setupfinderCubit.currentAnswer) + 1)
                                .toString();
                        context
                            .read<SetupfinderCubit>()
                            .addQuizAnsewr(answer: answer);
                      },
                      color: Colors.blue,
                      height: 100.0.w,
                      minWidth: 300.0.w,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 35.0.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techcart/shared/gen/assets.gen.dart';
import 'package:techcart/ui/index/cubit/index_cubit.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const $AssetsImagesGen().logo.image(
              height: 100.w,
              width: 250.w,
            ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        currentIndex: context.watch<IndexCubit>().currentIndex,
        items: context.read<IndexCubit>().items,
        onTap: (index) {
          context.read<IndexCubit>().bottomNavBarChangeIndex(index);
        },
      ),
      body: context
          .read<IndexCubit>()
          .screens[context.watch<IndexCubit>().currentIndex],
    );
  }
}

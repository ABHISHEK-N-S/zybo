import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:zybo/bloc/home/home_bloc.dart';
import 'package:zybo/bloc/home/home_state.dart';
import 'package:zybo/style/app_colors.dart';
import 'package:zybo/style/text_styles.dart';
import 'package:zybo/widgets/bottom_nav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.selectedIndex != 2) {
          context.read<HomeBloc>().add(SelectTab(2));
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(50),
                KStyles().bold(text: "My Profile", size: 25, color: AppColors.black),
                const Gap(10),
                KStyles().reg(text: "Name", size: 15, color: AppColors.black),
                const Gap(10),
                KStyles().bold(text: "John Mathew", size: 20, color: AppColors.black),
                const Gap(10),
                KStyles().reg(text: "Phone", size: 15, color: AppColors.black),
                const Gap(10),
                KStyles().bold(text: "4212123422", size: 20, color: AppColors.black),
              ],
            ),
          ),
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}

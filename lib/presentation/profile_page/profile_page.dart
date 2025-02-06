import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zybo/style/text_styles.dart';
import 'package:zybo/widgets/bottom_nav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(50),
          KStyles().bold(text: "My Profile", size: 15),
          const Gap(10),
          KStyles().bold(text: "Name", size: 10),
          const Gap(10),
          KStyles().bold(text: "John Mathew", size: 12),
          const Gap(10),
          KStyles().bold(text: "Phone", size: 10),
          const Gap(10),
          KStyles().bold(text: "4212123422", size: 12),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

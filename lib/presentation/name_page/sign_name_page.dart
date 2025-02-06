import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zybo/presentation/home_page/home_page.dart';
import 'package:zybo/style/app_colors.dart';
import 'package:zybo/widgets/custom_button.dart';

class SignNamePage extends StatelessWidget {
  const SignNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(50),
            Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.arrow_back, size: 24)),
            const Gap(20),
            TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter your Name',
              ),
            ),
            const Gap(20),
            CustomButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                text: "Submit")
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:zybo/bloc/otp/otp_bloc.dart';
import 'package:zybo/bloc/otp/otp_event.dart';
import 'package:zybo/bloc/otp/otp_state.dart';
import 'package:zybo/presentation/otp_page/otp_page.dart';
import 'package:zybo/style/app_colors.dart';
import 'package:zybo/global_widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return BlocBuilder<OtpBloc, OtpState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Gap(50),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const Gap(8),
                  const Text(
                    "Let's Connect with Lorem Ipsum..!",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const Gap(24),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '+91',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: controller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Phone',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(24),
                CustomButton(
  onTap: () {
    final phoneNumber = '+91${controller.text.trim()}';
    context.read<OtpBloc>().add(SendOtpEvent(phoneNumber));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OTPVerificationScreen(phoneNumber: phoneNumber),
      ),
    );
  },
  text: "Continue",
),
                  const Gap(16),
                  const Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'By Continuing you accepting the ',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        children: [
                          TextSpan(
                            text: 'Terms of Use & Privacy Policy',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

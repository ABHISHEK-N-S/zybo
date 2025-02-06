// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:zybo/presentation/name_page/sign_name_page.dart';
// import 'package:zybo/style/app_colors.dart';
// import 'package:zybo/widgets/custom_button.dart';

// class OTPVerificationScreen extends StatelessWidget {
//   const OTPVerificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Gap(50),
//               Container(
//                   height: 40,
//                   width: 40,
//                   decoration: const BoxDecoration(
//                     color: AppColors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 8,
//                         spreadRadius: 2,
//                         offset: Offset(2, 2),
//                       ),
//                     ],
//                   ),
//                   child: const Icon(Icons.arrow_back, size: 24)),
//               const Gap(20),
//               const Text(
//                 "OTP VERIFICATION",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const Gap(8),
//               const Text(
//                 "Enter the OTP sent to - +91-8976500001",
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//               ),
//               const Gap(12),
//               const Text(
//                 "OTP is 4749",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//               const Gap(12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   4,
//                   (index) => Container(
//                     height: 50,
//                     width: 50,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.black26),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Text(
//                       "2",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ).expand((widget) => [widget, const Gap(10)]).toList()
//                   ..removeLast(),
//               ),
//               const Gap(12),
//               const Center(
//                 child: Text(
//                   "00:120 Sec",
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                 ),
//               ),
//               const Gap(8),
//               const Center(
//                 child: Text.rich(
//                   TextSpan(
//                     text: "Don't receive code? ",
//                     style: TextStyle(fontSize: 14),
//                     children: [
//                       TextSpan(
//                         text: "Re-send",
//                         style: TextStyle(
//                           color: Colors.green,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const Gap(20),
//               CustomButton(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const SignNamePage(),
//                       ),
//                     );
//                   },
//                   text: "Submit"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async'; // For the timer

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:zybo/bloc/otp/otp_bloc.dart';
import 'package:zybo/bloc/otp/otp_state.dart';
import 'package:zybo/presentation/name_page/sign_name_page.dart';
import 'package:zybo/style/app_colors.dart';
import 'package:zybo/global_widgets/custom_button.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OTPVerificationScreen({super.key, required this.phoneNumber});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());

  Timer? _timer;
  int _remainingTime = 120; // Timer set to 120 seconds

  @override
  void initState() {
    super.initState();
    // Start the timer when the screen is loaded
    _startTimer();
    _fetchOtp(); // Fetch OTP once the screen loads
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        _timer?.cancel();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  void _fetchOtp() {
    // Fetch OTP from the server (simulating here)
    // Once OTP is fetched, autofill the OTP in the TextEditingController
    String fetchedOtp = '1234'; // This would come from the response
    for (int i = 0; i < 4; i++) {
      otpControllers[i].text = fetchedOtp[i]; // Auto-fill OTP
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Don't forget to cancel the timer
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpBloc, OtpState>(
      listener: (context, state) {
        if (state.status == OtpStatus.verified) {
          // Navigate to next screen
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SignNamePage(),
            ),
          );
        } else if (state.status == OtpStatus.newUser) {
          // Navigate to registration screen
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SignNamePage(),
            ),
          );
        } else if (state.status == OtpStatus.error) {
          // Show error dialog
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state.errorMessage ?? 'OTP Verification Failed')),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
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
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const Gap(20),
                  const Text(
                    "OTP VERIFICATION",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Gap(8),
                  Text(
                    "Enter the OTP sent to - ${widget.phoneNumber}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextField(
                          controller: otpControllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(12),
                  Center(
                    child: Text(
                      "00:${_remainingTime.toString().padLeft(3, '0')} Sec",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Gap(8),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: "Don't receive code? ",
                        style: const TextStyle(fontSize: 14),
                        children: [
                          TextSpan(
                            text: "Re-send",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              decoration: state.status == OtpStatus.loading
                                  ? null
                                  : TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  CustomButton(
                      text: "submit",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignNamePage()));
                      }
                      // state.status == OtpStatus.loading
                      //     ? null
                      //     : () {
                      //         String otp = otpControllers
                      //             .map((controller) => controller.text)
                      //             .join();

                      //         context
                      //             .read<OtpBloc>()
                      //             .add(VerifyOtpEvent(widget.phoneNumber, otp));

                      //       },
                      // text: "Submit",
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

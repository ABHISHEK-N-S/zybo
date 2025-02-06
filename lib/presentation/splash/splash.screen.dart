import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zybo/presentation/mobile_login_page/login_page.dart';

import '../../bloc/splash/splash_bloc.dart';
import '../../utils/enums.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.loadingStatus == LoadingStatus.success) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ));
          }
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //!----(app logo)

              // Animation wrapper around the SVG
              Animate(
                child: SizedBox(
                  height: 40,
                  width: 125,
                  child: SvgPicture.asset(
                    "assets/svg/logosplash.svg",
                    semanticsLabel: "App Logo", 
                  ),
                ).animate().fadeIn(duration: 300.ms).scale(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

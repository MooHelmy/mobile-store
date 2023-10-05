import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:elkhwaga_stor/app_images.dart';
import 'package:elkhwaga_stor/feature/Represntation/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../const/constants.dart';

class MainSplash extends StatelessWidget {
  const MainSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(color: kmainA),
      child: AnimatedSplashScreen(
          splashIconSize: 360,
          animationDuration: const Duration(seconds: 2),
          pageTransitionType: PageTransitionType.bottomToTop,
          splashTransition: SplashTransition.scaleTransition,
          splash: Column(
            children: [
              const CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage(Assets.imagesViewImageHelmyy),
              ),
              const SizedBox(
                height: 2,
              ),
              Expanded(
                  child: AnimatedSplashScreen(
                      animationDuration: const Duration(seconds: 2),
                      pageTransitionType: PageTransitionType.bottomToTop,
                      splashTransition: SplashTransition.slideTransition,
                      splash: const Text(
                        ' Eng:Helmy ',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      nextScreen: const splash_view()))
            ],
          ),
          nextScreen: const splash_view()),
    );
  }
}

import "package:ai_integration_project/pages/home_page.dart";
import "package:flutter/material.dart";
import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:page_transition/page_transition.dart";

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      splash: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Splash Screen",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ],
      ),
      animationDuration: const Duration(seconds: 1),
      duration: 2000,
      nextScreen: const HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
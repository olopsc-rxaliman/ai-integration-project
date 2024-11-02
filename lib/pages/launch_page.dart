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
      splashIconSize: double.infinity,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/resources/images/alt-app-logo.png',
            scale: 8,
            isAntiAlias: true,
          ),
          const Text(
            "AI Learn",
            style: TextStyle(
              fontFamily: 'LeagueSpartan',
              color: Color(0xFF00adff),
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Powered by ",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              const Text(
                "Google Gemini ",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'lib/resources/images/gemini.png',
                scale: 17,
                isAntiAlias: true,
              ),
            ],
          ),
        ],
      ),
      animationDuration: const Duration(seconds: 1),
      duration: 3000,
      nextScreen: const HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}

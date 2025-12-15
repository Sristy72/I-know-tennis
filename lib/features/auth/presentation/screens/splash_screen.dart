
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding_screen_one.dart';


class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});


  // final controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// === Background Full Image ===
          SizedBox.expand(
            child: Image.asset('assets/images/Splash_screen.png', fit: BoxFit.cover),
          ),

          /// === Foreground Content ===
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // --- Texts above button ---
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 150,
                ), // moves texts upward
                child: Column(
                  // children: [
                  //   Image.asset(
                  //     'assets/images/lakshmanLogo.png', // path to your logo image
                  //     height: 30,
                  //     // width: 80, // adjust size as needed
                  //     // fit: BoxFit.contain,
                  //   ),
                  
                    
                  // ],
                ),
              ),

              // --- Circular arrow button ---
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xFF005DFF),
                    size: 22,
                  ),
                  onPressed: () {
                    Get.to(()=> OnboardingScreen());
                    // Get.to(
                    //   () => const HomeScreen(),
                    //   transition: Transition.fadeIn,
                    //   duration: const Duration(milliseconds: 600),
                    // );
                  },
                ),
              ),

              const SizedBox(height: 80), // padding from bottom
            ],
          ),
        ],
      ),
    );
  }
}

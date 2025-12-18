

import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_buttoms.dart';
import '../controller/onboarding_controller.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true,
      body: SafeArea(
        child: Column(
          children: [
            /// TOP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: Get.back,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(()=>  LoginScreen());

                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 45),

            /// TITLE
            Obx(
              () => Text(
                controller.pages[controller.currentPage.value].title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// SUBTITLE
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  controller.pages[controller.currentPage.value].description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// IMAGE CARD (EXACT SIZE)
            Obx(
              () => Container(
                width: 327,
                height: 218,
                // padding: const EdgeInsets.all(12),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(16),
                // ),
                child: Image.asset(
                  controller.pages[controller.currentPage.value].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const Spacer(),

            /// PROGRESS INDICATOR
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(controller.totalPages, (index) {
                  final isActive = index == controller.currentPage.value;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: isActive ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.blueAccent : Colors.white24,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 24),

            /// NEXT BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PrimaryButton(
                height: 52,
                borderRadius: 12,
                isGradient: false, // disable gradient
                backgroundColor: const Color(0xFF2058E6),
                onPressed: controller.nextPage,
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

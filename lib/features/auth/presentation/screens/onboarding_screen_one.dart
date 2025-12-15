// import 'package:flutter/material.dart';
// import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
// import 'package:get/get.dart';
// import '../controller/onboarding_controller.dart';

// class OnboardingScreen extends StatelessWidget {
//   OnboardingScreen({super.key});

//   final controller = Get.put(OnboardingController());

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffold(
//       removePadding: true,
//       body:
//       Container(
//         width: double.infinity,
//         height: double.infinity,
//         // decoration: const BoxDecoration(
//         //   gradient: LinearGradient(
//         //     begin: Alignment.topCenter,
//         //     end: Alignment.bottomCenter,
//         //     colors: [
//         //       Color(0xFF0E3C8A),
//         //       Color(0xFF0B2F6B),
//         //     ],
//         //   ),
//         // ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               /// TOP BAR
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Icon(Icons.arrow_back_ios, color: Colors.white),
//                     const Text(
//                       "Skip",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     )
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 40),

//               /// TITLE
//               const Text(
//                 "Do you Know Tennis?",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),

//               const SizedBox(height: 12),

//               /// SUBTITLE
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 32),
//                 child: Text(
//                   "Test your tennis knowledge with these fun, free quizzes. Choose a quiz about serving, foot faults, hindrances, and more.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: 14,
//                     height: 1.5,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 30),

//               /// IMAGE CARD (UPLOAD YOUR IMAGE HERE)
//               Container(
//                 width: 327,
//                 height: 218,
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Image.asset(
//                   "assets/images/Jumping_image .png", // <-- replace with your image
//                   fit: BoxFit.contain,
//                 ),
//               ),

//               const Spacer(),

//               /// PROGRESS INDICATOR (FIGMA STYLE)
//               Obx(
//                 () => Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(
//                     controller.totalPages,
//                     (index) {
//                       final isActive =
//                           index == controller.currentPage.value - 1;
//                       return AnimatedContainer(
//                         duration: const Duration(milliseconds: 300),
//                         margin: const EdgeInsets.symmetric(horizontal: 4),
//                         width: isActive ? 20 : 8,
//                         height: 8,
//                         decoration: BoxDecoration(
//                           color: isActive
//                               ? Colors.blueAccent
//                               : Colors.white24,
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               /// NEXT BUTTON
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 52,
//                   child: ElevatedButton(
//                     onPressed: controller.nextPage,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF2E6BFF),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       "Next",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_buttoms.dart';
import '../controller/onboarding_controller.dart';

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
                    // onTap: controller.skip,
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
                  fontWeight: FontWeight.w700,
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

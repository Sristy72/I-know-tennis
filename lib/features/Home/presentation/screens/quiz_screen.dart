import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/app_scaffold.dart';
import '../controller/home_controller.dart';
import '../widget/quiz_card_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _QuizHeader(),
            const SizedBox(height: 12),
            Expanded(child: _QuizSection()),
          ],
        ),
      ),
    );
  }
}

class _QuizHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Find a quiz",
            style: TextStyle(
              fontSize: 18,

              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Join thousands of players who learn the rules of tennis using iKnowTennis quizzes. "
            "Our fun and entertaining quizzes are designed to help players learn the rules of the "
            "game quickly and easily.",
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
// class _QuizSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<HomeController>();

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Obx(() {
//         final quizList = controller.quizCat.value;

//         return GridView.builder(
//           itemCount: quizList.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 14,
//             mainAxisSpacing: 14,
//             childAspectRatio: 0.58,
//           ),
//           itemBuilder: (_, i) {
//             final isProLocked = i != 0; // 👈 only first item is free

//             return GestureDetector(
//               onTap: () {
//                 if (isProLocked) {
//                   _showProDialog(context);
//                 } 
//                 else {
//                   // navigate to quiz detail or play quiz
//                   // controller.openQuiz(quizList[i]);
//                 }
//               },
//               child: Stack(
//                 children: [
//                   QuizCard(quiz: quizList[i]),

//                   // Add overlay for locked quizzes
//                   if (isProLocked)
//                     Positioned.fill(
//                       child: Container(
//                         color: Colors.black.withOpacity(0.5),
//                         child: const Center(
//                           child: Icon(
//                             Icons.lock,
//                             color: Colors.white,
//                             size: 40,
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }

//   void _showProDialog(BuildContext context) {
//     Get.defaultDialog(
//       title: "Pro Version Required",
//       middleText: "Unlock all quizzes by upgrading to the Pro version.",
//       confirmTextColor: Colors.white,
//       onConfirm: () {
//         Get.back(); // close dialog
//         Get.toNamed('/payment'); // navigate to payment screen
//       },
//       onCancel: () {},
//       textConfirm: "Upgrade",
//       textCancel: "Cancel",
//     );
//   }
// }


class _QuizSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        final quizList = controller.quizCat.value;

        return GridView.builder(
          itemCount: quizList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.58, // 👈 taller cards
          ),

          itemBuilder: (_, i) => QuizCard(quiz: quizList[i]),
        );
      }),
      // Obx(
      //   () => GridView.builder(
      //     itemCount: controller.quizzes.length,
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //       crossAxisSpacing: 14,
      //       mainAxisSpacing: 14,
      //       childAspectRatio: .65,
      //     ),
      //     itemBuilder: (_, i) => QuizCard(quiz: controller.quizzes[i]),
      //   ),
      // ),
    );
  }
}

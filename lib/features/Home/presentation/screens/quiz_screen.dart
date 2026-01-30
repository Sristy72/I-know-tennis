import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../profile/screens/subscription_screen.dart';
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

class _QuizSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        final allQuizzes = controller.quizCat.value;

        // Sort: unlocked (false/null) FIRST, then locked (true)
        final sortedQuizzes = allQuizzes.toList()
          ..sort((a, b) {
            final aLocked = a.isLocked ?? false;
            final bLocked = b.isLocked ?? false;

            // unlocked before locked
            if (!aLocked && bLocked) return -1;
            if (aLocked && !bLocked) return 1;
            return 0; // keep original order within same group
          });

        if (sortedQuizzes.isEmpty) {
          return const Center(
            child: Text(
              "No quizzes available",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          );
        }

        return GridView.builder(
          itemCount: sortedQuizzes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.58,
          ),
          itemBuilder: (_, index) {
            final quiz = sortedQuizzes[index];
            final isLocked = quiz.isLocked ?? false;

            return GestureDetector(
              onTap: () {
                if (isLocked) {
                  _showProDialog(context);
                } else {
                  // Navigate to quiz detail or start quiz
                  // Example:
                  // Get.to(() => QuizDetailScreen(quiz: quiz));
                  // or controller.startQuiz(quiz);
                }
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Main quiz card
                  QuizCard(quiz: quiz),

                  // Overlay for locked categories
                  if (isLocked)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.55),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Icon(Icons.lock, color: Colors.white, size: 42),
                            // SizedBox(height: 8),
                            // Text(
                            //   "Locked",
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  void _showProDialog(BuildContext context) {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: "",
      titlePadding: EdgeInsets.zero, // remove default title padding
      contentPadding: EdgeInsets.zero, // remove default content padding
      content: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ), // overall card padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(height: 8), // spacing above title
              Center(
                child: Text(
                  "Pro Version Required",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 8), // spacing between title and message
              Center(
                child: Text(
                  "Unlock all quizzes by upgrading to the Pro version.",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16), // spacing between text and buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 16), // space between buttons
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2058E6),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                        Get.to(() => SubscriptionScreen());
                      },
                      child: Text(
                        "Upgrade",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _QuizSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<HomeController>();
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Obx(() {
//         final quizList = controller.quizCat.value;
//
//         return GridView.builder(
//           itemCount: quizList.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 14,
//             mainAxisSpacing: 14,
//             childAspectRatio: 0.58, // 👈 taller cards
//           ),
//
//           itemBuilder: (_, i) => QuizCard(quiz: quizList[i]),
//         );
//       }),
//       // Obx(
//       //   () => GridView.builder(
//       //     itemCount: controller.quizzes.length,
//       //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       //       crossAxisCount: 2,
//       //       crossAxisSpacing: 14,
//       //       mainAxisSpacing: 14,
//       //       childAspectRatio: .65,
//       //     ),
//       //     itemBuilder: (_, i) => QuizCard(quiz: controller.quizzes[i]),
//       //   ),
//       // ),
//     );
//   }
// }

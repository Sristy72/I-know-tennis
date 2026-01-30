import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/features/Home/presentation/screens/quiz_screen.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/resend_otp_response_model.dart';
import 'package:flutter_iknow_tennis/features/other/presentation/screens/dashboard_screen.dart';
import 'package:flutter_iknow_tennis/features/profile/screens/subscription_screen.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../other/presentation/controller/dashboard_controller.dart';
import '../../../profile/controller/profile_controller.dart';
import '../controller/home_controller.dart';
import '../widget/bottom_app_bar.dart';
import '../widget/quiz_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<HomeController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    controller.fetchCategories();
    profileController.fetchLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _Header(),
              const SizedBox(height: 16),
              _ProgressCard(),
              const SizedBox(height: 20),
              _QuizSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final ProfileController profileController = Get.find<ProfileController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        final user = profileController.userInfo.value;
        final String displayName = user?.fullName ?? 'Loading...';
        final String avatarUrl = user?.avatar ?? '';

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side: Avatar and Name
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade800,
                  backgroundImage: avatarUrl.isNotEmpty
                      ? NetworkImage(avatarUrl)
                      : AssetImage('assets/images/avatar.png'),
                  // child: avatarUrl.isEmpty
                  //     ? const Icon(
                  //         Icons.person,
                  //         size: 30,
                  //         color: Colors.white70,
                  //       )
                  //     : null,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const Text(
                      'Welcome back',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Right side: Notification icon
            IconButton(
              onPressed: () {
                // Handle notification tap here
                print('Notification tapped');
              },
              icon: const Icon(
                Icons.notifications_none,
                size: 28,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF709FFF), Color(0xFF1976D2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Progress Stats', // This is your title
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16), // Space between title and stats
            Obx(() {
              final leaderboard = profileController.fetchLeader.value;

              if (leaderboard == null) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                );
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStat(
                    leaderboard.quizzesPlayed.toString(),
                    'Quizzes',
                    const Color(0xFF22D3EE),
                  ),
                  _buildStat(
                    leaderboard.points.toString(),
                    'Points',
                    const Color(0xFFFFC34D),
                  ),
                  _buildStat(
                    leaderboard.yourPosition?.toString() ?? '-',
                    'Your position',
                    const Color(0xFFF76C5E),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final String title;
  final String value;

  const _ProgressItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }
}

Widget _buildStat(String value, String label, Color color) {
  return Column(
    children: [
      Text(
        value,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}

// class _QuizSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<HomeController>();

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// Header
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Find a quiz',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFFFFFFFF),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.offAll(() => DashboardScreen(initialIndex: 1));
//                 },
//                 child: const Text(
//                   'See All',
//                   style: TextStyle(
//                     color: Color(0xFF3F7FFF),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 12),

//           /// Grid (ONLY 4 ITEMS)
//           Obx(() {
//             final allQuizzes = controller.quizCat;
//             final previewQuizzes = allQuizzes.take(4).toList(); // ⭐ LIMIT HERE

//             if (previewQuizzes.isEmpty) {
//               return const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 40),
//                 child: Center(
//                   child: Text(
//                     "No quizzes available",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               );
//             }

//             return GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: previewQuizzes.length, // ✅ max 4
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 14,
//                 mainAxisSpacing: 14,
//                 childAspectRatio: 0.58,
//               ),
//               itemBuilder: (_, i) => QuizCard(quiz: previewQuizzes[i]),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
class _QuizSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Find a quiz',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.offAll(() => DashboardScreen(initialIndex: 1));
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: Color(0xFF3F7FFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Grid (ONLY 4 ITEMS)
          Obx(() {
            final allQuizzes = controller.quizCat;

            // Sort: unlocked (false/null) FIRST, then locked (true)
            final sortedQuizzes = allQuizzes.toList()
              ..sort((a, b) {
                final aLocked = a.isLocked ?? false;
                final bLocked = b.isLocked ?? false;

                // unlocked before locked
                if (!aLocked && bLocked) return -1;
                if (aLocked && !bLocked) return 1;
                return 0;
              });

            final previewQuizzes = sortedQuizzes.take(4).toList();

            if (previewQuizzes.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Text(
                    "No quizzes available",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: previewQuizzes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.58,
              ),
              itemBuilder: (_, index) {
                final quiz = previewQuizzes[index];
                final isLocked = quiz.isLocked ?? false;

                return GestureDetector(
                  onTap: () {
                    if (isLocked) {
                      _showProDialog(context);
                    } else {
                      // Normal action: go to quiz detail or category screen
                      Get.toNamed('/quiz-detail', arguments: quiz);
                      // or: Get.to(() => QuizDetailScreen(quiz: quiz));
                    }
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // The original card
                      QuizCard(quiz: quiz),

                      // Greyout + lock overlay for locked categories
                      if (isLocked)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.50),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Icon(
                                //   Icons.lock,
                                //   color: Colors.white70,
                                //   size: 36,
                                // ),
                                SizedBox(height: 6),
                                // Text(
                                //   'Locked',
                                //   style: TextStyle(
                                //     color: Colors.white70,
                                //     fontSize: 14,
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
        ],
      ),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // overall card padding
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
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
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
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// Header
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Find a quiz',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFFFFFFFF),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.offAll(() => DashboardScreen(initialIndex: 1));
//                 },
//                 child: const Text(
//                   'See All',
//                   style: TextStyle(
//                     color: Color(0xFF3F7FFF),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 12),

//           /// Grid (ONLY 4 ITEMS)
//           Obx(() {
//             final allQuizzes = controller.quizCat;

//             // Sort: locked first (true), then unlocked (false)
//             final sortedQuizzes = allQuizzes.toList()
//               ..sort((a, b) {
//                 final aLocked = a.isLocked ?? false;
//                 final bLocked = b.isLocked ?? false;

//                 // ── Changed logic: unlocked first ──
//                 if (!aLocked && bLocked) return -1; // unlocked before locked
//                 if (aLocked && !bLocked) return 1; // locked after unlocked
//                 return 0;
//               });

//             final previewQuizzes = sortedQuizzes.take(4).toList();

//             if (previewQuizzes.isEmpty) {
//               return const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 40),
//                 child: Center(
//                   child: Text(
//                     "No quizzes available",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               );
//             }

//             return GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: previewQuizzes.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 14,
//                 mainAxisSpacing: 14,
//                 childAspectRatio: 0.58,
//               ),
//               itemBuilder: (_, i) => QuizCard(quiz: previewQuizzes[i]),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }

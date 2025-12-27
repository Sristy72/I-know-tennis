import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/features/Home/presentation/screens/quiz_screen.dart';
import 'package:flutter_iknow_tennis/features/other/presentation/screens/dashboard_screen.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../other/presentation/controller/dashboard_controller.dart';
import '../../../profile/controller/profile_controller.dart';
import '../controller/home_controller.dart';
import '../widget/bottom_app_bar.dart';
import '../widget/quiz_card_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.fetchCategories();
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
                      : const AssetImage('assets/images/Container.png')
                            as ImageProvider,
                  child: avatarUrl.isEmpty
                      ? const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white70,
                        )
                      : null,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat('12', 'Quizzes', const Color(0xFF22D3EE)),
                _buildStat('850', 'Points', const Color(0xFFFFC34D)),
                _buildStat('1', 'Your position', const Color(0xFFF76C5E)),
              ],
            ),
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

// class _ProgressCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         padding: const EdgeInsets.all(16),

//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//             colors: [Color(0xFF709FFF), Color(0xFF1976D2)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),

//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _buildStat('12', 'Quizzes', const Color(0xFF22D3EE)),
//             _buildStat('850', 'Points', const Color(0xFFFFC34D)),
//             _buildStat('1', 'Your position', const Color(0xFFF76C5E)),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
            final previewQuizzes = allQuizzes.take(4).toList(); // ⭐ LIMIT HERE

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
              itemCount: previewQuizzes.length, // ✅ max 4
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.58,
              ),
              itemBuilder: (_, i) => QuizCard(quiz: previewQuizzes[i]),
            );
          }),
        ],
      ),
    );
  }
}

// class _QuizSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<HomeController>();

//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Find a quiz',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFFFFFFFF),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Get.find<DashboardController>().changeTab(1);
//                     Get.offAll(() => DashboardScreen(initialIndex: 1));
//                   },
//                   child: const Text(
//                     'See All',
//                     style: TextStyle(
//                       color: Color(0xFF3F7FFF),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Expanded(
//               child: Obx(() {
//                 final allQuizzes = controller.quizCat;
//                 final previewQuizzes = allQuizzes.take(4).toList();

//                 if (previewQuizzes.isEmpty) {
//                   return const Center(
//                     child: Text(
//                       "No quizzes available",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   );
//                 }

//                 return GridView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: previewQuizzes.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 14,
//                     mainAxisSpacing: 14,
//                     childAspectRatio: 0.65,
//                   ),
//                   itemBuilder: (_, i) => QuizCard(quiz: previewQuizzes[i]),
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

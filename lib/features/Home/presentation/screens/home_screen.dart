import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/features/Home/presentation/screens/quiz_screen.dart';
import 'package:flutter_iknow_tennis/features/other/presentation/screens/dashboard_screen.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../other/presentation/controller/dashboard_controller.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(),
            SizedBox(height: 16),
            _ProgressCard(),
            SizedBox(height: 20),
            _QuizSection(),
          ],
        ),
      ),
      // bottomNavigationBar: AppBottomNavBar(
      //   currentIndex: 0, // Change dynamically as needed
      //   onTap: (index) {
      //     // Handle navigation here, e.g., using Get.to() or setState
      //     print('Tapped index: $index');
      //   },
      // ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          const SizedBox(width: 12),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.userName.value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                const Text(
                  'Welcome back',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.notifications_none,
            size: 28,
            color: Color(0xFFFFFFFF),
          ),
        ],
      ),
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
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Color(0xFF4D82EBCC), Color(0xFF4D82EBCC)],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _ProgressItem(title: 'Quizzes', value: '12'),
            _ProgressItem(title: 'Points', value: '850'),
            _ProgressItem(title: 'Leaderboard', value: '1'),
          ],
        ),
      ),
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
//               children: const [
//                 Text(
//                   'Find a quiz',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFFFFFFFF),
//                   ),
//                 ),
//                 Text(
//                   'See All',
//                   style: TextStyle(
//                     color: Color(0xFF3F7FFF),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             // Remove the extra Expanded here
//             Expanded(
//               child: Obx(() {
//                 final quizList = controller.quizCat.value;

//                 if (quizList.isEmpty) {
//                   return const Center(child: Text("No quizzes available"));
//                 }

//                 return GridView.builder(
//                   itemCount: quizList.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 14,
//                     mainAxisSpacing: 14,
//                     childAspectRatio: 0.65,
//                   ),
//                   itemBuilder: (_, i) => QuizCard(quiz: quizList[i]),
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class _QuizSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      // Get.find<DashboardController>().changeTab(1);
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
            Expanded(
              child: Obx(() {
                final allQuizzes = controller.quizCat;
                final previewQuizzes = allQuizzes.take(4).toList();

                if (previewQuizzes.isEmpty) {
                  return const Center(
                    child: Text(
                      "No quizzes available",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: previewQuizzes.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (_, i) =>
                      QuizCard(quiz: previewQuizzes[i]),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

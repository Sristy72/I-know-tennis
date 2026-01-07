import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/features/Home/presentation/screens/home_screen.dart';
import 'package:flutter_iknow_tennis/features/other/presentation/screens/gain_screen.dart';
import 'package:flutter_iknow_tennis/features/profile/screens/profile_screen.dart';
import 'package:get/get.dart';

import '../../../Home/presentation/screens/quiz_screen.dart';
import '../../../leadership/presentation/screens/leader_board_screen.dart';
import '../controller/dashboard_controller.dart';
import '../widgets/bottom_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  final int initialIndex;

  const DashboardScreen({super.key, this.initialIndex = 0}); // This is fine

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}
// class _DashboardScreenState extends State<DashboardScreen> {
//   final controller = Get.put(DashboardController());

//   final List<Widget> _screens = [
//     HomeScreen(),
//     QuizScreen(),
//     const Center(child: Text('Gain Screen')),
//     const Center(child: Text('Profile Screen')),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     controller.currentIndex.value = widget.initialIndex;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Scaffold(
//           body: IndexedStack(
//             index: controller.currentIndex.value,
//             children: _screens,
//           ),
//           bottomNavigationBar: AppBottomNavBar(
//             currentIndex: controller.currentIndex.value,
//             onTabSelected: controller.changeTab,
//           ),
//         ));
//   }
// }

class _DashboardScreenState extends State<DashboardScreen> {
  late int _currentIndex;

  // Remove 'const' here because HomeScreen() is not a const widget
  final List<Widget> _screens = [
    HomeScreen(), // Removed Center for now, you can wrap if needed
     Center(child: QuizScreen()), // Placeholder
    const Center(child: GainScreen( )), // Placeholder
    const Center(child: ProfileScreen()), // Placeholder
    QuizScreen(), // Placeholder
    GainScreen(),
    ProfileScreen(), // Placeholder
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabSelected(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( // Better for preserving state across tabs
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected, // Match the parameter name in your widget
      ),
    );
  }
}
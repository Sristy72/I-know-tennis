import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_buttoms.dart';
import '../controller/leader_board_controller.dart';
import '../widgets/leader_board_app_bar.dart';
import '../widgets/leader_board_widget.dart';
import '../widgets/top_three_section_widgets.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final LeaderboardController controller = Get.put(LeaderboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/LeaderboardIcon.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                /// AppBar
                /// AppBar (always at top)
                // const LeaderboardAppBar(),

                /// Spacer between AppBar & podium
                const SizedBox(height: 24),

                /// Top 3 Section (pushed down properly)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: TopThreeAvatars(users: controller.topUsers),
                ),

                // const SizedBox(height: 5),

                /// Leaderboard List (starting from rank 4)
                Expanded(
                  child: Obx(
                    () => ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (_, i) =>
                          LeaderboardRow(user: controller.currentPageUsers[i]),
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemCount: controller.currentPageUsers.length,
                    ),
                  ),
                ),

                /// Pagination - aligned to bottom right, matching screenshot style
                Padding(
                  padding: const EdgeInsets.only(right: 16, bottom: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// Previous Arrow
                          GestureDetector(
                            onTap: controller.currentPage.value > 0
                                ? controller.previousPage
                                : null,
                            child: Container(
                              height: 22,
                              width: 22,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: controller.currentPage.value > 0
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Image.asset(
                                'assets/images/arrowbackIcon.png',
                                color: controller.currentPage.value > 0
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),

                          const SizedBox(width: 6),

                          /// Page 1
                          Container(
                            height: 22,
                            width: 22,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: controller.currentPage.value == 0
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: controller.currentPage.value == 0
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),

                          const SizedBox(width: 6),

                          /// Page 2
                          Container(
                            height: 22,
                            width: 22,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: controller.currentPage.value == 1
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Text(
                              '2',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: controller.currentPage.value == 1
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),

                          const SizedBox(width: 6),

                          /// Next Arrow
                          GestureDetector(
                            onTap:
                                controller.currentPage.value <
                                    controller.totalPages.value - 1
                                ? controller.nextPage
                                : null,
                            child: Container(
                              height: 22,
                              width: 22,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color:
                                    controller.currentPage.value <
                                        controller.totalPages.value - 1
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Image.asset(
                                'assets/images/arrowrightIcon.png',
                                color:
                                    controller.currentPage.value <
                                        controller.totalPages.value - 1
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // child: Obx(
                    //   () => Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       /// Previous button (triangle left)
                    //       GestureDetector(
                    //         onTap: controller.currentPage.value > 0
                    //             ? controller.previousPage
                    //             : null,
                    //         child: Container(
                    //           padding: const EdgeInsets.all(8),
                    //           decoration: BoxDecoration(
                    //             color: controller.currentPage.value > 0
                    //                 ? Colors.white.withOpacity(0.3)
                    //                 : Colors.transparent,
                    //             borderRadius: BorderRadius.circular(8),
                    //           ),
                    //           child: Image(
                    //             image: AssetImage(
                    //               'assets/images/arrowbackIcon.png',
                    //             ),
                    //             width: 16,
                    //             height: 16,
                    //           ),
                    //         ),
                    //       ),

                    //       /// Page indicators
                    //       // Container(
                    //       //   height: 18,
                    //       //   width: 18,
                    //       //   alignment: Alignment.center,
                    //       //   decoration: BoxDecoration(
                    //       //     color: Colors.white,
                    //       //     borderRadius: BorderRadius.circular(4),
                    //       //   ),
                    //       //   child: Text(
                    //       //     '${controller.currentPage.value}',
                    //       //     style: const TextStyle(
                    //       //       color: Color(0xFF212121),
                    //       //       fontSize: 12,
                    //       //       fontWeight: FontWeight.w500,
                    //       //     ),
                    //       //   ),
                    //       // ),

                    //       // const SizedBox(width: 8),
                    //       //     Container(
                    //       //   height: 18,
                    //       //   width: 18,
                    //       //   alignment: Alignment.center,
                    //       //   decoration: BoxDecoration(
                    //       //     color: Colors.white,
                    //       //     borderRadius: BorderRadius.circular(4),
                    //       //   ),
                    //       //   child: Text(
                    //       //     '${controller.totalPages.value}',
                    //       //     style: const TextStyle(
                    //       //       color: Color(0xFF212121),
                    //       //       fontSize: 12,
                    //       //       fontWeight: FontWeight.w500,
                    //       //     ),
                    //       //   ),
                    //       // ),
                    //       /// Page indicators
                    //       Container(
                    //         height: 18,
                    //         width: 18,
                    //         alignment: Alignment.center,
                    //         decoration: BoxDecoration(
                    //           color: controller.currentPage.value == 0
                    //               ? Colors
                    //                     .white // Current page
                    //               : Colors.transparent, // Other pages
                    //           borderRadius: BorderRadius.circular(4),
                    //           border: controller.currentPage.value == 0
                    //               ? null
                    //               : Border.all(
                    //                   color: Colors.white,
                    //                   width: 1,
                    //                 ), // Border for other pages
                    //         ),
                    //         child: Text(
                    //           '${controller.currentPage.value + 1}', // Make it 1-based index if needed
                    //           style: const TextStyle(
                    //             color: Color(0xFF212121),
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.w500,
                    //           ),
                    //         ),
                    //       ),

                    //       const SizedBox(width: 8),

                    //       Container(
                    //         height: 18,
                    //         width: 18,
                    //         alignment: Alignment.center,
                    //         decoration: BoxDecoration(
                    //           color:
                    //               controller.currentPage.value ==
                    //                   controller.totalPages.value - 1
                    //               ? Colors.white // Current page
                    //               : Colors.transparent, // Other pages
                    //           borderRadius: BorderRadius.circular(4),
                    //           border:
                    //               controller.currentPage.value ==
                    //                   controller.totalPages.value - 1
                    //               ? null
                    //               : Border.all(
                    //                   // color: Colors.white,
                    //                   width: 1,
                    //                 ), // Border for other pages
                    //         ),
                    //         child: Text(
                    //           '${controller.totalPages.value}',
                    //           style: const TextStyle(
                    //             color: Color(0xFF212121),
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.w500,
                    //           ),
                    //         ),
                    //       ),

                    //       /// Next button (triangle right)
                    //       GestureDetector(
                    //         onTap:
                    //             controller.currentPage.value <
                    //                 controller.totalPages.value - 1
                    //             ? controller.nextPage
                    //             : null,
                    //         child: Container(
                    //           padding: const EdgeInsets.all(8),
                    //           decoration: BoxDecoration(
                    //             color:
                    //                 controller.currentPage.value <
                    //                     controller.totalPages.value - 1
                    //                 ? Colors.white.withOpacity(0.3)
                    //                 : Colors.transparent,
                    //             borderRadius: BorderRadius.circular(8),
                    //           ),
                    //           child: Image(
                    //             image: AssetImage(
                    //               'assets/images/arrowrightIcon.png',
                    //             ),
                    //             width: 16,
                    //             height: 16,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),

                /// Share Button - full width at the very bottom
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: PrimaryButton(
                    height: 52,
                    borderRadius: 12,
                    isGradient: false,
                    backgroundColor: const Color(0xFF2058E6),
                    onPressed: () {},
                    child: const Text(
                      "Share with your friend",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class LeaderboardScreen extends StatefulWidget {
//   const LeaderboardScreen({super.key});

//   @override
//   State<LeaderboardScreen> createState() => _LeaderboardScreenState();
// }

// class _LeaderboardScreenState extends State<LeaderboardScreen> {
//   final LeaderboardController controller = Get.put(LeaderboardController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           /// Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/Leaderboard.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(height: 12),

//           SafeArea(
//             child: Column(
//               children: [
//                 /// AppBar
//                 const LeaderboardAppBar(),

//                 const SizedBox(height: 12),

//                 /// Top 3 Section (aligned to podium)
//                 // TopThreePodium(users: controller.topUsers),
//                 TopThreeAvatars(users: controller.topUsers),

//                 /// Add space before leaderboard rows
//                 const SizedBox(height: 9), // Adjust height as needed
//                 /// Leaderboard List
//                 Expanded(
//                   child: ListView.separated(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     itemBuilder: (_, i) =>
//                         LeaderboardRow(user: controller.leaderboard[i]),
//                     separatorBuilder: (_, __) => const SizedBox(height: 12),
//                     itemCount: controller.leaderboard.length,
//                   ),
//                 ),

//                 const SizedBox(height: 16),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

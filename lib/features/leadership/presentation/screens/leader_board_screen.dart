import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutx_core/flutx_core.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_buttoms.dart';
import '../controller/leader_board_controller.dart';
import '../widgets/leader_board_app_bar.dart';
import '../widgets/leader_board_widget.dart';
import '../widgets/top_three_section_widgets.dart';

// class LeaderboardScreen extends StatefulWidget {
//   const LeaderboardScreen({super.key});

//   @override
//   State<LeaderboardScreen> createState() => _LeaderboardScreenState();
// }

// class _LeaderboardScreenState extends State<LeaderboardScreen> {
//   final LeaderboardController controller = Get.find<LeaderboardController>();

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffold(
//       removePadding: true,
//       // backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           /// Background Image
//           // Positioned.fill(
//           //   child: Image.asset(
//           //     'assets/images/LeaderboardIcon.png',
//           //     fit: BoxFit.cover,
//           //   ),
//           // ),
//           SafeArea(
//             child: Column(
//               mainAxisSize: MainAxisSize.min, // make column take minimum height
//               children: [
//                 /// AppBar
//                 const LeaderboardAppBar(),

//                 /// Minimal spacing between AppBar & podium
//                 const SizedBox(height: 24), // reduce this value as needed
//                 /// Top 3 Section
//                 TopThreePodium(users: controller.topUsers),
//                 const SizedBox(height: 8),

//                 /// Leaderboard List (starting from rank 4)
//                 Expanded(
//                   child: Obx(
//                     () => ListView.separated(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       itemBuilder: (_, i) =>
//                           LeaderboardRow(user: controller.currentPageUsers[i]),
//                       separatorBuilder: (_, __) => const SizedBox(height: 12),
//                       itemCount: controller.currentPageUsers.length,
//                     ),
//                   ),
//                 ),

//                 /// Pagination - aligned to bottom right, matching screenshot style
//                 Padding(
//                   padding: const EdgeInsets.only(right: 16, bottom: 20),
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Obx(
//                       () => Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           /// Previous Arrow
//                           GestureDetector(
//                             onTap: controller.currentPage.value > 0
//                                 ? controller.previousPage
//                                 : null,
//                             child: Container(
//                               height: 22,
//                               width: 22,
//                               padding: const EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 color: controller.currentPage.value > 0
//                                     ? Colors.white
//                                     : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               child: Image.asset(
//                                 'assets/images/arrowbackIcon.png',
//                                 color: controller.currentPage.value > 0
//                                     ? Colors.black
//                                     : Colors.white,
//                               ),
//                             ),
//                           ),

//                           const SizedBox(width: 6),

//                           /// Page 1
//                           Container(
//                             height: 22,
//                             width: 22,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               color: controller.currentPage.value == 0
//                                   ? Colors.white
//                                   : Colors.transparent,
//                               borderRadius: BorderRadius.circular(6),
//                               border: Border.all(color: Colors.white, width: 1),
//                             ),
//                             child: Text(
//                               '1',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                                 color: controller.currentPage.value == 0
//                                     ? Colors.black
//                                     : Colors.white,
//                               ),
//                             ),
//                           ),

//                           const SizedBox(width: 6),

//                           /// Page 2
//                           Container(
//                             height: 22,
//                             width: 22,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               color: controller.currentPage.value == 1
//                                   ? Colors.white
//                                   : Colors.transparent,
//                               borderRadius: BorderRadius.circular(6),
//                               border: Border.all(color: Colors.white, width: 1),
//                             ),
//                             child: Text(
//                               '2',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                                 color: controller.currentPage.value == 1
//                                     ? Colors.black
//                                     : Colors.white,
//                               ),
//                             ),
//                           ),

//                           const SizedBox(width: 6),

//                           /// Next Arrow
//                           GestureDetector(
//                             onTap:
//                                 controller.currentPage.value <
//                                     controller.totalPages.value - 1
//                                 ? controller.nextPage
//                                 : null,
//                             child: Container(
//                               height: 22,
//                               width: 22,
//                               padding: const EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 color:
//                                     controller.currentPage.value <
//                                         controller.totalPages.value - 1
//                                     ? Colors.white
//                                     : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               child: Image.asset(
//                                 'assets/images/arrowrightIcon.png',
//                                 color:
//                                     controller.currentPage.value <
//                                         controller.totalPages.value - 1
//                                     ? Colors.black
//                                     : Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // child: Obx(
//                     //   () => Row(
//                     //     mainAxisSize: MainAxisSize.min,
//                     //     children: [
//                     //       /// Previous button (triangle left)
//                     //       GestureDetector(
//                     //         onTap: controller.currentPage.value > 0
//                     //             ? controller.previousPage
//                     //             : null,
//                     //         child: Container(
//                     //           padding: const EdgeInsets.all(8),
//                     //           decoration: BoxDecoration(
//                     //             color: controller.currentPage.value > 0
//                     //                 ? Colors.white.withOpacity(0.3)
//                     //                 : Colors.transparent,
//                     //             borderRadius: BorderRadius.circular(8),
//                     //           ),
//                     //           child: Image(
//                     //             image: AssetImage(
//                     //               'assets/images/arrowbackIcon.png',
//                     //             ),
//                     //             width: 16,
//                     //             height: 16,
//                     //           ),
//                     //         ),
//                     //       ),

//                     //       /// Page indicators
//                     //       // Container(
//                     //       //   height: 18,
//                     //       //   width: 18,
//                     //       //   alignment: Alignment.center,
//                     //       //   decoration: BoxDecoration(
//                     //       //     color: Colors.white,
//                     //       //     borderRadius: BorderRadius.circular(4),
//                     //       //   ),
//                     //       //   child: Text(
//                     //       //     '${controller.currentPage.value}',
//                     //       //     style: const TextStyle(
//                     //       //       color: Color(0xFF212121),
//                     //       //       fontSize: 12,
//                     //       //       fontWeight: FontWeight.w500,
//                     //       //     ),
//                     //       //   ),
//                     //       // ),

//                     //       // const SizedBox(width: 8),
//                     //       //     Container(
//                     //       //   height: 18,
//                     //       //   width: 18,
//                     //       //   alignment: Alignment.center,
//                     //       //   decoration: BoxDecoration(
//                     //       //     color: Colors.white,
//                     //       //     borderRadius: BorderRadius.circular(4),
//                     //       //   ),
//                     //       //   child: Text(
//                     //       //     '${controller.totalPages.value}',
//                     //       //     style: const TextStyle(
//                     //       //       color: Color(0xFF212121),
//                     //       //       fontSize: 12,
//                     //       //       fontWeight: FontWeight.w500,
//                     //       //     ),
//                     //       //   ),
//                     //       // ),
//                     //       /// Page indicators
//                     //       Container(
//                     //         height: 18,
//                     //         width: 18,
//                     //         alignment: Alignment.center,
//                     //         decoration: BoxDecoration(
//                     //           color: controller.currentPage.value == 0
//                     //               ? Colors
//                     //                     .white // Current page
//                     //               : Colors.transparent, // Other pages
//                     //           borderRadius: BorderRadius.circular(4),
//                     //           border: controller.currentPage.value == 0
//                     //               ? null
//                     //               : Border.all(
//                     //                   color: Colors.white,
//                     //                   width: 1,
//                     //                 ), // Border for other pages
//                     //         ),
//                     //         child: Text(
//                     //           '${controller.currentPage.value + 1}', // Make it 1-based index if needed
//                     //           style: const TextStyle(
//                     //             color: Color(0xFF212121),
//                     //             fontSize: 12,
//                     //             fontWeight: FontWeight.w500,
//                     //           ),
//                     //         ),
//                     //       ),

//                     //       const SizedBox(width: 8),

//                     //       Container(
//                     //         height: 18,
//                     //         width: 18,
//                     //         alignment: Alignment.center,
//                     //         decoration: BoxDecoration(
//                     //           color:
//                     //               controller.currentPage.value ==
//                     //                   controller.totalPages.value - 1
//                     //               ? Colors.white // Current page
//                     //               : Colors.transparent, // Other pages
//                     //           borderRadius: BorderRadius.circular(4),
//                     //           border:
//                     //               controller.currentPage.value ==
//                     //                   controller.totalPages.value - 1
//                     //               ? null
//                     //               : Border.all(
//                     //                   // color: Colors.white,
//                     //                   width: 1,
//                     //                 ), // Border for other pages
//                     //         ),
//                     //         child: Text(
//                     //           '${controller.totalPages.value}',
//                     //           style: const TextStyle(
//                     //             color: Color(0xFF212121),
//                     //             fontSize: 12,
//                     //             fontWeight: FontWeight.w500,
//                     //           ),
//                     //         ),
//                     //       ),

//                     //       /// Next button (triangle right)
//                     //       GestureDetector(
//                     //         onTap:
//                     //             controller.currentPage.value <
//                     //                 controller.totalPages.value - 1
//                     //             ? controller.nextPage
//                     //             : null,
//                     //         child: Container(
//                     //           padding: const EdgeInsets.all(8),
//                     //           decoration: BoxDecoration(
//                     //             color:
//                     //                 controller.currentPage.value <
//                     //                     controller.totalPages.value - 1
//                     //                 ? Colors.white.withOpacity(0.3)
//                     //                 : Colors.transparent,
//                     //             borderRadius: BorderRadius.circular(8),
//                     //           ),
//                     //           child: Image(
//                     //             image: AssetImage(
//                     //               'assets/images/arrowrightIcon.png',
//                     //             ),
//                     //             width: 16,
//                     //             height: 16,
//                     //           ),
//                     //         ),
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),
//                   ),
//                 ),

//                 /// Share Button - full width at the very bottom
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24),
//                   child: PrimaryButton(
//                     height: 52,
//                     borderRadius: 12,
//                     isGradient: false,
//                     backgroundColor: const Color(0xFF2058E6),
//                     onPressed: () {},
//                     child: const Text(
//                       "Share with your friend",
//                       style: TextStyle(
//                         color: Color(0xFFFFFFFF),
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LeaderboardScreen extends StatefulWidget {
//   const LeaderboardScreen({super.key});

//   @override
//   State<LeaderboardScreen> createState() => _LeaderboardScreenState();
// }

// class _LeaderboardScreenState extends State<LeaderboardScreen> {
//   final controller = Get.find<LeaderboardController>();
//   @override
//   void initState() {
//     DPrint.log("LeaderboardController onInit");
//     controller.fetchLeaderboard();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // // 🔥 Call API once when screen is built
//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     //   if (controller.leader.value == null) {
//     //     controller.fetchLeaderboard();
//     //   }
//     // });

//     return AppScaffold(
//       removePadding: true,
//       body: SafeArea(
//         child: Obx(() {
//           if (controller.leader.value == null) {
//             return const Center(child: Text("No leaderboard found"));
//           }

//           return Column(
//             children: [
//               const LeaderboardAppBar(),
//               const SizedBox(height: 24),

//               /// TOP 3
//               TopThreePodium(users: controller.topThree),

//               const SizedBox(height: 12),

//               /// LIST
//               Expanded(
//                 child: ListView.separated(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   itemCount: controller.leaderboardUsers.length,
//                   separatorBuilder: (_, __) => const SizedBox(height: 12),
//                   itemBuilder: (_, index) {
//                     return LeaderboardRow(
//                       user: controller.leaderboardUsers[index],
//                       isMe:
//                           controller.me?.userId ==
//                           controller.leaderboardUsers[index].userId,
//                     );
//                   },
//                 ),
//               ),

//               /// PAGINATION
//               Padding(
//                 padding: const EdgeInsets.only(right: 16, bottom: 20),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       onPressed: controller.currentPage.value > 0
//                           ? controller.previousPage
//                           : null,
//                       icon: const Icon(Icons.chevron_left),
//                     ),
//                     Text(
//                       '${controller.currentPage.value + 1}'
//                       ' / ${controller.totalPages.value}',
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                     IconButton(
//                       onPressed:
//                           controller.currentPage.value <
//                               controller.totalPages.value - 1
//                           ? controller.nextPage
//                           : null,
//                       icon: const Icon(Icons.chevron_right),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final controller = Get.find<LeaderboardController>();

  @override
  void initState() {
    DPrint.log("LeaderboardController onInit");
    controller.fetchLeaderboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true,
      body: SafeArea(
        child: Obx(() {
          if (controller.leader.value == null) {
            return const Center(child: Text("No leaderboard found"));
          }

          return Column(
            children: [
              const LeaderboardAppBar(),
              const SizedBox(height: 24),

              /// TOP 3 PODIUM
              TopThreePodium(users: controller.topThree),

              const SizedBox(height: 12),

              /// LIST OF USERS (rank 4 onwards + pagination handled in controller)
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.leaderboardUsers.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, index) {
                    return LeaderboardRow(
                      user: controller.leaderboardUsers[index],
                      isMe:
                          controller.me?.userId ==
                          controller.leaderboardUsers[index].userId,
                    );
                  },
                ),
              ),

              /// PAGINATION - Exact style as your commented design
              /// PAGINATION - Fully clickable: arrows + page numbers
              Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Obx(() {
                    final int currentPage = controller.currentPage.value;
                    final int totalPages = controller.totalPages.value;
                    final bool canGoPrev = currentPage > 0;
                    final bool canGoNext = currentPage < totalPages - 1;

                    // Helper to go to specific page
                    void goToPage(int page) {
                      if (page != currentPage &&
                          page >= 0 &&
                          page < totalPages) {
                        controller.goToPage(
                          page,
                        ); // Make sure your controller has this method
                      }
                    }

                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Previous Arrow
                        GestureDetector(
                          onTap: canGoPrev ? controller.previousPage : null,
                          child: Container(
                            height: 22,
                            width: 22,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: canGoPrev
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Image.asset(
                              'assets/images/arrowbackIcon.png',
                              color: canGoPrev ? Colors.black : Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(width: 6),

                        /// Page 1 - Clickable
                        GestureDetector(
                          onTap: () => goToPage(0),
                          child: Container(
                            height: 22,
                            width: 22,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: currentPage == 0
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
                                color: currentPage == 0
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 6),

                        /// Page 2 - Clickable
                        GestureDetector(
                          onTap: () => goToPage(1),
                          child: Container(
                            height: 22,
                            width: 22,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: currentPage == 1
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
                                color: currentPage == 1
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 6),

                        /// Next Arrow
                        GestureDetector(
                          onTap: canGoNext ? controller.nextPage : null,
                          child: Container(
                            height: 22,
                            width: 22,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: canGoNext
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Image.asset(
                              'assets/images/arrowrightIcon.png',
                              color: canGoNext ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),

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
          );
        }),
      ),
    );
  }
}

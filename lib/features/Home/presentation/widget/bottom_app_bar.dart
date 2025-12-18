// import 'package:flutter/material.dart';

// class AppBottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final ValueChanged<int>? onTap;

//   const AppBottomNavBar({
//     super.key,
//     required this.currentIndex,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       decoration: const BoxDecoration(
//         color: Color(0xFF1A1A2E), // Dark navy background to match the image
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: List.generate(4, (index) {
//           bool isSelected = index == currentIndex;

//           // Icon and colors based on the provided image
//           IconData icon;
//           Color circleColor;
//           String label;

//           switch (index) {
//             case 0:
//               icon = Icons.home_outlined;
//               circleColor = const Color(0xFF3B82F6); // Blue for Home
//               label = 'Home';
//               break;
//             case 1:
//               icon = Icons.quiz_outlined;
//               circleColor = Colors.white;
//               label = 'Quiz';
//               break;
//             case 2:
//               icon = Icons.trending_up_outlined;
//               circleColor = Colors.white;
//               label = 'Gain';
//               break;
//             case 3:
//               icon = Icons.person_outline;
//               circleColor = Colors.white;
//               label = 'Profile';
//               break;
//             default:
//               icon = Icons.home;
//               circleColor = Colors.white;
//               label = '';
//           }

//           return GestureDetector(
//             onTap: () => onTap?.call(index),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: isSelected ? circleColor : Colors.transparent,
//                     shape: BoxShape.circle,
//                     border: isSelected ? null : Border.all(color: Colors.white24, width: 1),
//                   ),
//                   child: Icon(
//                     icon,
//                     color: isSelected
//                         ? (index == 0 ? Colors.white : const Color(0xFF1A1A2E))
//                         : Colors.white54,
//                     size: 28,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   label,
//                   style: TextStyle(
//                     color: isSelected ? Colors.white : Colors.white54,
//                     fontSize: 12,
//                     fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
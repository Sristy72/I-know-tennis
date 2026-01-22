// import 'package:flutter/material.dart';

// import '../../../../core/theme/app_colors.dart';

// class AppBottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTabSelected;

//   const AppBottomNavBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTabSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       decoration: BoxDecoration(
//         color: Color(0xFF2C3759),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.textBlack.withValues(alpha: 0.2),
//             blurRadius: 5,
//             offset: const Offset(0, -1),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildNavItem('assets/images/home.png','', 0),
//           _buildNavItem('assets/images/quiz.png', '', 1),
//           _buildNavItem('assets/images/gain.png', '', 2),
//           _buildNavItem('assets/images/profile.png', '', 3),
     
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem(String navImage, String label, int index) {
//     final bool isSelected = index == currentIndex;

//     return GestureDetector(
//       onTap: () => onTabSelected(index),
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           final double containerWidth = constraints.maxHeight > 0
//               ? constraints.maxHeight
//               : 75.0;

//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AnimatedContainer(
//                 width: containerWidth,
//                 duration: const Duration(milliseconds: 250),
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: isSelected
//                       ? Color(0xFF2B72FF).withValues(alpha: 0.2)
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Image(
//                   height: 24,
//                   width: 24,
//                   image: AssetImage(navImage),
//                   color: isSelected
//                       ? Color(0xFF2B72FF)
//                       : AppColors.textGrey,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 label,
//                 style: TextStyle(
//                   color: isSelected
//                       ? Color(0xFF2B72FF)
//                       : AppColors.textGrey,
//                   fontSize: 12,
//                   fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      decoration: const BoxDecoration(
        color: Color(0xFF0B3267),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2C3759),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _item("assets/images/home.png", 0),
            _item("assets/images/quiz.png", 1),
            _item("assets/images/gain.png", 2),
            _item("assets/images/profile.png", 3),
          ],
        ),
      ),
    );
  }

  Widget _item(String icon, int index) {
    final bool isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2B72FF) : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(.6),
            width: 2,
          ),
        ),
        child: Center(
          child: Image.asset(
            icon,
            height: 58,
            width: double.infinity,
            // color: Colors.white,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}


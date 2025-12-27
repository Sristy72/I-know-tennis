import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/features/Home/data/model/quiz_category_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/screens/start_quiz_screen.dart';
import 'package:get/get.dart';

class QuizCard extends StatelessWidget {
  final QuizCategoryResponse quiz;

  const QuizCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => StartQuizScreen()),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2B3C6A), Color(0xFF2B3C6A)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child: Image.network(
                quiz.quizCategoryImage ?? '',
                height: 160, // ✅ image height is OK
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 160,
                  color: Colors.black26,
                  child: const Icon(Icons.image, color: Colors.white),
                ),
              ),
            ),

            /// 🔹 Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(
                      quiz.quizCategoryName ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Spacer(),
                    const Divider(color: Colors.white, height: 12),

                    Center(
                      child: Text(
                        '${quiz.quizCount ?? 0} Questions',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Center(
                      child: Text(
                        'Newest Quiz',
                        style: TextStyle(
                          color: Color(0xFF4ADE80),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class QuizCard extends StatelessWidget {
//   final QuizCategoryResponse quiz;

//   const QuizCard({super.key, required this.quiz});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 290,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white.withOpacity(0.15),
//         boxShadow: [
//           BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 8),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// Category Image
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             child: Image.network(
//               quiz.quizCategoryImage ?? '',
//               height: 150,
//               width: double.infinity,
//               fit: BoxFit.cover,
//               errorBuilder: (_, __, ___) => Container(
//                 height: 150,
//                 color: Colors.grey,
//                 child: const Icon(Icons.image, color: Colors.white),
//               ),
//             ),
//           ),

//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   /// Category Name
//                   Text(
//                     quiz.quizCategoryName ?? '',
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 14,
//                       color: Colors.white,
//                     ),
//                   ),

//                   const Divider(color: Colors.white),

//                   /// Bottom Row
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           '${quiz.quizCount ?? 0} Quizzes',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 10,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         '${quiz.quizPoint ?? 0} pts',
//                         style: const TextStyle(
//                           fontSize: 11,
//                           color: Color(0xFF22C55E),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

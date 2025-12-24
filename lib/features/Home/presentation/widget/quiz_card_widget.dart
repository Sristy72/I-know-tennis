// import 'package:flutter/material.dart';

// import '../../data/model/quiz_response_model.dart';

// class QuizCard extends StatelessWidget {
//   final QuizModel quiz;

//    QuizCard({super.key, required this.quiz});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 290, // Increased to comfortably fit 207px image + text below
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
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             child: Image.asset(
//               quiz.data.,
//               height: 150, // Your required height
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     quiz.title,
//                     maxLines: 2, // Now safe to allow 2 lines
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                       color: Color(0xFFFFFFFF),
//                     ),
//                   ),
//                   const Divider(
//                     color: Color(0xFFFFFFFF),
//                     height: 15, // optional: controls space above/below
//                     thickness: 1,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           '${quiz.data} Questions',
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             color: Color(0xFFFFFFFF),
//                             fontSize: 10,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),

//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 4,
//                         ),
//                         // decoration: BoxDecoration(
//                         //   color: Colors.blue.withOpacity(.1),
//                         //   borderRadius: BorderRadius.circular(8),
//                         // ),
//                         child: Text(
//                           quiz.,
//                           style: const TextStyle(
//                             fontSize: 11,
//                             color: Color(0xFF22C55E),
//                             fontWeight: FontWeight.w600,
//                           ),
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
import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/features/Home/data/model/quiz_category_response_model.dart';
import '../../data/model/quiz_response_model.dart';

// class QuizCard extends StatelessWidget {
//   final QuizCategoryResponse quiz; // Accept a single QuizData

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
//           // Quiz Image (optional)
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             child: quiz.quizCategoryImage != null
//                 ? Image.network(
//                     quiz.quizCategoryImage?? '',
//                     height: 150,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => Container(
//                       height: 150,
//                       color: Colors.grey,
//                       child: const Center(
//                         child: Icon(Icons.image, color: Colors.white),
//                       ),
//                     ),
//                   )
//                 : Container(
//                     height: 150,
//                     color: Colors.grey,
//                     child: const Center(
//                       child: Icon(Icons.image, color: Colors.white),
//                     ),
//                   ),
//           ),

//           // Quiz Info
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Quiz Question
//                   Text(
//                     quiz.quizCategoryName ?? '',
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                       color: Colors.white,
//                     ),
//                   ),

//                   const Divider(
//                     color: Colors.white,
//                     height: 15,
//                     thickness: 1,
//                   ),

//                   // Bottom row: Number of options + Category
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           '${quiz.quizOptions?.length ?? 0} Options',
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 10,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 4,
//                         ),
//                         child: Text(
//                           quiz.quizCategory?.quizCategoryName ?? '',
//                           style: const TextStyle(
//                             fontSize: 11,
//                             color: Color(0xFF22C55E),
//                             fontWeight: FontWeight.w600,
//                           ),
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




class QuizCard extends StatelessWidget {
  final QuizCategoryResponse quiz;

  const QuizCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2B3C6A),
            Color(0xFF2B3C6A),
          ],
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
              height: 180,
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
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
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
                   const Divider(color: Colors.white),

                  /// 🔸 Questions row (centered)
                  Center(
                    child: Text(
                      '${quiz.quizCount ?? 0} Questions',
                      style: const TextStyle(
                        color: Color(0xFFBFD4FF),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// 🔸 Static tag (Newest Quiz / Most Popular)
                  Center(
                    child: Text(
                      'Newest Quiz',
                      style: const TextStyle(
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

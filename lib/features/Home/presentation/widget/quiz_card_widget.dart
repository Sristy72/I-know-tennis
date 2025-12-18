import 'package:flutter/material.dart';

import '../../data/model/home_model.dart';

class QuizCard extends StatelessWidget {
  final QuizModel quiz;

   QuizCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290, // Increased to comfortably fit 207px image + text below
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              quiz.image,
              height: 150, // Your required height
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    quiz.title,
                    maxLines: 2, // Now safe to allow 2 lines
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFFFFFFF),
                    height: 15, // optional: controls space above/below
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${quiz.questions} Questions',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        // decoration: BoxDecoration(
                        //   color: Colors.blue.withOpacity(.1),
                        //   borderRadius: BorderRadius.circular(8),
                        // ),
                        child: Text(
                          quiz.tag,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF22C55E),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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

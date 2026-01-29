import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/theme/app_colors.dart'; // adjust import

class QuizJokeDialog extends StatefulWidget {
  final String jokeQuestion;
  final String jokeAnswer;
  final VoidCallback onContinue;
  final String? imageUrl; // <-- new

  const QuizJokeDialog({
    super.key,
    required this.jokeQuestion,
    required this.jokeAnswer,
    required this.onContinue,
    this.imageUrl,
  });

  @override
  State<QuizJokeDialog> createState() => _QuizJokeDialogState();
}

class _QuizJokeDialogState extends State<QuizJokeDialog> {
  bool _showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xFF113D81),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: widget.onContinue,
              child: const Icon(Icons.close, color: Colors.white, size: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Text(
                  widget.jokeQuestion,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                if (widget.imageUrl != null)
                  ClipOval(
                    child: Image.network(
                      widget.imageUrl!,
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 24),
                if (_showAnswer)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFFFE6E0)),
                    ),
                    child: Text(
                      widget.jokeAnswer,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  )
                else
                  Center(
                    child: ElevatedButton(
                      onPressed: () => setState(() => _showAnswer = true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Color(0xFFFFE6E0)),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        child: Text(
                          'See answer',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

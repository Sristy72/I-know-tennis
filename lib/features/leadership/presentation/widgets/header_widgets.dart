import 'package:flutter/material.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: const [
          Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
          Expanded(
            child: Center(
              child: Text(
                "Leaderboard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 24),
        ],
      ),
    );
  }
}

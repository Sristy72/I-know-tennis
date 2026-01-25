import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSubscriptionSuccessDialog() {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                // 🎉 Icon
                Text(
                  '🎉',
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(height: 20),

                // Title
                Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12),

                // Subtitle
                Text(
                  'You’ve successfully started your\nSubscription',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          // ❌ Close button
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}

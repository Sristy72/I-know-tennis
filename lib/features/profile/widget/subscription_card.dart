import 'package:flutter/material.dart';
import 'clipper.dart';

class SubscriptionCard extends StatelessWidget {
  final String title;
  final double price;
  final String period;
  final List<String> features;
  final VoidCallback onSubscribe;
  final String buttonText;
  final Color color;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
    required this.onSubscribe,
    this.period = 'month',
    this.buttonText = 'Subscribe', required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFA6A7E7).withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          SizedBox(
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: SubscriptionWaveClipper(),
                  child: Container(
                    height: 89.01211547851562,
                    decoration: const BoxDecoration(
                      color: Color(0xFF5F8DFF),
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8)),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: SubscriptionWaveClipperRight(),
                  child: Container(
                    height: 87.11917114257812,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1F4ED8),
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8)),
                    ),
                  ),
                ),

                // Title
                Positioned(
                  top: 20,
                  left: 20,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                // Price
                Positioned(
                  bottom: -17,
                  left: 20,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$ ${price.toStringAsFixed(2)} ',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '/$period',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features
                  .map((feature) => _Feature(text: feature))
                  .toList(),
            ),
          ),

          const SizedBox(height: 16),

          const Divider(
            indent: 20,
            endIndent: 20,
            color: Color(0xFF7F92F0),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3377FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: onSubscribe,
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  final String text;
  const _Feature({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}

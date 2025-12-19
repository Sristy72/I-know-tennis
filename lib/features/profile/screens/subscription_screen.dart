import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/common/widgets/app_scaffold.dart';
import '../widget/dialog.dart';
import '../widget/subscription_card.dart';

// import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 76),
            SizedBox(
              height: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Subscription Plan',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Manage your plan and billing',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            SubscriptionCard(
              title: 'Free',
              price: 0.00,
              period: 'month',
              features: const [
                'Quiz on serving',
                'Foot faults',
                'Hindrances',
                'ITA',
                'Match analysis',
              ],
              onSubscribe: () {showSubscriptionSuccessDialog();},
              color: Color(0xFFE5EEFF),
            ),

            SizedBox(height: 24,),


            SubscriptionCard(
              title: 'Premium',
              price: 3.99,
              period: 'year',
              features: const [
                'Quiz on serving',
                'Foot faults',
                'Hindrances',
                'ITA',
                'Match analysis',
              ],
              onSubscribe: () {showSubscriptionSuccessDialog();},
              color: Color(0xFFF3E8FF),
            ),
          ],
        ),
      ),
    );
  }
}


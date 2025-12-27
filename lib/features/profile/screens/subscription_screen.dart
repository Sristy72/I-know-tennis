import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/common/widgets/app_scaffold.dart'; // your existing path
import '../controller/profile_controller.dart';
import '../widget/dialog.dart';
import '../widget/subscription_card.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();

    // Fetch subscriptions when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (profileController.allSubs.isEmpty) {
        profileController.allSubscription();
      }
    });

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
                      onPressed: () => Get.back(),
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
            const SizedBox(height: 24),

            // Dynamic Cards: Monthly + Yearly for each plan
            Obx(() {
              if (profileController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }

              if (profileController.allSubs.isEmpty) {
                return const Center(
                  child: Text(
                    'No subscription plans available',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              // Build list of cards (Monthly & Yearly for every plan)
              List<Widget> cards = [];

              for (var plan in profileController.allSubs) {
                // Monthly Card
                if (plan.subscriptionMonthlyPlanPrice > 0) {
                  cards.add(
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: SubscriptionCard(
                        title: '${plan.subscriptionPlanName} (Monthly)',
                        price: plan.subscriptionMonthlyPlanPrice / 100, // assuming price is in cents
                        period: 'month',
                        features: plan.subscriptionDetailsList,
                        color: const Color(0xFFE5EEFF),
                        buttonText: 'Subscribe',
                        onSubscribe: () {
                          // TODO: Add real purchase logic here (pass plan.id + "monthly")
                          showSubscriptionSuccessDialog();
                        },
                      ),
                    ),
                  );
                }

                // Yearly Card
                if (plan.subscriptionYearlyPlanPrice > 0) {
                  cards.add(
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: SubscriptionCard(
                        title: '${plan.subscriptionPlanName} (Yearly)',
                        price: plan.subscriptionYearlyPlanPrice / 100, // assuming price is in cents
                        period: 'year',
                        features: plan.subscriptionDetailsList,
                        color: const Color(0xFFF3E8FF),
                        buttonText: 'Subscribe',
                        onSubscribe: () {
                          // TODO: Add real purchase logic here (pass plan.id + "yearly")
                          showSubscriptionSuccessDialog();
                        },
                      ),
                    ),
                  );
                }
              }

              return Column(children: cards);
            }),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
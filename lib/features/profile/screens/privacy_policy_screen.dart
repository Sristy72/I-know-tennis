import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/core/theme/app_buttoms.dart';
import 'package:flutx_core/core/validation/validators.dart';
import 'package:get/get.dart';

import '../../../core/theme/input_decoration_extensions.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 76),
            SizedBox(
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Privacy policy',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'iKnowTennis ("we," "our," or "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application (the "App"), website, and any related services (collectively, the "Service").\n'
              'By downloading, accessing, or using the Service, you agree to this Privacy Policy. If you do not agree, please do not use the Service.\n\n'
              '1. Information We Collect\n'
              'We may collect the following types of information:\n'
              'a. Information You Provide Directly\n'
              'Account information (if you create an account): email address, username, password, profile picture, and any other information you choose to provide.\n'
              'Quiz responses, scores, progress, and any user-generated content (e.g., custom quizzes you create or share).\n'
              'Communications with us (e.g., support requests, feedback).\n'
              'b. Automatically Collected Information\n'
              'Device and usage data: Device type, operating system, unique device identifiers (e.g., IDFA, IDFV, Advertising ID), '
              'IP address, browser type, app version, crash logs, and analytics data.\n'
              'App activity: Pages viewed, quizzes taken, time spent in the app, buttons tapped, and other interaction data.\n'
              'Location data: Approximate location inferred from your IP address (only if you grant location permissions, we may collect precise location for certain features,'
              'such as location - based leaderboards).\n'
              'c.Information from Third Parties\n'
              'If you log in via third-party services (e.g., Google, Apple, Facebook): name, email, profile picture, and any other data you authorize us to access.\n'
              'Advertising partners and analytics providers (e.g., Google Analytics for Firebase, AppsFlyer, Adjust) may provide us with aggregated or anonymized data.\n\n'

              '2. How We Use Your Information\n'
              'We use the collected information for the following purposes:\n'
              'To provide and improve the Service (e.g., save your progress, show leaderboards, recommend quizzes).\n'
              'To personalize your experience (e.g., suggest quizzes based on past activity).\n'
              'To send you technical notices, updates, security alerts, and support messages.\n'
              'To display advertisements (we may use targeted advertising based on your interests and usage).\n'
              'For analytics and research to understand how users interact with the Service.\n'
              'To detect, prevent, and address fraud, abuse, or security issues.\n'
              'To comply with legal obligations.\n\n'

              '3. Advertising and Analytics\n'
              'The App has two levels: free basic (supported by advertising) and Premium.\n'
              'We work with third-party ad networks (e.g., Google AdMob, Unity Ads, AppLovin) that may use cookies, '
              'device identifiers, and usage data to serve targeted ads.\n'
              'You can limit ad tracking:\n'
              'On iOS: Settings → Privacy → Advertising → Limit Ad Tracking\n'
              'On Android: Settings → Google → Ads → Opt out of Ads Personalization\n'
              'We also use analytics tools (e.g., Firebase Analytics, Amplitude) to understand usage patterns.'
              'These tools may collect data described above but do not identify you individually.\n\n'

              '4. Sharing Your Information\n'
              'WE DO NOT SELL your personal information. We may share information in these limited cases:\n'
              'With service providers who help us operate the Service (e.g., cloud hosting, analytics, advertising partners) under strict confidentiality agreements.\n'
              'With your consent(e.g., when you share a quiz result on social media).\n'
              'In connection with a merger, acquisition, or sale of assets.\n'
              'To comply with laws, respond to lawful requests, or protect our rights and safety.\n\n'

              '5. Data Retention\n'
              'We keep your personal information only as long as necessary for the purposes described in this policy or as required by law.'
                  ' Account data is retained as long as your account is active. You can request deletion at any time (see Section 8).\n\n'

              '6. Security\n'
              'We use industry-standard measures (encryption, secure servers, etc.) to protect your data. '
              'However, no method of transmission over the internet or electronic storage is 100% secure, so we cannot guarantee absolute security.\n\n'

              '7. Children’s Privacy\n'
              'The Service is not intended for children under 16. We do not knowingly collect personal information from children under these ages. '
                  'If we learn we have collected such information, we will delete it immediately.\n\n'

              '8. Your Rights and Choices\n'
              'Depending on your location, you may have the right to:\n'
              'Access, correct, or delete your personal information.\n'
              'Object to or restrict certain processing.\n'
              'Withdraw consent where we rely on it.\n'
              'Data portability.\n'
              'Opt out of targeted advertising.\n'
              'To exercise these rights, contact us at privacy@iKnowTennis.com. We will respond within the time period required by applicable law (usually 30 days).\n'
              'You can also delete your account and data directly in the App settings.\n\n'

              '9. International Data Transfers\n'
              'Your information may be transferred to and processed in countries other than your own (e.g., the United States). '
                  'We use appropriate safeguards (such as Standard Contractual Clauses) for such transfers where required.\n\n'

              '10. Changes to This Policy\n'
              'We may update this policy from time to time. We will notify you of material changes by posting the new policy in the App and '
                  'updating the Effective Date. Your continued use after changes constitutes acceptance.\n\n'
              '11. Contact Us\n'
              'If you have questions about this Privacy Policy, contact us at:\n'
              'Email: privacy@iKnowTennis.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

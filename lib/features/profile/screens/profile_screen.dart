import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/features/profile/controller/profile_controller.dart';
import 'package:flutter_iknow_tennis/features/profile/screens/change_password_screen.dart';
import 'package:flutter_iknow_tennis/features/profile/screens/edit_profile_screen.dart';
import 'package:flutter_iknow_tennis/features/profile/screens/faq_screen.dart';
import 'package:flutter_iknow_tennis/features/profile/screens/privacy_policy_screen.dart';
import 'package:flutter_iknow_tennis/features/profile/screens/subscription_screen.dart';
import 'package:flutter_iknow_tennis/features/profile/screens/terms_&_conditions_screen.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.find<ProfileController>();
  // Or if not already put in Get: Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    // Fetch profile data when screen loads
    profileController.fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Leaderboard Card
            Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF00A3FF), Color(0xFF2058E6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF042F4D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Header with dynamic data
                    Obx(() {
                      final user = profileController.userInfo.value;

                      if (user == null) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      }

                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey.shade800,
                            backgroundImage: user.avatar.isNotEmpty
                                ? NetworkImage(user.avatar)
                                : null,

                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.fullName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                'Welcome back',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),

                    const SizedBox(height: 24),

                    // Stats section (you can also make these dynamic later)
                    Container(
                      padding: const EdgeInsets.all(1.5),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF709FFF), Color(0xFF1976D2)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xCC4D82EB), Color(0x660069CA)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Leaderboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),),
                              SizedBox(height: 16,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildStat('12', 'Quizzes', const Color(0xFF22D3EE)),
                                  _buildStat('850', 'Points', const Color(0xFFFFC34D)),
                                  _buildStat('1', 'Your position', const Color(0xFFF76C5E)),
                                ],
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Settings Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Icon(Icons.settings_outlined, color: Colors.white70),
                  SizedBox(width: 12),
                  Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Settings List
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF95E545), Color(0xFF00A3FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xFF033255),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      _buildSettingsTile(
                        'assets/images/edit.png',
                        'Edit Profile',
                            () => Get.to(() => const EditProfileScreen()),
                        'Update your personal information',
                      ),
                      _buildSettingsTile(
                        'assets/images/password.png',
                        'Change Password',
                            () => Get.to(() => const ChangePasswordScreen()),
                        'Update your personal information',
                      ),
                      _buildSettingsTile(
                        'assets/images/subscription.png',
                        'Subscription',
                            () => Get.to(() =>  SubscriptionScreen()),
                        'Manage your plan and billing',
                      ),
                      _buildSettingsTile(
                        'assets/images/privacy.png',
                        'Privacy policy',
                            () => Get.to(() => const PrivacyPolicyScreen()),
                        'How we handle your data',
                      ),
                      _buildSettingsTile(
                        'assets/images/service.png',
                        'Terms of Service',
                            () => Get.to(() => const TermsConditionsScreen()),
                        'App usage terms and conditions',
                      ),
                      _buildSettingsTile(
                        'assets/images/faq.png',
                        'FAQ',
                            () => Get.to(() => const FaqScreen()),
                        'Get the information you need',
                      ),
                      _buildSettingsTile(
                        'assets/images/logout.png',
                        'Log out',
                            () {profileController.logout();}, // TODO: Implement logout
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(String image, String title, VoidCallback onTap, [String? subtitle]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11.5),
        decoration: BoxDecoration(
          color: const Color(0xFF001D3D),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(height: 18, width: 18, child: Image.asset(image)),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}
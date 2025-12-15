import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/features/auth/presentation/widget/custom_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_buttoms.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true,
      body: SafeArea(
        child: SingleChildScrollView(
          // <-- Added
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              /// CENTER IMAGE
              Container(
                height: 172,
                width: 109,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/images/Icon_tennis.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "i know Tennis",
                style: TextStyle(
                  color: Color(0xFFFCFDFFCC),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                "Reset password",
                style: TextStyle(
                  color: Color(0xFFFFFFFFF),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Enter your email to receive the OTP",
                style: TextStyle(
                  color: Color(0xFFFFFFFFF),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),


              

              const SizedBox(height: 35),

              /// EMAIL
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Email", style: TextStyle(color: Colors.white70)),
              ),
              const SizedBox(height: 8),
              const CustomTextField(
                hint: "Enter your Email",
                prefixIcon: Icons.email_outlined,
              ),

              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: PrimaryButton(
                  height: 52,
                  borderRadius: 12,
                  isGradient: false,
                  backgroundColor: const Color(0xFF2058E6),
                  onPressed: () {},
                  child: const Text(
                    "Send OTP",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

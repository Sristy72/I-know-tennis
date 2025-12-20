import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/features/auth/presentation/widget/custom_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_buttoms.dart';
import '../controller/auth_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final _authController = Get.find<AuthController>();

  void _sendOtp() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus(); // close keyboard
    _authController.forgotPassword(_emailController.text); // your existing API
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true,
      body: SafeArea(
        child: SingleChildScrollView(
          // <-- Added
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,

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
                CustomTextField(
                  controller: _emailController,
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
                    onPressed: _sendOtp,
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
      ),
    );
  }
}

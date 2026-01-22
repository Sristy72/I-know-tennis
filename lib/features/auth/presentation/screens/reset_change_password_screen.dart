import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/features/auth/presentation/widget/custom_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_buttoms.dart';
import '../controller/auth_controller.dart';

class ResetChangePasswordScreen extends StatefulWidget {
  final String email;
  const ResetChangePasswordScreen({super.key, required this.email});

  @override
  State<ResetChangePasswordScreen> createState() => _ResetChangePasswordScreenState();
}

class _ResetChangePasswordScreenState extends State<ResetChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
    final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
    final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _authController = Get.find<AuthController>();

  Future _submit () async{
    if (!_formKey.currentState!.validate()) return;
    _authController.createNewPass(widget.email, _passwordController.text, _confirmPasswordController.text);
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
                  "Set New Password",
                  style: TextStyle(
                    color: Color(0xFFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 35),

                /// EMAIL
                /// PASSWORD
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 12),
               CustomTextField(
                controller: _passwordController,
                hint: "Create a Password ",
                prefixIcon: Icons.lock_outline,
                
            
              ),
                  const SizedBox(height: 24),

              /// PASSWORD
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  " Confirm Password",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 12),
               CustomTextField(
                controller: _confirmPasswordController,
                hint: "Confirm a Password ",
                prefixIcon: Icons.lock_outline,
                
            
              ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: PrimaryButton(
                    height: 52,
                    borderRadius: 12,
                    isGradient: false,
                    backgroundColor: const Color(0xFF2058E6),
                    onPressed: _submit,
                    child: const Text(
                      "Continue",
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

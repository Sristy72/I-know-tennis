import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_iknow_tennis/features/auth/presentation/widget/custom_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_buttoms.dart';
import '../../../profile/screens/privacy_policy_screen.dart';
import '../../../profile/screens/terms_&_conditions_screen.dart';
import '../controller/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _authController = Get.find<AuthController>();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _submit() {
    _authController.register(
      _nameController.text.toString(),
      _emailController.text,
      _passwordController.text,
      _phoneController.text,
      _confirmPasswordController.text,
    );
  }

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
              const SizedBox(height: 16),

              const Text(
                "Create Your Account",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 24),

              /// EMAIL
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: _nameController,
                hint: "Enter your Full  Name",
                prefixIcon: Icons.person_3_sharp,
              ),

              const SizedBox(height: 24),

              /// PASSWORD
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: _emailController,
                hint: "Enter your Email",
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 24),

              /// PASSWORD
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Phone Number",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: _phoneController,
                hint: "Enter your Phone Number",
                prefixIcon: Icons.phone_callback,
              ),
              const SizedBox(height: 24),

              /// PASSWORD
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
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
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: _confirmPasswordController,
                hint: "Confirm a Password ",
                prefixIcon: Icons.lock_outline,
              ),

              const SizedBox(height: 24),

              /// REMEMBER + FORGOT
              ///
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Checkbox(
                      value: _authController.isAccepted.value,
                      activeColor: Color(0xFF12B347),
                      // fill color when checked
                      checkColor: Colors.black,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      onChanged: (_) => _authController.toggle(),
                    ),
                  ),

                  const SizedBox(
                    width: 6,
                  ), // 👈 spacing between checkbox and text

                  Expanded(
                    child: GestureDetector(
                      onTap: _authController.toggle,
                      child: Align(
                        alignment:
                            Alignment.topLeft, // 👈 force text to start at top
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              height: 1.4,
                            ),
                            children: [
                              const TextSpan(text: "I agree to the "),

                              /// TERMS & CONDITIONS
                              TextSpan(
                                text: "Terms and Conditions",
                                style: const TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(
                                      () => const TermsConditionsScreen(),
                                    );
                                  },
                              ),

                              const TextSpan(text: " and "),

                              /// PRIVACY POLICY
                              TextSpan(
                                text: "\n Privacy Policy",
                                style: const TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(() => const PrivacyPolicyScreen());
                                  },
                              ),

                              const TextSpan(
                                text: " *",
                                style: TextStyle(
                                  color: Color(0xFFC06D8A),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?  ",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: const Text(
                      "Sign In Here",
                      style: TextStyle(
                        color: Color(0xFF0099FF),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// SIGN IN BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: PrimaryButton(
                  height: 52,
                  borderRadius: 12,
                  isGradient: false,
                  backgroundColor: const Color(0xFF2058E6),
                  onPressed: _submit,
                  child: const Text(
                    "Sign up",
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

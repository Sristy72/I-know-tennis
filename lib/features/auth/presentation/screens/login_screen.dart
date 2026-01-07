import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/features/Home/presentation/screens/home_screen.dart';
import 'package:flutter_iknow_tennis/features/auth/presentation/widget/custom_text_field.dart';
import 'package:flutter_iknow_tennis/features/other/presentation/screens/dashboard_screen.dart';
import 'package:get/get.dart';

import '../../../../core/network/services/secure_store_services.dart';
import '../../../../core/theme/app_buttoms.dart';
import '../../../../core/theme/app_colors.dart';
import '../controller/auth_controller.dart';
import '../controller/remember_me_controller.dart';
import 'reset_password_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authController = Get.find<AuthController>();
  final rememberMeController = Get.put(RememberMeController());

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  late TapGestureRecognizer _signUpRecognizer;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials(); // 👈 Call here
  }

  Future<void> _loadSavedCredentials() async {
    final secureStore = SecureStoreServices();
    final savedEmail = await secureStore.retrieveData('email');
    final savedPassword = await secureStore.retrieveData('password');

    if (savedEmail != null && savedPassword != null) {
      _emailController.text = savedEmail;
      _passwordController.text = savedPassword;
      rememberMeController.rememberMe.value = true;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _submit() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      _authController.login(
        rememberMeController,
        email: email,
        password: password,
      );
    } else {
      Get.snackbar('Error', 'Please enter email and password');
    }
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
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 40),

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

              const SizedBox(height: 20),

              /// PASSWORD
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _passwordController,
                hint: "Enter your Password",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: 12),

              /// REMEMBER + FORGOT
              Row(
                children: [
                  // Checkbox(
                  //   value: false,
                  //   onChanged: (_) {},
                  //   activeColor: Colors.blue,
                  // ),
                  // const Text(
                  //   "Remember me",
                  //   style: TextStyle(color: Colors.white70),
                  // ),
                  Obx(
                    () => Checkbox(
                      value: rememberMeController.rememberMe.value,
                      activeColor: Color(0xFF12B347),
                      // fill color when checked
                      checkColor: Colors.black,
                      //  tick color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      side: MaterialStateBorderSide.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          //  Border when checked
                          return BorderSide(color: Color(0xFFFFFFFF), width: 2);
                        }
                        // Border when unchecked
                        return BorderSide(color: Color(0xFFFFFFFF), width: 1);
                      }),
                      onChanged: (_) => rememberMeController.toggleRememberMe(),
                    ),
                  ),

                  GestureDetector(
                    onTap: rememberMeController.toggleRememberMe,
                    // tap text also toggles
                    child: const Text(
                      "Remember Me",
                      style: TextStyle(color: Color(0xFFFCFDFF), fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.to(() => ResetPasswordScreen());
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: Color(0xFF0099FF), fontSize: 14, fontWeight: FontWeight.w400),
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
                    "Sign in",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// SIGN UP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color(0XFFFFFFFF), fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignupScreen());
                    },
                    child: const Text(
                      "Sign Up Here",
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
            ],
          ),
        ),
      ),
    );
  }
}

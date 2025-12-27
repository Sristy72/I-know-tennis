
import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_iknow_tennis/features/auth/presentation/widget/custom_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_buttoms.dart';
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
      _confirmPasswordController.text
     
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true,
      body: SafeArea(
        child: SingleChildScrollView( // <-- Added
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        


              const SizedBox(height: 16),

              const Text(
                "Create Your Account",
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
                child: Text(
                  "Name",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 8),
               CustomTextField(
                controller:_nameController, 
                hint: "Enter your Full  Name",
                prefixIcon: Icons.person_3_sharp,
              ),

              const SizedBox(height: 24),

              /// PASSWORD
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(color: Colors.white70),
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
                  style: TextStyle(color: Colors.white70),
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

              const SizedBox(height: 12),

              /// REMEMBER + FORGOT
              /// 
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (_) {},
                    activeColor: Colors.blue,
                  ),
                  const Text(
                    "I agree to the Terms and Conditions and \n Privacy Policy *",
                    style: TextStyle(color: Colors.white70),
                  ),

                  
                ],
              ),
                   const SizedBox(height: 20),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?  ",
                    style: TextStyle(color: Colors.white70),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: const Text(
                      "Sign In Here",
                      style: TextStyle(
                        color: Color(0xFF1269C9),
                        fontWeight: FontWeight.w600,
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

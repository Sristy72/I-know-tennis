import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/features/auth/presentation/widget/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/theme/app_buttoms.dart';
import '../controller/auth_controller.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final _authController = Get.find<AuthController>();

  void _submitOtp() {
    FocusScope.of(context).unfocus();
    _authController.verifyOTP(widget.email, _otpController.text);
  }

  void _resendOtp() {
    FocusScope.of(context).unfocus();
    _authController.resendOTP(widget.email);
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
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                "Enter OTP",
                style: TextStyle(
                  color: Color(0xFFFFFFFFF),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 24),

              PinCodeTextField(
                appContext: context,
                controller: _otpController,
                length: 6,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                autoDismissKeyboard: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 45,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.grey.shade200,
                  selectedFillColor: Colors.white,
                  inactiveColor: Color(0xFFFFFFFFF),
                  selectedColor: Colors.yellow,
                  activeColor: Colors.yellow,
                ),

                textStyle: TextStyle(
                  color: Color(0xFFFFFFFFF),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                cursorColor: Colors.yellow,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: false,
                onCompleted: (value) {
                  // You can trigger submit automatically when user finishes typing
                  _submitOtp();
                },
              ),

              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't Receive OTP?",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Obx(() {
                    final seconds = _authController.resendSeconds.value;

                    return TextButton(
                      onPressed: seconds == 0 ? _resendOtp : null,
                      child: Text(
                        seconds == 0
                            ? "RESEND OTP"
                            : "Resend in ${_authController.formatSeconds(seconds)}",
                        style: TextStyle(
                          color: seconds == 0
                              ? const Color(0xFF0099FF)
                              : Colors.grey,
                        ),
                      ),
                    );
                  }),
                ],
              ),

              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: PrimaryButton(
                  height: 48,
                  borderRadius: 8,
                  isGradient: false,
                  backgroundColor: const Color(0xFF2058E6),
                  onPressed: () {},
                  child: const Text(
                    "Verify Now",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF),
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

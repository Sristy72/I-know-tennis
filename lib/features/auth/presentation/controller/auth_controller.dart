import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/resend_otp_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/reset_change_password_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/forget_pass_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/login_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/otp_verify_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/signup_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/presentation/screens/reset_change_password_screen.dart';
import 'package:flutter_iknow_tennis/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:flutter_iknow_tennis/features/other/presentation/screens/dashboard_screen.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/network/services/auth_storage_service.dart';
import '../../../../core/network/services/secure_store_services.dart';
import '../../../../core/utils/debug_print.dart';
import '../../../Home/presentation/screens/home_screen.dart';
import '../../data/model/refresh_token_request_model.dart';
import '../../domain/auth_repo.dart';
import '../screens/login_screen.dart';
import 'remember_me_controller.dart';

class AuthController extends BaseController {
  final AuthRepository _authRepository;
  final AuthStorageService _authStorageService;
  bool _isSuccess = false;
  RxBool isAccepted = false.obs;

  var isLoading = false.obs;
  var errorMessage = "".obs;

  void setLoading(bool value) => isLoading.value = value;
  void setError(String message) => errorMessage.value = message;

  AuthController(this._authRepository, this._authStorageService);

  // final userProfileService = Get.find<GetUserProfileService>();

  // Login
  Future<void> login(
    RememberMeController? rememberMeController, {
    required String email,
    required String password,
  }) async {
    setLoading(true);
    setError("");

    final request = LoginRequestModel(email: email, password: password);

    final result = await _authRepository.login(request);

    result.fold(
      (fail) {
        setError(fail.message);
        setLoading(false);
      },
      (success) async {
        final user = success.data;

        /// 🔹 store auth token
        await _authStorageService.storeAuthData(
          accessToken: user.token.accessToken,
          refreshToken: user.token.refreshToken,
          userId: user.id,
          role: user.role,
        );

        /// 🔹 remember me optional storage
        if (rememberMeController!.rememberMe.value) {
          final secureStore = SecureStoreServices();
          secureStore.storeData('email', email);
          secureStore.storeData('password', password);
        } else {
          final secureStore = SecureStoreServices();
          secureStore.deleteData('email');
          secureStore.deleteData('password');
        }

        Get.offAll(() => DashboardScreen());
        setLoading(false);
      },
    );
  }

  // Future<void> login(String email, String password) async {
  //   setLoading(true);
  //   setError("");

  //   final request = LoginRequestModel(email: email, password: password);

  //   final result = await _authRepository.login(request);

  //   DPrint.log("Login Response ${result.isRight()}");

  //   result.fold(
  //     (fail) {
  //       setError(fail.message);
  //       setLoading(false);
  //     },
  //     (success) async {
  //       final user = success.data;

  //       await _authStorageService.storeAuthData(
  //         accessToken: success.data.token.accessToken,
  //         refreshToken: success.data.token.refreshToken,
  //         userId: user.id,
  //         role: user.role,
  //       );

  //       Get.to(() => DashboardScreen());
  //       setLoading(false);
  //     },
  //   );
  // }

  Future<void> register(
    String name,
    String email,
    String password,
    String phone,
    String confirmPassword,
  ) async {
    setLoading(true);
    setError('');

    final request = SignupRequestModel(
      fullName: name,
      email: email,
      password: password,
      phone: phone,
      confirmPassword: confirmPassword,
    );

    final result = await _authRepository.register(request);

    result.fold(
      (fail) {
        setError(fail.message);
        DPrint.log("Register success result : ${fail.message}");
        setLoading(false);
      },
      (success) async {
        DPrint.log("Register success result : ${success.data.fullName}");

        Get.to(() => LoginScreen());
        setLoading(false);
      },
    );
  }

  Future forgotPassword(String email) async {
    setLoading(true);
    setError('');

    final request = ForgetPassRequestModel.fromJson({'email': email});
    final result = await _authRepository.forgotPassword(request);

    result.fold(
      (fail) {
        setError(fail.message);
        DPrint.log("reset pass success result : ${fail.message}");
        setLoading(false);
      },
      (success) {
        DPrint.log("reset pass success result : ${success.data.message}");
        Get.offAll(() => OtpVerificationScreen(email: email));
        setLoading(false);
      },
    );
  }

  Future verifyOTP(String email, String otp) async {
    setLoading(true);
    setError("");

    final request = OtpVerifyRequestModel(email: email, otp: otp);
    final result = await _authRepository.verifyOtp(request);

    result.fold(
      (fail) {
        setError(fail.message);
        DPrint.log("verify otp success result : ${fail.message}");
        setLoading(false);
      },
      (success) {
        DPrint.log("verify otp success result : ${success.data.message}");
        Get.to(ResetChangePasswordScreen(email: email));
        setLoading(false);
      },
    );
  }

  Future createNewPass(
    String email,
    String password,
    String confirmPassword,
  ) async {
    final request = ResetChangePasswordRequestModel(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    final result = await _authRepository.createNewPassword(request);

    result.fold(
      (fail) {
        setError(fail.message);
        DPrint.log("New Password set failed result : ${fail.message}");
      },
      (success) {
        DPrint.log("New Password set successfully result : ${success.message}");
        Get.offAll(LoginScreen());
      },
    );
  }

  void toggle() {
    isAccepted.value = !isAccepted.value;
  }

  Future<bool> refreshToken() async {
    try {
      setLoading(true);

      final refreshToken = await _authStorageService.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        setLoading(false);
        return false;
      }

      final request = RefreshTokenRequestModel(refreshToken: refreshToken);
      final result = await _authRepository.refreshToken(request);

      return await result.fold(
        (fail) async {
          DPrint.log("Refresh token failed: ${fail.message}");
          setLoading(false);
          return false;
        },
        (success) async {
          DPrint.log("Refresh token success");

          await _authStorageService.storeAccessToken(
            success.data.token.accessToken,
          );
          await _authStorageService.storeRefreshToken(
            success.data.token.refreshToken,
          );

          setLoading(false);
          return true;
        },
      );
    } catch (e) {
      setLoading(false);
      return false;
    }
  }

  // Future resendOTP(String email) async {
  //   setLoading(true);
  //   setError('');

  //   final request = ResendOtpRequestModel.fromJson({'email': email});
  //   final result = await _authRepository.resendOTP(request);

  //   result.fold(
  //     (fail) {
  //       setError(fail.message);
  //       DPrint.log("reset pass success result : ${fail.message}");
  //       setLoading(false);
  //     },
  //     (success) {
  //       DPrint.log("reset pass success result : ${success.data}");
  //       Get.offAll(() => OtpVerificationScreen(email: email));
  //       setLoading(false);
  //     },
  //   );
  // }
  Future resendOTP(String email) async {
    setLoading(true);
    setError('');

    final result = await _authRepository.resendOTP(
      ResendOtpRequestModel.fromJson({'email': email}),
    );

    result.fold(
      (fail) {
        setLoading(false);
        setError(fail.message);

        // 🔍 Extract seconds from backend message
        final RegExp regex = RegExp(r'(\d+)\sseconds');
        final match = regex.firstMatch(fail.message ?? '');

        int seconds = 0;
        if (match != null) {
          seconds = int.parse(match.group(1)!);
          startResendTimer(seconds);
        }

        Get.snackbar(
          "Please wait",
          seconds > 0
              ? "You can resend OTP after ${formatSeconds(seconds)}"
              : fail.message ?? "Too many requests",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange.shade700,
          colorText: Colors.white,
        );
      },
      (success) {
        setLoading(false);

        Get.snackbar(
          "Success",
          "OTP sent successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.shade600,
          colorText: Colors.white,
        );
      },
    );
  }

  RxInt resendSeconds = 0.obs;
  Timer? _resendTimer;

  void startResendTimer(int seconds) {
    resendSeconds.value = seconds;
    _resendTimer?.cancel();

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendSeconds.value <= 0) {
        timer.cancel();
      } else {
        resendSeconds.value--;
      }
    });
  }

  // 🕒 Convert seconds → mm:ss
  String formatSeconds(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _resendTimer?.cancel();
    super.onClose();
  }
}

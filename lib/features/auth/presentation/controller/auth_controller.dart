import 'package:flutter_iknow_tennis/features/auth/data/model/forget_pass_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/login_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/otp_verify_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/signup_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:flutter_iknow_tennis/features/other/presentation/screens/dashboard_screen.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/network/services/auth_storage_service.dart';
import '../../../../core/utils/debug_print.dart';
import '../../../Home/presentation/screens/home_screen.dart';
import '../../domain/auth_repo.dart';
import '../screens/login_screen.dart';

class AuthController extends BaseController {
  final AuthRepository _authRepository;
  final AuthStorageService _authStorageService;
  bool _isSuccess = false;

  var isLoading = false.obs;
  var errorMessage = "".obs;

  void setLoading(bool value) => isLoading.value = value;
  void setError(String message) => errorMessage.value = message;

  AuthController(this._authRepository, this._authStorageService);

  // final userProfileService = Get.find<GetUserProfileService>();

  // Login
  Future<void> login(String email, String password) async {
    setLoading(true);
    setError("");

    final request = LoginRequestModel(email: email, password: password);

    final result = await _authRepository.login(request);

    DPrint.log("Login Response ${result.isRight()}");


    result.fold(
      (fail) {
        setError(fail.message);
        setLoading(false);
      },
      (success) async {
        final user = success.data;

        await _authStorageService.storeAuthData(
          accessToken: success.data.token.accessToken,
          refreshToken: success.data.token.refreshToken,
          userId: user.id,
          role: user.role,
        );

        Get.to(() => DashboardScreen());
        setLoading(false);
      },
    );
  }

  Future<void> register(
    String name,
    String email,
    String password,
    String phone,
    String confirmPassword
  ) async {
    setLoading(true);
    setError('');

    final request = SignupRequestModel(
      fullName: name,
      email: email,
      password: password,
      phone: phone,
      confirmPassword: confirmPassword
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
        // Get.to(SetNewPasswordScreen(email: email, otp: otp));
        setLoading(false);
      },
    );
  }
  
}

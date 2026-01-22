import 'package:flutter_iknow_tennis/features/auth/data/model/login_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/login_response_model.dart';

import '../../../core/network/network_result.dart';
import '../data/model/refresh_token_request_model.dart';
import '../data/model/refresh_token_response_model.dart';
import '../data/model/resend_otp_request_model.dart';
import '../data/model/resend_otp_response_model.dart';
import '../data/model/reset_change_password_request_model.dart';
import '../data/model/forget_pass_request_model.dart';
import '../data/model/forget_pass_response_model.dart';
import '../data/model/otp_verify_request_model.dart';
import '../data/model/otp_verify_response_model.dart';
import '../data/model/signup_request_model.dart';
import '../data/model/signup_response_model.dart';

abstract class AuthRepository {
  NetworkResult<LoginResponseModel> login(LoginRequestModel request);
  NetworkResult<SignupResponseModel> register(SignupRequestModel request);
  NetworkResult<ForgetPassResponseModel> forgotPassword(
    ForgetPassRequestModel request,
  );
  NetworkResult<OtpVerifyResponseModel> verifyOtp(
    OtpVerifyRequestModel request,
  );
  NetworkResult<void> createNewPassword(
    ResetChangePasswordRequestModel request,
  );
  NetworkResult<RefreshTokenResponseModel> refreshToken(
    RefreshTokenRequestModel request,
  );
   NetworkResult<ResendOtpResponseModel> resendOTP(
    ResendOtpRequestModel request,
  );
}

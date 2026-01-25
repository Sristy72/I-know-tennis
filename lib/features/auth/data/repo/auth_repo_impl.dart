import 'package:flutter_iknow_tennis/features/auth/data/model/forget_pass_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/forget_pass_response_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/login_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/login_response_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/otp_verify_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/otp_verify_response_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/resend_otp_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/resend_otp_response_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/signup_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/signup_response_model.dart';
import 'package:flutter_iknow_tennis/features/profile/models/request/change_pass_request_model.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';
import '../../domain/auth_repo.dart';
import '../model/refresh_token_request_model.dart';
import '../model/refresh_token_response_model.dart';
import '../model/reset_change_password_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;

  AuthRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  NetworkResult<LoginResponseModel> login(LoginRequestModel request) {
    return _apiClient.post<LoginResponseModel>(
      ApiConstants.auth.login,
      data: request.toJson(),
      fromJsonT: (json) => LoginResponseModel.fromJson(json),
      // isFormData: true
    );
  }

   @override
  NetworkResult<SignupResponseModel> register(SignupRequestModel request) {
    return _apiClient.post<SignupResponseModel>(
      ApiConstants.auth.register,
      data: request.toJson(),
      fromJsonT: (json) => SignupResponseModel.fromJson(json),
      // isFormData: true
    );
  }

   @override
  NetworkResult<ForgetPassResponseModel> forgotPassword(
    ForgetPassRequestModel request,
  ) {
    return _apiClient.post(
      ApiConstants.auth.forget,
      data: request.toJson(),
      fromJsonT: (json) => ForgetPassResponseModel.fromJson(json),
    );
  }

   @override
  NetworkResult<OtpVerifyResponseModel> verifyOtp(
    OtpVerifyRequestModel request,
  ) {
    return _apiClient.post(
      ApiConstants.auth.verify,
      data: request.toJson(),
      fromJsonT: (json) => OtpVerifyResponseModel.fromJson(json),
    );
  }

    @override
  NetworkResult<void> createNewPassword(ResetChangePasswordRequestModel request) {
    return _apiClient.post(
        ApiConstants.auth.otpVerifyResetPassword,
        data: request.toJson(),
        fromJsonT: (json) {});
  }

    @override
  NetworkResult<RefreshTokenResponseModel> refreshToken(
    RefreshTokenRequestModel request,
  ) {
    return _apiClient.post(
      ApiConstants.auth.refreshToken,
      data: request.toJson(),
      fromJsonT: (json) => RefreshTokenResponseModel.fromJson(json),
    );
  }

   @override
  NetworkResult<ResendOtpResponseModel> resendOTP(
    ResendOtpRequestModel request,
  ) {
    return _apiClient.post(
      ApiConstants.auth.resendOtp,
      data: request.toJson(),
      fromJsonT: (json) => ResendOtpResponseModel.fromJson(json),
    );
  }

 }
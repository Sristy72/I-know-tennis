import 'package:flutter_iknow_tennis/features/auth/data/model/login_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/login_response_model.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';
import '../../domain/auth_repo.dart';

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

//    @override
//   NetworkResult<RegisterResponseModel> register(RegisterRequestModel request) {
//     return _apiClient.post<RegisterResponseModel>(
//       ApiConstants.auth.register,
//       data: request.toJson(),
//   }
 }
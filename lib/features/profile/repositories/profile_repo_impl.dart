import 'package:dio/dio.dart';
import 'package:flutter_iknow_tennis/features/profile/models/response/get_all_subscription_response_model.dart';
import 'package:flutter_iknow_tennis/features/profile/models/response/get_profile_response_model.dart';
import 'package:flutter_iknow_tennis/features/profile/repositories/profile_repo.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';
import '../models/request/change_pass_request_model.dart';
import '../models/response/update_profile_response_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiClient _apiClient;

  ProfileRepositoryImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  NetworkResult<GetProfileResponseModel> fetchProfile(String userId) {
    return _apiClient.get(
      ApiConstants.profile.fetchProfile(userId),
      fromJsonT: (json) =>
          GetProfileResponseModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  NetworkResult<UpdateProfileResponseModel> updatePersonalInfo(
    FormData formData,
  ) {
    return _apiClient.put(
      ApiConstants.profile.updateProfile,
      formData: formData,
      fromJsonT: (json) => UpdateProfileResponseModel.fromJson(json),
    );
  }

  //
  @override
  NetworkResult<void> changePass(ChangePasswordRequestModel request){
    return _apiClient.patch(
      ApiConstants.auth.updatePassword,
      data: request.toJson(),
      fromJsonT: (json) => [],
    );
  }


  @override
  NetworkResult<List<GetAllSubscriptionResponseModel>> getAllSubs(){
    return _apiClient.get(ApiConstants.profile.fetchAllSubs,
        fromJsonT: (json) => (json as List).map((item) => GetAllSubscriptionResponseModel.fromJson(item)).toList());
  }
  //
  // @override
  // NetworkResult<UserResponse> tradingInfo(FormData request) {
  //   return _apiClient.patch(
  //       ApiConstants.user.updateProfile,
  //       formData: request,
  //       fromJsonT: (json) => UserResponse.fromJson(json),
  //       isFormData: true
  //   );
  // }
}

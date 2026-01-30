import 'package:dio/dio.dart';
import 'package:flutter_iknow_tennis/features/profile/models/request/change_pass_request_model.dart';
import 'package:flutter_iknow_tennis/features/profile/models/response/get_leaderboard_summary.dart';
import 'package:flutter_iknow_tennis/features/profile/models/response/get_profile_response_model.dart';
import 'package:flutter_iknow_tennis/features/profile/models/response/update_profile_response_model.dart';
import '../../../core/network/network_result.dart';
import '../models/response/get_all_subscription_response_model.dart';




abstract class ProfileRepository {
  NetworkResult<GetProfileResponseModel> fetchProfile(String userId);

  //profile update
  NetworkResult<UpdateProfileResponseModel> updatePersonalInfo(FormData formData);
//
// //Change password
  NetworkResult<void> changePass(ChangePasswordRequestModel request);
//   NetworkResult<OngoingOrderResponseModel> fetchOngoingOrder();
//   NetworkResult<OngoingOrderResponseModel> fetchCompletedOrder();
  NetworkResult<List<GetAllSubscriptionResponseModel>> getAllSubs();
  NetworkResult<GetLeaderboardSummary>getLeaderboard();
// NetworkResult<Category> fetchCategory(String userId);
//
//   NetworkResult<UserResponse> uploadPhoto(FormData request);
//
//
//   NetworkResult<UserResponse> tradingInfo(FormData request);
}

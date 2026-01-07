import 'package:flutter_iknow_tennis/core/network/api_client.dart';
import 'package:flutter_iknow_tennis/core/network/constants/api_constants.dart';
import 'package:flutter_iknow_tennis/core/network/network_result.dart';
import 'package:flutter_iknow_tennis/features/other/data/models/leaderboard_summary_response_model.dart';
import 'package:flutter_iknow_tennis/features/other/domain/repositories/leaderboard_repository.dart';

class LeaderboardRepoImpl implements LeaderboardRepository{
  final ApiClient _apiClient;

  LeaderboardRepoImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  NetworkResult<LeaderboardSummaryResponseModel> getLeaderboardSummary() {
    return _apiClient.get(ApiConstants.quizStatus.leaderboardSummary, fromJsonT: (json) => LeaderboardSummaryResponseModel.fromJson(json));
  }

}
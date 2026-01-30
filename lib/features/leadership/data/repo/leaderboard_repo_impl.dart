import 'package:dio/dio.dart';
import 'package:flutter_iknow_tennis/core/utils/debug_print.dart';
import 'package:flutter_iknow_tennis/features/leadership/data/model/leaderboard_response_model.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';
import '../../domain/repo/leaderboard_repo.dart';

class LeaderboardRepoListImpl implements LeaderboardListRepository {
  final ApiClient _apiClient;

  LeaderboardRepoListImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  //    @override
  //   NetworkResult<LeaderboardResponse> getLeaderboard() {
  //     return _apiClient.get<LeaderboardResponse>(
  //       ApiConstants.home.getLeaderboard,
  //       fromJsonT: (json) => LeaderboardResponse.fromJson(json),
  //     );
  //   }
  @override
  NetworkResult<LeaderboardResponse> getLeaderboard({
    required int page,
    required int limit,
  }) {
    final apiResponse = _apiClient.get<LeaderboardResponse>(
      ApiConstants.home.getLeaderboard,
      // queryParameters: {'page': page, 'limit': limit},
      fromJsonT: (json) {
        DPrint.log("LeaderboardResponse: $json");
        return LeaderboardResponse.fromJson(json);
      },
    );

    // DPrint.log(
    //   "LeaderboardController fetchLeaderboard from repo call $apiResponse",
    // );

    return apiResponse;
  }
}

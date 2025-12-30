import 'package:flutter_iknow_tennis/core/network/network_result.dart';
import 'package:flutter_iknow_tennis/features/other/data/models/leaderboard_summary_response_model.dart';

abstract class LeaderboardRepository{
  NetworkResult<LeaderboardSummaryResponseModel> getLeaderboardSummary();
}
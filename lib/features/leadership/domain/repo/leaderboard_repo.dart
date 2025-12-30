import '../../../../core/network/network_result.dart';
import '../../data/model/leaderboard_response_model.dart';

abstract class LeaderboardRepository {
  // NetworkResult<LeaderboardResponse> getLeaderboard();
  NetworkResult<LeaderboardResponse> getLeaderboard({
    required int page,
    required int limit,
  });
}

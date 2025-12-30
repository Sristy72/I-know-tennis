import 'package:flutter_iknow_tennis/core/base/base_controller.dart';
import 'package:flutter_iknow_tennis/features/other/data/models/leaderboard_summary_response_model.dart';
import 'package:flutter_iknow_tennis/features/other/domain/repositories/leaderboard_repository.dart';
import 'package:get/get.dart';

class GainController extends BaseController{
  final LeaderboardRepository _leaderboardRepository;

  Rx<LeaderboardSummaryResponseModel?> leaderboardSummary = Rx<LeaderboardSummaryResponseModel?>(null);

  @override
  void onInit() {
    getLeaderboardSummary();
    super.onInit();
  }

  GainController(this._leaderboardRepository);

  Future<void> getLeaderboardSummary() async{
    setError('');
    setLoading(true);

    final result = await _leaderboardRepository.getLeaderboardSummary();

    result.fold((fail){
      setLoading(false);
      setError(fail.message);
      Get.snackbar('Error', fail.message, snackPosition: SnackPosition.BOTTOM);
    }, (success){
      leaderboardSummary.value = success.data;
      setLoading(false);
    });
}
}
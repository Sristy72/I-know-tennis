import 'package:flutter_iknow_tennis/features/leadership/data/repo/leaderboard_repo_impl.dart';
import 'package:flutter_iknow_tennis/features/leadership/domain/repo/leaderboard_repo.dart';

import 'package:flutter_iknow_tennis/features/other/data/repositories/leaderboard_repo_impl.dart';
import 'package:flutter_iknow_tennis/features/other/domain/repositories/leaderboard_repository.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:flutter_iknow_tennis/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:flutter_iknow_tennis/features/profile/repositories/profile_repo.dart';
import 'package:flutter_iknow_tennis/features/profile/repositories/profile_repo_impl.dart';
import 'package:flutter_iknow_tennis/features/Home/data/repo/home_repo_impl.dart';
import 'package:flutter_iknow_tennis/features/Home/domain/home_repo.dart';
import 'package:flutter_iknow_tennis/features/subscription/data/repo/payment_repo_impl.dart';
import 'package:flutter_iknow_tennis/features/subscription/domain/repo/payment_repo.dart';
import 'package:get/get.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/domain/auth_repo.dart';

void setupRepository() {
  Get.lazyPut<AuthRepository>(
    () => AuthRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );

  Get.lazyPut<QuizRepository>(
    () => QuizRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );
  Get.lazyPut<ProfileRepository>(
    () => ProfileRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );
  Get.lazyPut<HomeRepository>(
    () => HomeRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );

     Get.lazyPut<PaymentRepository>(
    () => PaymentRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );



     Get.lazyPut<LeaderboardRepository>(
    () => LeaderboardRepoImpl(apiClient: Get.find()),
    fenix: true,
  );


     Get.lazyPut<LeaderboardListRepository>(
    () => LeaderboardRepoListImpl(apiClient: Get.find()),
    fenix: true,
  );
}

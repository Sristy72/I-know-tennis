import 'package:flutter_iknow_tennis/features/quiz/data/repositories/attempt_quiz_repository_impl.dart';
import 'package:flutter_iknow_tennis/features/quiz/domain/repositories/attempt_quiz_repository.dart';
import 'package:get/get.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/domain/auth_repo.dart';

void setupRepository() {
  Get.lazyPut<AuthRepository>(
    () => AuthRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );

  Get.lazyPut<AttemptQuizRepository>(
      () => AttemptQuizRepositoryImpl(apiClient: Get.find()),
    fenix: true
  );
}

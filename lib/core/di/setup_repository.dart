import 'package:flutter_iknow_tennis/features/profile/repositories/profile_repo.dart';
import 'package:flutter_iknow_tennis/features/profile/repositories/profile_repo_impl.dart';
import 'package:get/get.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/domain/auth_repo.dart';

void setupRepository() {
  Get.lazyPut<AuthRepository>(
    () => AuthRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );

  Get.lazyPut<ProfileRepository>(
    () => ProfileRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );
}

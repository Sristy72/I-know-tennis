import 'package:flutter_iknow_tennis/features/Home/data/repo/home_repo_impl.dart';
import 'package:flutter_iknow_tennis/features/Home/domain/home_repo.dart';
import 'package:get/get.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/domain/auth_repo.dart';

void setupRepository() {
  Get.lazyPut<AuthRepository>(
    () => AuthRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );
    Get.lazyPut<HomeRepository>(
    () => HomeRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );
}

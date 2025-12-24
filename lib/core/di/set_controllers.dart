
import 'package:flutter_iknow_tennis/features/profile/controller/profile_controller.dart';
import 'package:flutter_iknow_tennis/features/Home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../features/auth/presentation/controller/auth_controller.dart';



void setupController() {
    Get.lazyPut<AuthController>(
    () => AuthController(Get.find(), Get.find()),
    fenix: true,
  );
    Get.lazyPut<ProfileController>(
    () => ProfileController(),
    fenix: true,
  );
      Get.lazyPut<HomeController>(
    () => HomeController(Get.find()),
    fenix: true,
  );




}

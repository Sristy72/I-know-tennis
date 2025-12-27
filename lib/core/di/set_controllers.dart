import 'package:flutter_iknow_tennis/features/quiz/presentation/controllers/attempt_quiz_controller.dart';
import 'package:get/get.dart';

import '../../features/Home/presentation/controller/home_controller.dart';
import '../../features/auth/presentation/controller/auth_controller.dart';
import '../../features/profile/controller/profile_controller.dart';

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


  Get.lazyPut<AttemptQuizController>(
          () => AttemptQuizController(Get.find()),
    fenix: true,
  );
}

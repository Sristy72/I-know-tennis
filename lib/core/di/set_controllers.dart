
import 'package:flutter_iknow_tennis/features/auth/presentation/controller/splash_controller.dart';
import 'package:flutter_iknow_tennis/features/leadership/presentation/controller/leader_board_controller.dart';
import 'package:flutter_iknow_tennis/features/profile/controller/profile_controller.dart';
import 'package:flutter_iknow_tennis/features/Home/presentation/controller/home_controller.dart';
import 'package:flutter_iknow_tennis/features/subscription/presentation/controller/subscription_controller.dart';
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


   Get.lazyPut<SubscriptionController>(
    () => SubscriptionController(Get.find()),
    fenix: true,
  );



  Get.lazyPut<AttemptQuizController>(
          () => AttemptQuizController(Get.find()),
    fenix: true,
  );

   Get.lazyPut<SplashController>(
          () => SplashController(),
    fenix: true,
  );

     Get.lazyPut<LeaderboardController>(
          () => LeaderboardController( Get.find()),
    fenix: true,
  );
}

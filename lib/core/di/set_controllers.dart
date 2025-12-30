
import 'package:flutter_iknow_tennis/features/auth/presentation/controller/splash_controller.dart';
import 'package:flutter_iknow_tennis/features/other/presentation/controller/gain_controller.dart';
import 'package:flutter_iknow_tennis/features/profile/controller/profile_controller.dart';
import 'package:flutter_iknow_tennis/features/Home/presentation/controller/home_controller.dart';
import 'package:flutter_iknow_tennis/features/subscription/presentation/controller/subscription_controller.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/controllers/attempt_quiz_controller.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/controllers/complete_quiz_controller.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/controllers/view_answer_controller.dart';
import 'package:get/get.dart';

import '../../features/Home/presentation/controller/home_controller.dart';
import '../../features/auth/presentation/controller/auth_controller.dart';
import '../../features/profile/controller/profile_controller.dart';
import '../../features/quiz/presentation/controllers/start_quiz_controller.dart';

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

  Get.lazyPut<StartQuizController>(
          () => StartQuizController(Get.find()),
    fenix: true,
  );

  Get.lazyPut<CompleteQuizController>(
          () => CompleteQuizController(Get.find()),
    fenix: true,
  );

  Get.lazyPut<ViewAnswerController>(
      () => ViewAnswerController(Get.find()),
    fenix: true,
  );

   Get.lazyPut<SplashController>(
          () => SplashController(),
    fenix: true,
  );

   Get.lazyPut<GainController>(
          () => GainController(Get.find()),
    fenix: true,
  );


}

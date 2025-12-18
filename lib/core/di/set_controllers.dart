
import 'package:get/get.dart';

import '../../features/auth/presentation/controller/auth_controller.dart';



void setupController() {
    Get.lazyPut<AuthController>(
    () => AuthController(Get.find(), Get.find()),
    fenix: true,
  );



}

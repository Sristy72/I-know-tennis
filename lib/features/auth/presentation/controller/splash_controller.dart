import 'package:get/get.dart';
import '../../../../core/network/services/auth_storage_service.dart';
import '../../../other/presentation/screens/dashboard_screen.dart';

import '../screens/login_screen.dart';

import '../screens/onboarding_screen_one.dart';
import 'auth_controller.dart';

// class SplashController extends GetxController {
//   final _authController = Get.find<AuthController>();
//   final _authStorage = Get.find<AuthStorageService>();

//   @override
//   void onInit() {
//     super.onInit();
//     _handleSplashLogic();
//   }

//   Future<void> _handleSplashLogic() async {
//     // ⏳ Show splash for 2 seconds
//     await Future.delayed(const Duration(seconds: 2));

//     final refreshToken = await _authStorage.getRefreshToken();

//     // 🚫 No refresh token → Login
//     if (refreshToken == null || refreshToken.isEmpty) {
//       Get.offAll(() => LoginScreen());
//       return;
//     }

//     // ✅ Refresh token exists → try refresh
//     final success = await _authController.refreshToken();

//     if (success) {
//       // 🎯 Token refreshed → Dashboard
//       Get.offAll(() => DashboardScreen());
//     } else {
//       // ❌ Refresh failed → Login
//       Get.offAll(() => LoginScreen());
//     }
//   }
// }
class SplashController extends GetxController {
  final AuthController _authController = Get.find();
  final AuthStorageService _storage = Get.find();

  @override
  void onInit() {
    super.onInit();
    _handleSplashLogic();
  }

  Future<void> _handleSplashLogic() async {
    // ⏳ Splash delay
    await Future.delayed(const Duration(seconds: 2));

    // 1️⃣ Check login first
    final refreshToken = await _storage.getRefreshToken();

    if (refreshToken != null && refreshToken.isNotEmpty) {
      // Try refreshing token
      final success = await _authController.refreshToken();

      if (success) {
        // ✅ Logged in → Dashboard (NO onboarding)
        Get.offAll(() => DashboardScreen());
        return;
      }
    }

    // 2️⃣ Not logged in → check onboarding
    final hasSeenOnboarding = await _storage.hasSeenOnboarding();

    if (!hasSeenOnboarding) {
      // 🆕 New user → Onboarding
      Get.offAll(() => OnboardingScreen());
    } else {
      // 👤 Returning user → Login
      Get.offAll(() => LoginScreen());
    }
  }
}

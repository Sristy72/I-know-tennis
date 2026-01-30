// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../../../../core/network/constants/key_constants.dart';
// import '../../../../core/network/services/auth_storage_service.dart';
// import '../../../../core/network/services/secure_store_services.dart';


// class AppDecisionScreen extends StatefulWidget {
//   const AppDecisionScreen({super.key});

//   @override
//   State<AppDecisionScreen> createState() => _AppDecisionScreenState();
// }

// class _AppDecisionScreenState extends State<AppDecisionScreen> {
//   final SecureStoreServices _secureStore = SecureStoreServices();
//   final AuthStorageService _authStorageService = AuthStorageService();

//   @override
//   void initState() {
//     super.initState();
//     _checkOnboardingStatus();
//   }

//   Future<void> _checkOnboardingStatus() async {
//     final onboardingDone = await _secureStore.retrieveData(
//       KeyConstants.onboardingStatus,
//     );

//     if (mounted) {
//       if (onboardingDone == "true") {
//         final bool isAuth = await _authStorageService.isAuthenticated();
//         // final userRole = await _authStorageService.getUserRole();

//         if (isAuth) {
//           Get.offAll(
//             () => BottomNavScreen(role: userRole ?? UserRole.patient),
//             /// () => BottomNavScreen(role: UserRole.pharmacist), `Note for Test`
//             transition: Transition.fadeIn,
//           );
//         } else {
//           Get.offAll(() => const LoginScreen(), transition: Transition.fadeIn);
//         }
//       } else {
//         Get.offAll(
//           () => const OnboardingScreen(),
//           transition: Transition.fadeIn,
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
//   }
// }

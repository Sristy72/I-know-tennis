// import 'package:get/get.dart';

// class OnboardingController extends GetxController {
//   var currentPage = 1.obs;
//   final int totalPages = 3;

//   void nextPage() {
//     if (currentPage.value < totalPages) {
//       currentPage.value++;
//     }
//   }
// }
import 'package:flutter_iknow_tennis/features/auth/presentation/screens/login_screen.dart';
import 'package:get/get.dart';
import '../widget/onboarding_item.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  final pages = <OnboardingItem>[
    OnboardingItem(
      title: "Do you Know Tennis?",
      description:
          "Test your tennis knowledge with these fun, free quizzes. Choose a quiz about serving, foot faults, hindrances, and more",
      image: "assets/images/Jumping_image .png",
    ),
    OnboardingItem(
      title: "Learn Tennis Rules",
      description:
          "Master USTA, ITA, and general tennis rules in a fun, engaging way",
      image: "assets/images/learn_tennis.png",
    ),
    OnboardingItem(
      title: "Compete & Grow",
      description:
          "Enjoy our free quizzes then subscribe for even more great quizzes",
      image: "assets/images/improve.png",
    ),
  ];

  int get totalPages => pages.length;

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      currentPage.value++; // Move progress bar
    } else {
      goToLogin(); // Navigate on last page
    }
  }

  void skip() {
    goToLogin(); // Skip to login directly
  }

  void goToLogin() {
    // Replace with your Login route
    Get.offAll(()=> LoginScreen()); 
  }
}

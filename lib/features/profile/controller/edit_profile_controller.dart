// features/profile/controller/edit_profile_controller.dart

import 'dart:io';

import 'package:flutter_iknow_tennis/features/profile/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  // Access the shared ProfileController (don't create new instance)
  final ProfileController profileController = Get.find<ProfileController>();

  // Reactive selected image for instant preview
  final Rx<File?> selectedImage = Rx<File?>(null);

  // Current name from profile (reactive)
  late String currentName;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();

    // Extract initial name when controller starts
    final user = profileController.userInfo.value;
    if (user != null) {
      currentName = user.fullName ?? '';
    } else {
      currentName = '';
      // Optional: trigger fetch if data not loaded yet
      // profileController.fetchProfile();
    }

    // Listen for updates in case profile is refreshed externally
    ever(profileController.userInfo, (user) {
      if (user != null) {
        currentName = user.fullName ?? '';
      }
    });
  }

  /// Pick image from gallery
  Future<void> pickImage() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (picked != null) {
      selectedImage.value = File(picked.path);
    }
  }

  /// Submit updated name and optional image
  void submit() {
    final name = currentName.trim();
    if (name.isEmpty) {
      Get.snackbar('Error', 'Please enter your name');
      return;
    }

    // Call the existing method in ProfileController
    profileController.updatePersonalInfo(name, selectedImage.value);

    // Optional: clear selected image after submit (in case success)
    // It will be cleared automatically on success because ProfileController calls Get.back()
  }

  /// Update name locally as user types
  void updateName(String newName) {
    currentName = newName;
  }

  @override
  void onClose() {
    selectedImage.value = null;
    super.onClose();
  }
}
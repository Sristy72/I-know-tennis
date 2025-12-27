import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/core/theme/app_buttoms.dart';
import 'package:flutter_iknow_tennis/features/profile/controller/edit_profile_controller.dart';
import 'package:flutter_iknow_tennis/features/profile/controller/profile_controller.dart';
import 'package:get/get.dart';
import '../../../core/theme/input_decoration_extensions.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create dedicated controller for this screen only
    final EditProfileController controller = Get.put(EditProfileController());

    // Access shared profile controller for loading/error states
    final ProfileController profileController = Get.find<ProfileController>();

    return AppScaffold(
      body: Obx(() {
        final user = profileController.userInfo.value;
        final isLoading = profileController.isLoading.value;
        final currentAvatarUrl = user?.avatar;

        // Show loading if profile not loaded yet
        if (isLoading && user == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            const SizedBox(height: 76),
            SizedBox(
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Profile Picture with Edit Button
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: controller.pickImage,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: controller.selectedImage.value != null
                        ? FileImage(controller.selectedImage.value!)
                        : currentAvatarUrl != null && currentAvatarUrl.isNotEmpty
                        ? NetworkImage(currentAvatarUrl)
                        : const AssetImage('assets/images/Container.png') as ImageProvider,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3377FF),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                initialValue: controller.currentName, // Pre-filled
                onChanged: controller.updateName,     // Update as user types
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                cursorColor: Colors.white,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white,
                ),
                decoration: context.primaryInputDecoration.copyWith(
                  hintText: "Name",
                ),
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PrimaryButton(
                onPressed:controller.submit,
                height: 55,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // // Show error from ProfileController
            // if (profileController.errorMessage.value.isNotEmpty)
            //   Padding(
            //     padding: const EdgeInsets.all(16),
            //     child: Text(
            //       profileController.errorMessage.value,
            //       style: const TextStyle(color: Colors.red),
            //     ),
            //   ),
          ],
        );
      }),
    );
  }
}
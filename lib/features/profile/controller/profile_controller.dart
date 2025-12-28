import 'dart:developer' as DPrint;
import 'dart:io';

import 'package:flutter_iknow_tennis/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_iknow_tennis/features/profile/models/request/change_pass_request_model.dart';
import 'package:flutter_iknow_tennis/features/profile/models/response/get_all_subscription_response_model.dart';
import 'package:flutter_iknow_tennis/features/profile/models/response/get_profile_response_model.dart';
import 'package:get/get.dart';
import '../../../../core/base/base_controller.dart';
import '../../../core/network/constants/key_constants.dart';
import '../../../core/network/services/auth_storage_service.dart';
import '../../../core/network/services/multiple_form_data_manager.dart';
import '../../../core/network/services/secure_store_services.dart';
import '../repositories/profile_repo.dart';

class ProfileController extends BaseController {
  final _profileRepository = Get.find<ProfileRepository>();
  final AuthStorageService _authStorageService = AuthStorageService();

  final Rxn<GetProfileResponseModel> userInfo = Rxn<GetProfileResponseModel>();

  final MultiFormDataManager _multiFormDataManager = MultiFormDataManager();
  final RxList<GetAllSubscriptionResponseModel> allSubs = <GetAllSubscriptionResponseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile(); //Fetch when controller is created
  }

  Future<void> fetchProfile() async {
    final userId = await _authStorageService.getUserId();
    DPrint.log('UserId: $userId');
    if (userId == null || userId.isEmpty) {
      setError('User ID not found. Please log in again.');
      Get.snackbar('Error', 'User ID not found. Please log in again.');
      setLoading(false);
      return;
    }

    final result = await _profileRepository.fetchProfile(userId);

    result.fold(
      (fail) {
        setError(fail.message);
        DPrint.log('data fetch failed');
      },
      (success) {
        userInfo.value = success.data;
        DPrint.log(success.message);
      },
    );
  }

  Future<void> updatePersonalInfo(String name, File? image) async {
    _multiFormDataManager.addTextData("fullName", name);
    if (image != null) {
      _multiFormDataManager.addImageFile(image, key: "avatar");
    }

    final formRequest = await _multiFormDataManager.toFormDataAsync();

    final result = await _profileRepository.updatePersonalInfo(formRequest);

    result.fold(
      (fail) {
        setError(fail.message);
        DPrint.log('Personal info: ${fail.message}');
      },
      (success) async {
        DPrint.log('Personal info: ${success.message}');
        await fetchProfile();
        Get.back();
        _multiFormDataManager.clear();
        setError(success.message);
      },
    );
  }

  final SecureStoreServices _secureStoreServices = SecureStoreServices();

  Future<void> logout() async {
    await _authStorageService.clearAuthData();
    Get.to(() => LoginScreen());
  }

  // //
  // //

  Future<void> changePassword(
    String currentPassword,
    String newPassword,
    String confirmPassword,
  ) async {
    final request = ChangePasswordRequestModel(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    final result = await _profileRepository.changePass(request);

    result.fold(
      (fail) {
        setError(fail.message);
        DPrint.log("change pass success result : ${fail.message}");
        setLoading(false);
      },
      (success) {
        DPrint.log("change pass success result : ${success.message}");
        Get.back();
        setLoading(false);
      },
    );
  }

  Future<void> allSubscription() async {
    setLoading(true);
    final result = await _profileRepository.getAllSubs();

    result.fold(
          (fail) => setError(fail.message),
          (success) {
        allSubs.assignAll(success.data);
        // No need for .refresh() — assignAll() does it automatically
      },
    );
    setLoading(false);
  }

  //
  // Future<void> fetchCtegory() async {
  //   final userId = await _authStorageService.getUserId();
  //   DPrint.log('UserId: $userId');
  //   if (userId == null || userId.isEmpty) {
  //     setError('User ID not found. Please log in again.');
  //     Get.snackbar('Error', 'User ID not found. Please log in again.');
  //     setLoading(false);
  //     return;
  //   }
  //
  //   final result = await _profileRepository.fetchProfile(userId);
  //
  //   result.fold(
  //         (fail) {
  //       setError(fail.message);
  //       DPrint.log('data fetch failed');
  //     },
  //         (success) {
  //       userInfo.value = success.data;
  //       DPrint.log(success.message);
  //     },
  //   );
  // }
  //
  // Future<void> fetchOngoingOrders() async {
  //
  //   final result = await _profileRepository.fetchOngoingOrder();
  //
  //   result.fold(
  //         (fail) {
  //       setError(fail.message);
  //       DPrint.log('data fetch failed');
  //     },
  //         (success) {
  //       ongoingOrder.value = success.data;
  //       DPrint.log(success.message);
  //     },
  //   );
  // }
  //
  // Future<void> fetchCompletedOrders() async {
  //
  //   final result = await _profileRepository.fetchCompletedOrder();
  //
  //   result.fold(
  //         (fail) {
  //       setError(fail.message);
  //       DPrint.log('data fetch failed');
  //     },
  //         (success) {
  //       completedOrder.value = success.data;
  //       DPrint.log(success.message);
  //     },
  //   );
  // }
}

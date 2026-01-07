import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import '../../../../core/network/models/network_failure.dart';
import '../../../../core/network/services/auth_storage_service.dart';
import '../../../profile/models/response/get_all_subscription_response_model.dart';
import '../../../profile/screens/subscription_webView_screen.dart';
import '../../data/model/payment_request_model.dart';
import '../../data/model/payment_response_model.dart';
import '../../domain/repo/payment_repo.dart';

class SubscriptionController extends GetxController {
  // final SubscriptionRepository _subscriptionRepository;
  final PaymentRepository _paymentRepository;
  final AuthStorageService _authStorageService = AuthStorageService();
  // GetUserProfileService(this._authRepository);

  SubscriptionController(this._paymentRepository);

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<GetAllSubscriptionResponseModel> plans =
      <GetAllSubscriptionResponseModel>[].obs;

  // Payment observables
  final RxBool isCreatingPayment = false.obs;
  final RxBool isProcessingPayment = false.obs;
  final RxString paymentError = ''.obs;

  Future<void> subscribeToplan(GetAllSubscriptionResponseModel plan) async {
    try {
      // Get current user ID
      // final profileService = Get.find<GetUserProfileService>();
      final userId = await _authStorageService.getUserId();

      if (userId == null || userId.isEmpty) {
        Get.snackbar(
          'Error',
          'Please login to subscribe',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade50,
          colorText: Colors.red.shade800,
        );
        return;
      }

      isCreatingPayment.value = true;
      paymentError.value = '';

      // Create payment request
      final paymentRequest = PaymentRequestModel(
        planId: plan.id,
        billingType: plan.subscriptionYearlyPlanPrice.toString(),
        // Using plan ID as booking ID for now
      );

      final result = await _paymentRepository.createPayment(paymentRequest);

      result.fold(
        (failure) {
          // Handle payment creation error
          paymentError.value = _getErrorMessage(failure);
          isCreatingPayment.value = false;

          Get.snackbar(
            'Payment Error',
            paymentError.value,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade50,
            colorText: Colors.red.shade800,
          );
        },
        (success) {
          // ✅ SUCCESS BLOCK — success is defined here
          isCreatingPayment.value = false;

          final checkoutUrl = success.data.data.checkoutUrl;

          /// ✅ OPEN WEBVIEW
          Get.to(() => SubscriptionWebViewScreen(checkoutUrl: checkoutUrl));
        },
      );
    } catch (e) {
      isCreatingPayment.value = false;
      paymentError.value = 'Unexpected error: $e';

      Get.snackbar(
        'Error',
        paymentError.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade50,
        colorText: Colors.red.shade800,
      );
    }
  }

  /// Show payment confirmation popup
  void _showPaymentConfirmationPopup(
    GetAllSubscriptionResponseModel plan,
    PaymentResponseModel paymentResponse,
  ) {
    Get.dialog(
      AlertDialog(
        title: const Text('Confirm Payment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Plan: ${plan.subscriptionPlanName}'),
            Text(
              'Price: \$${plan.subscriptionYearlyPlanPrice.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 16),
            const Text('Do you want to proceed with the payment?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: isProcessingPayment.value ? null : () => Get.back(),
            child: const Text('Cancel'),
          ),
          Obx(
            () => ElevatedButton(
              onPressed: isProcessingPayment.value
                  ? null
                  : () {
                      Get.back();
                      _processPayment(plan, paymentResponse);
                    },
              child: isProcessingPayment.value
                  ? const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text('Processing...'),
                      ],
                    )
                  : const Text('Pay Now'),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  Future<void> _processPayment(
    GetAllSubscriptionResponseModel plan,
    PaymentResponseModel paymentResponse,
  ) async {
    try {
      isProcessingPayment.value = true;

      // Log current Stripe configuration for debugging
      print('🔍 Stripe instance initialized for payment processing');

      // Show processing message
      Get.snackbar(
        'Processing Payment',
        'Initializing payment for ${plan.subscriptionPlanName}...',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.shade50,
        colorText: Colors.blue.shade800,
        duration: const Duration(seconds: 2),
      );

      // Validate that we have a proper client secret
      final clientSecret = paymentResponse.data.checkoutUrl;
      if (clientSecret.isEmpty || !clientSecret.contains('_secret_')) {
        throw Exception(
          'Invalid client secret format received from API: $clientSecret',
        );
      }

      // Validate that the payment intent ID matches the client secret
      // final expectedPrefix = paymentResponse.paymentIntentId;
      // if (!clientSecret.startsWith(expectedPrefix)) {
      //   throw Exception('Client secret does not match payment intent ID');
      // }

      print(
        '✅ Using client secret: ${clientSecret.substring(0, 20)}...',
      ); // Log first 20 chars for debugging

      // Initialize Payment Sheet with client secret from API
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Marcelo Roisman App',
          style: ThemeMode.system,
          allowsDelayedPaymentMethods: true,
        ),
      );

      // Present Payment Sheet
      final paymentResult = await Stripe.instance.presentPaymentSheet();

      // If we reach here, payment was successful with Stripe
      print('✅ Stripe payment completed successfully');

      // Now confirm the payment with our backend (non-blocking)
      // Run in background so payment success isn't blocked by confirmation issues
      // _confirmPaymentWithBackend(paymentResponse.paymentIntentId, paymentResult);

      // Payment fully completed
      isProcessingPayment.value = false;

      Get.snackbar(
        'Payment Successful! 🎉',
        'Successfully subscribed to ${plan.subscriptionPlanName} plan!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade50,
        colorText: Colors.green.shade800,
        duration: const Duration(seconds: 5),
      );
    } catch (e) {
      isProcessingPayment.value = false;

      // Log the error for debugging
      print('❌ Payment Error: $e');
      if (e is StripeException) {
        print('❌ Stripe Error Code: ${e.error.code}');
        print('❌ Stripe Error Message: ${e.error.message}');
        print('❌ Stripe Error Details: ${e.error}');
      }

      // Handle payment errors
      String errorMessage;

      if (e is StripeException) {
        // Handle Stripe specific errors
        switch (e.error.code) {
          case FailureCode.Canceled:
            // Show a neutral message for user cancellation
            Get.snackbar(
              'Payment Canceled',
              'You can try subscribing again anytime.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.orange.shade50,
              colorText: Colors.orange.shade800,
              duration: const Duration(seconds: 3),
            );
            return; // Don't show error for user cancellation
          case FailureCode.Failed:
            if (e.error.message?.contains('No such payment_intent') == true) {
              errorMessage =
                  'Payment configuration error. Please contact support.';
            } else {
              errorMessage =
                  'Payment failed: ${e.error.message ?? 'Please try again'}';
            }
            break;
          case FailureCode.Timeout:
            errorMessage = 'Payment timed out. Please try again.';
            break;
          default:
            errorMessage =
                'Payment error: ${e.error.message ?? 'Please try again'}';
        }
      } else {
        errorMessage = 'Unexpected error occurred. Please try again.';
      }

      Get.snackbar(
        'Payment Failed',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade50,
        colorText: Colors.red.shade800,
        duration: const Duration(seconds: 4),
      );
    }
  }
  // Future<void> _confirmPaymentWithBackend(String paymentIntentId, dynamic paymentResult) async {
  //     try {
  //       print('🔄 Confirming payment with backend...');
  //       print('   Payment Intent ID to confirm: $paymentIntentId');

  //       // Try with just the payment intent ID first to see if that works
  //       // The paymentMethodId might not be required or might be causing the 500 error
  //       String paymentMethodId = 'pm_card_visa';

  //       final confirmRequest = PaymentConfirmRequestModel(
  //         paymentIntentId: paymentIntentId,
  //         paymentMethodId: paymentMethodId,
  //       );

  //       // Debug: Log the exact request being sent
  //       print('📤 Sending confirmation request:');
  //       print('   Full request body: ${confirmRequest.toJson()}');

  //       final result = await _paymentRepository.confirmPayment(confirmRequest);

  //       result.fold(
  //         (networkFailure) {
  //           print('❌ Backend confirmation failed: ${_getErrorMessage(networkFailure)}');
  //           // Don't throw here - payment already succeeded with Stripe
  //           // Just log the error, the user's payment is still valid
  //         },
  //         (success) {
  //           print('✅ Payment confirmed with backend successfully');
  //         },
  //       );

  //     } catch (e) {
  //       print('❌ Error confirming payment with backend: $e');
  //       // Don't throw here - payment already succeeded with Stripe
  //     }
  //   }

  String _getErrorMessage(NetworkFailure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is ConnectionFailure) {
      return failure.message;
    } else if (failure is TimeoutFailure) {
      return failure.message;
    } else if (failure is UnauthorizedFailure) {
      return failure.message;
    } else if (failure is ValidationFailure) {
      return failure.errors.join(', ');
    } else if (failure is NoInternetFailure) {
      return failure.message;
    } else {
      return failure.message;
    }
  }
}

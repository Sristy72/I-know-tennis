import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SubscriptionWebViewScreen extends StatefulWidget {
  final String checkoutUrl;

  const SubscriptionWebViewScreen({
    super.key,
    required this.checkoutUrl,
  });

  @override
  State<SubscriptionWebViewScreen> createState() =>
      _SubscriptionWebViewScreenState();
}

class _SubscriptionWebViewScreenState
    extends State<SubscriptionWebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            final url = request.url;

            /// ✅ SUCCESS URL (adjust based on backend)
            if (url.contains('payment-success')) {
              Get.back();
              Get.snackbar(
                'Payment Successful 🎉',
                'Your subscription is now active',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.shade50,
                colorText: Colors.green.shade800,
              );
              return NavigationDecision.prevent;
            }

            /// ❌ CANCEL / FAILED URL
            if (url.contains('payment-cancel')) {
              Get.back();
              Get.snackbar(
                'Payment Cancelled',
                'You can try again anytime',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.orange.shade50,
                colorText: Colors.orange.shade800,
              );
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Payment'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Get.back(),
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

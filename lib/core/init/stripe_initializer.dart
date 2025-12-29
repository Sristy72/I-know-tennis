import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutx_core/flutx_core.dart';
import '../common/constants/stripe_key.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

class StripeInitializer {
  static Future<void> intiStripe() async {
    Stripe.publishableKey = StripeKey.publishableKey;
    Stripe.merchantIdentifier = 'merchant.com.iknowtennis.app';
  
    try {
      await Stripe.instance.applySettings();
    } catch (e) {
      DPrint.error(e);
    }
  }
}

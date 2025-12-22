import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'core/init/app_initializer.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // App initialize
  await AppInitializer.initializeApp();

  // Stripe setup
  // Stripe.publishableKey = StripeKey.publishableKey;
  // Stripe.merchantIdentifier = 'merchant.com.yourapp';
  // await Stripe.instance.applySettings();

  // Inject BottomNavController globally
  // Get.put(BottomNavController());


  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iknowtennis',
      theme: AppTheme.light,
      home: SplashScreen(),
    );
  }
}

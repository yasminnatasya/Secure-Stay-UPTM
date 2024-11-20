import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController = Get.put(SplashController());
  bool onboarding = false;
  bool signIn = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(AppRoutes.onboardingScreen); // Always navigate to onboarding
    });
  }

  Future<void> _navigateToNextScreen() async {
    // Load SharedPreferences to check the onboarding flag
    final prefs = await SharedPreferences.getInstance();
    final showOnboarding = prefs.getBool('showOnboarding') ?? true;

    // Simulate loading time
    await Future.delayed(const Duration(milliseconds: 3000));

    if (showOnboarding) {
      Get.offNamed(AppRoutes.onboardingScreen); // Navigate to onboarding
    } else {
      Get.offNamed(AppRoutes.logInActiveScreen); // Navigate to login
    }
  }

  void getCheck() async {
    SharedPreferencesClass pref = SharedPreferencesClass();
    Map<String, dynamic> getData = await pref.getData();
    onboarding = getData['onBoarding'];
    signIn = getData['signIn'];
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: BoxDecoration(
            color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            image: DecorationImage(
                image: AssetImage(ImageConstant.imgSplashScreen),
                fit: BoxFit.cover)),
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 58.h),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomImageView(
                imagePath: ImageConstant.imgVector, height: 75.v, width: 82.h),
            SizedBox(height: 16.v),
            Text("lbl_home_management".tr, style: theme.textTheme.displaySmall),
            SizedBox(height: 5.v)
          ]),
        ),
      ),
    );
  }
}

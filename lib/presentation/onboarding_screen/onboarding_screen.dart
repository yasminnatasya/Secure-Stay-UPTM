// ignore_for_file: unnecessary_statements

import 'package:uptm_secure_stay/presentation/onboarding_screen/models/onboarding_model.dart';

import 'controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  OnboardingController onboardingController = Get.put(OnboardingController());
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder(
      init: OnboardingController(),
      builder: (controller) => Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                controller: pageController,
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                onPageChanged: (value) {
                  onboardingController.sliderIndex.value = value;
                },
                itemCount: OnboardingModel.pages.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: mediaQueryData.size.width,
                    height: mediaQueryData.size.height,
                    decoration: BoxDecoration(
                        color:
                            theme.colorScheme.onPrimaryContainer.withOpacity(1),
                        gradient: LinearGradient(
                            begin: Alignment(0.5, 0),
                            end: Alignment(0.5, 1),
                            colors: [
                              appTheme.black900.withOpacity(0),
                              appTheme.black900.withOpacity(0.65)
                            ]),
                        image: DecorationImage(
                            image: AssetImage(
                                OnboardingModel.pages[index].imageUrl),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 175.v),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.h),
                            child: Text(
                              OnboardingModel.pages[index].text,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineMedium!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 31.h),
                              child: Text(
                                OnboardingModel.pages[index].subTittle,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: Colors.white,
                                ),
                              )),
                          SizedBox(height: 32.v),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 7.v,
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: OnboardingModel.pages.length,
                      effect: WormEffect(
                          dotHeight: 7.v,
                          dotWidth: 28.h,
                          dotColor: theme.colorScheme.onPrimaryContainer
                              .withOpacity(0.25),
                          activeDotColor: theme.colorScheme.primary,
                          spacing: 6.h),
                    ),
                  ),
                  SizedBox(height: 32.v),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: CustomElevatedButton(
                        text: onboardingController.sliderIndex.value ==
                                OnboardingModel.pages.length - 1
                            ? 'Get started'
                            : 'Next',
                        onPressed: () async {
                          if (onboardingController.sliderIndex.value ==
                              OnboardingModel.pages.length - 1) {
                            // Save in SharedPreferences that onboarding was completed
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setBool('showOnboarding', false);

                            // Navigate to login screen
                            Get.offNamed(AppRoutes.logInActiveScreen);
                          } else {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16.v),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.logInActiveScreen);
                      },
                      child: Text(
                          onboardingController.sliderIndex.value == 2
                              ? ''
                              : 'Skip',
                          style: CustomTextStyles.bodyLargeOnPrimaryContainer),
                    ),
                  ),
                  SizedBox(height: 40.v),
                ],
              ),
            ],
          )),
    );
  }
}

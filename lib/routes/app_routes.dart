import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/presentation/expore_page/expore_page.dart';
import 'package:uptm_secure_stay/presentation/profile_page/binding/profile_binding.dart';
import 'package:uptm_secure_stay/presentation/profile_page/profile_page.dart';
import 'package:uptm_secure_stay/presentation/splash_screen/splash_screen.dart';
import 'package:uptm_secure_stay/presentation/splash_screen/binding/splash_binding.dart';
import 'package:uptm_secure_stay/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:uptm_secure_stay/presentation/onboarding_screen/binding/onboarding_binding.dart';
import 'package:uptm_secure_stay/presentation/log_in_active_screen/log_in_active_screen.dart';
import 'package:uptm_secure_stay/presentation/log_in_active_screen/binding/log_in_active_binding.dart';
import 'package:uptm_secure_stay/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:uptm_secure_stay/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:uptm_secure_stay/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:uptm_secure_stay/presentation/forgot_password_screen/binding/forgot_password_binding.dart';

import 'package:uptm_secure_stay/presentation/verification_screen/verification_screen.dart';
import 'package:uptm_secure_stay/presentation/verification_screen/binding/verification_binding.dart';

import 'package:uptm_secure_stay/presentation/reset_password_screen/reset_password_screen.dart';
import 'package:uptm_secure_stay/presentation/reset_password_screen/binding/reset_password_binding.dart';
import 'package:uptm_secure_stay/presentation/identity_screen/identity_screen.dart';
import 'package:uptm_secure_stay/presentation/identity_screen/binding/identity_binding.dart';
import 'package:uptm_secure_stay/presentation/hobbies_screen/hobbies_screen.dart';
import 'package:uptm_secure_stay/presentation/hobbies_screen/binding/hobbies_binding.dart';
import 'package:uptm_secure_stay/presentation/personality_screen/personality_screen.dart';
import 'package:uptm_secure_stay/presentation/personality_screen/binding/personality_binding.dart';
import 'package:uptm_secure_stay/presentation/home_screen_container_screen/home_screen_container_screen.dart';
import 'package:uptm_secure_stay/presentation/home_screen_container_screen/binding/home_screen_container_binding.dart';
import 'package:uptm_secure_stay/presentation/populr_property_screen/populr_property_screen.dart';
import 'package:uptm_secure_stay/presentation/populr_property_screen/binding/populr_property_binding.dart';
import 'package:uptm_secure_stay/presentation/recommended_for_you_screen/recommended_for_you_screen.dart';
import 'package:uptm_secure_stay/presentation/recommended_for_you_screen/binding/recommended_for_you_binding.dart';
import 'package:uptm_secure_stay/presentation/property_details_screen/property_details_screen.dart';
import 'package:uptm_secure_stay/presentation/property_details_screen/binding/property_details_binding.dart';

import 'package:uptm_secure_stay/presentation/property_details_two_screen/property_details_two_screen.dart';
import 'package:uptm_secure_stay/presentation/property_details_two_screen/binding/property_details_two_binding.dart';
import 'package:uptm_secure_stay/presentation/property_details_one_screen/property_details_one_screen.dart';
import 'package:uptm_secure_stay/presentation/property_details_one_screen/binding/property_details_one_binding.dart';
import 'package:uptm_secure_stay/presentation/booking_details_screen/booking_details_screen.dart';
import 'package:uptm_secure_stay/presentation/booking_details_screen/binding/booking_details_binding.dart';

import 'package:uptm_secure_stay/presentation/enter_location_screen/enter_location_screen.dart';
import 'package:uptm_secure_stay/presentation/enter_location_screen/binding/enter_location_binding.dart';
import 'package:uptm_secure_stay/presentation/expore_with_search_screen/expore_with_search_screen.dart';
import 'package:uptm_secure_stay/presentation/expore_with_search_screen/binding/expore_with_search_binding.dart';
import 'package:uptm_secure_stay/presentation/chats_screen/chats_screen.dart';
import 'package:uptm_secure_stay/presentation/chats_screen/binding/chats_binding.dart';
import 'package:uptm_secure_stay/presentation/chat_details_screen/chat_details_screen.dart';
import 'package:uptm_secure_stay/presentation/chat_details_screen/binding/chat_details_binding.dart';
import 'package:uptm_secure_stay/presentation/call_details_screen/call_details_screen.dart';
import 'package:uptm_secure_stay/presentation/call_details_screen/binding/call_details_binding.dart';
// import 'package:uptm_secure_stay/presentation/add_property_home_screen/add_property_home_screen.dart';
// import 'package:uptm_secure_stay/presentation/add_property_home_screen/binding/add_property_home_binding.dart';

// import 'package:uptm_secure_stay/presentation/add_property_details_home1_screen/add_property_details_home1_screen.dart';
// import 'package:uptm_secure_stay/presentation/add_property_details_home1_screen/binding/add_property_details_home1_binding.dart';

import 'package:uptm_secure_stay/presentation/add_property_details_for_roommate_screen/add_property_details_for_roommate_screen.dart';
import 'package:uptm_secure_stay/presentation/add_property_details_for_roommate_screen/binding/add_property_details_for_roommate_binding.dart';
import 'package:uptm_secure_stay/presentation/property_add_success_dialog/property_add_success_dialog.dart';

import 'package:uptm_secure_stay/presentation/add_personal_details_screen/add_personal_details_screen.dart';
import 'package:uptm_secure_stay/presentation/add_personal_details_screen/binding/add_personal_details_binding.dart';
// import 'package:uptm_secure_stay/presentation/add_property_location_screen/add_property_location_screen.dart';
// import 'package:uptm_secure_stay/presentation/add_property_location_screen/binding/add_property_location_binding.dart';

// import 'package:uptm_secure_stay/presentation/event_location_screen/event_location_screen.dart';
// import 'package:uptm_secure_stay/presentation/event_location_screen/binding/event_location_binding.dart';

import 'package:uptm_secure_stay/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:uptm_secure_stay/presentation/my_profile_screen/binding/my_profile_binding.dart';
import 'package:uptm_secure_stay/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:uptm_secure_stay/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:uptm_secure_stay/presentation/favorite_screen/favorite_screen.dart';
import 'package:uptm_secure_stay/presentation/favorite_screen/binding/favorite_binding.dart';
import 'package:uptm_secure_stay/presentation/my_property_screen/my_property_screen.dart';
import 'package:uptm_secure_stay/presentation/my_property_screen/binding/my_property_binding.dart';
import 'package:uptm_secure_stay/presentation/my_cards_screen/my_cards_screen.dart';
import 'package:uptm_secure_stay/presentation/my_cards_screen/binding/my_cards_binding.dart';

import 'package:uptm_secure_stay/presentation/settings_screen/settings_screen.dart';
import 'package:uptm_secure_stay/presentation/settings_screen/binding/settings_binding.dart';
import 'package:uptm_secure_stay/presentation/my_address_screen/my_address_screen.dart';
import 'package:uptm_secure_stay/presentation/my_address_screen/binding/my_address_binding.dart';
import 'package:uptm_secure_stay/presentation/edit_address_screen/edit_address_screen.dart';
import 'package:uptm_secure_stay/presentation/edit_address_screen/binding/edit_address_binding.dart';
import 'package:uptm_secure_stay/presentation/notifications_screen/notifications_screen.dart';
import 'package:uptm_secure_stay/presentation/notifications_screen/binding/notifications_binding.dart';
import 'package:uptm_secure_stay/presentation/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:uptm_secure_stay/presentation/privacy_policy_screen/binding/privacy_policy_binding.dart';
// import 'package:uptm_secure_stay/presentation/app_navigation_screen/app_navigation_screen.dart';
// import 'package:uptm_secure_stay/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardingScreen = '/onboarding_screen';

  static const String onboarding1Screen = '/onboarding1_screen';

  static const String onboarding2Screen = '/onboarding2_screen';

  static const String logInActiveScreen = '/log_in_active_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String verificationScreen = '/verification_screen';

  static const String resetPasswordScreen = '/reset_password_screen';

  static const String basicDetailsScreen = '/basic_details_screen';

  static const String identityScreen = '/identity_screen';

  static const String hobbiesScreen = '/hobbies_screen';

  static const String personalityScreen = '/personality_screen';

  static const String livingHabitsScreen = '/living_habits_screen';

  static const String homeScreenPage = '/home_screen_page';

  static const String homeScreenTabContainerPage =
      '/home_screen_tab_container_page';

  static const String homeScreenContainerScreen =
      '/home_screen_container_screen';

  static const String populrPropertyScreen = '/populr_property_screen';

  static const String recommendedForYouScreen = '/recommended_for_you_screen';

  static const String propertyDetailsScreen = '/property_details_screen';

  static const String facilitiesScreen = '/facilities_screen';

  static const String propertyDetailsTwoScreen = '/property_details_two_screen';

  static const String propertyDetailsOneScreen = '/property_details_one_screen';

  static const String bookingDetailsScreen = '/booking_details_screen';

  static const String paymentMethodScreen = '/payment_method_screen';

  static const String enterLocationScreen = '/enter_location_screen';

  static const String exporePage = '/expore_page';

  static const String exporeWithSearchScreen = '/expore_with_search_screen';

  static const String chatsScreen = '/chats_screen';

  static const String chats1Page = '/chats1_page';

  static const String chatDetailsScreen = '/chat_details_screen';

  static const String callDetailsScreen = '/call_details_screen';

  static const String videocallDetailsScreen = '/videocall_details_screen';

  static const String addPropertyHomeScreen = '/add_property_home_screen';

  static const String addPropertyDetailsHomeScreen =
      '/add_property_details_home_screen';

  static const String addPropertyDetailsHomeFilledScreen =
      '/add_property_details_home_filled_screen';

  static const String addPropertyDetailsHome1Screen =
      '/add_property_details_home1_screen';

  static const String addPropertyDetailsForRoommateScreen =
      '/add_property_details_for_roommate_screen';

  static const String addPersonalDetailsScreen = '/add_personal_details_screen';

  static const String addPropertyLocationScreen =
      '/add_property_location_screen';

  static const String addEventOneScreen = '/add_event_one_screen';

  static const String addEventScreen = '/add_event_screen';

  static const String eventLocationScreen = '/event_location_screen';

  static const String profilePage = '/profile_page';

  static const String profile1Screen = '/profile1_screen';

  static const String myProfileScreen = '/my_profile_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String favoriteScreen = '/favorite_screen';

  static const String myPropertyScreen = '/my_property_screen';

  static const String myCardsScreen = '/my_cards_screen';

  static const String addNewCardScreen = '/add_new_card_screen';

  static const String addNewCard1Screen = '/add_new_card1_screen';

  static const String settingsScreen = '/settings_screen';

  static const String addNewAddressScreen = '/add_new_address_screen';

  static const String myAddressScreen = '/my_address_screen';

  static const String editAddressScreen = '/edit_address_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String privacyPolicyScreen = '/privacy_policy_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        OnboardingBinding(),
      ],
    ),

    GetPage(
      name: logInActiveScreen,
      page: () => LogInActiveScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        LogInActiveBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: verificationScreen,
      page: () => VerificationScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        VerificationBinding(),
      ],
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        ResetPasswordBinding(),
      ],
    ),
    GetPage(
      name: identityScreen,
      page: () => IdentityScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        IdentityBinding(),
      ],
    ),
    // GetPage(
    //   name: hobbiesScreen,
    //   page: () => HobbiesScreen(),
    //   transition: Transition.rightToLeft,
    //   bindings: [
    //     HobbiesBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: personalityScreen,
    //   page: () => PersonalityScreen(),
    //   transition: Transition.rightToLeft,
    //   bindings: [
    //     PersonalityBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: livingHabitsScreen,
    //   page: () => LivingHabitsScreen(),
    //   transition: Transition.rightToLeft,
    //   bindings: [
    //     LivingHabitsBinding(),
    //   ],
    // ),
    GetPage(
      name: homeScreenContainerScreen,
      page: () => HomeScreenContainerScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        HomeScreenContainerBinding(),
      ],
    ),
    GetPage(
      name: populrPropertyScreen,
      page: () => PopulrPropertyScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        PopulrPropertyBinding(),
      ],
    ),
    GetPage(
      name: recommendedForYouScreen,
      page: () => RecommendedForYouScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        RecommendedForYouBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.propertyDetailsScreen,
      page: () =>
          PropertyDetailsScreen(propertyId: Get.parameters['propertyId']!),
      transition: Transition.rightToLeft,
      bindings: [
        PropertyDetailsBinding(),
      ],
    ),

    GetPage(
      name: propertyDetailsTwoScreen,
      page: () => PropertyDetailsTwoScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        PropertyDetailsTwoBinding(),
      ],
    ),
    GetPage(
      name: propertyDetailsOneScreen,
      page: () => PropertyDetailsOneScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        PropertyDetailsOneBinding(),
      ],
    ),
    GetPage(
      name: bookingDetailsScreen,
      page: () => BookingDetailsScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        BookingDetailsBinding(),
      ],
    ),
    GetPage(
      name: enterLocationScreen,
      page: () => EnterLocationScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        EnterLocationBinding(),
      ],
    ),
    GetPage(
      name: exporePage,
      page: () => ExporePage(),
      transition: Transition.rightToLeft,
      // bindings: [
      //   EnterLocationBinding(),
      // ],
    ),
    // GetPage(
    //   name: exporeWithSearchScreen,
    //   page: () => ExporeWithSearchScreen(),
    //   transition: Transition.rightToLeft,
    //   bindings: [
    //     ExporeWithSearchBinding(),
    //   ],
    // ),
    GetPage(
      name: chatsScreen,
      page: () => ChatsScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        ChatsBinding(),
      ],
    ),
    GetPage(
      name: chatDetailsScreen,
      page: () {
        // Check if Get.arguments is not null and contains the necessary keys
        final arguments = Get.arguments ?? {};
        final String chatId = arguments['chatId'] ?? '';
        final String ownerId = arguments['ownerId'] ?? '';
        final Map<String, dynamic> propertyDetails =
            arguments['propertyDetails'] ?? {};

        if (chatId.isEmpty || ownerId.isEmpty || propertyDetails.isEmpty) {
          // Handle the case where the arguments are missing
          return Scaffold(
            body: Center(
              child: Text("Invalid chat details. Please try again."),
            ),
          );
        }

        return ChatDetailsScreen(
          chatId: chatId,
          ownerId: ownerId,
          propertyDetails: propertyDetails,
        );
      },
      transition: Transition.rightToLeft,
      bindings: [
        ChatDetailsBinding(),
      ],
    ),

    GetPage(
      name: callDetailsScreen,
      page: () => CallDetailsScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        CallDetailsBinding(),
      ],
    ),
    // GetPage(
    //   name: addPropertyHomeScreen,
    //   page: () => AddPropertyHomeScreen(),
    //   transition: Transition.downToUp,
    //   bindings: [
    //     AddPropertyHomeBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: addPropertyDetailsHome1Screen,
    //   page: () => AddPropertyDetailsHome1Screen(),
    //   transition: Transition.rightToLeft,
    //   bindings: [
    //     AddPropertyDetailsHome1Binding(),
    //   ],
    // ),
    GetPage(
      name: addPropertyDetailsForRoommateScreen,
      page: () => AddPropertyDetailsForRoommateScreen(),
      transition: Transition.downToUp,
      bindings: [
        AddPropertyDetailsForRoommateBinding(),
      ],
    ),

    GetPage(
      name: addPersonalDetailsScreen,
      page: () => AddPersonalDetailsScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        AddPersonalDetailsBinding(),
      ],
    ),
    // GetPage(
    //   name: addPropertyLocationScreen,
    //   page: () => AddPropertyLocationScreen(),
    //   transition: Transition.rightToLeft,
    //   bindings: [
    //     AddPropertyLocationBinding(),
    //   ],
    // ),

    // GetPage(
    //   name: eventLocationScreen,
    //   page: () => EventLocationScreen(),
    //   transition: Transition.rightToLeft,
    //   bindings: [
    //     EventLocationBinding(),
    //   ],
    // ),
    GetPage(
      name: profilePage,
      page: () => ProfilePage(),
      transition: Transition.rightToLeft,
      bindings: [
        ProfileBinding(),
      ],
    ),
    // GetPage(
    //   name: profile1Screen,
    //   page: () => Profile1Screen(),
    //transition: Transition.rightToLeft,

    //   bindings: [
    //     Profile1Binding(),
    //   ],
    // ),

    GetPage(
      name: myProfileScreen,
      page: () => MyProfileScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        MyProfileBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: favoriteScreen,
      page: () => FavoriteScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        FavoriteBinding(),
      ],
    ),
    GetPage(
      name: myPropertyScreen,
      page: () => MyPropertyScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        MyPropertyBinding(),
      ],
    ),
    GetPage(
      name: myCardsScreen,
      page: () => MyCardsScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        MyCardsBinding(),
      ],
    ),

    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        SettingsBinding(),
      ],
    ),
    GetPage(
      name: myAddressScreen,
      page: () => MyAddressScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        MyAddressBinding(),
      ],
    ),
    GetPage(
      name: editAddressScreen,
      page: () => EditAddressScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        EditAddressBinding(),
      ],
    ),
    GetPage(
      name: notificationsScreen,
      page: () => NotificationsScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        NotificationsBinding(),
      ],
    ),
    GetPage(
      name: privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        PrivacyPolicyBinding(),
      ],
    ),
    // GetPage(
    //   name: appNavigationScreen,
    //   page: () => AppNavigationScreen(),
    //   transition: Transition.rightToLeft,
    //   bindings: [
    //     AppNavigationBinding(),
    //   ],
    // ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      transition: Transition.rightToLeft,
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}

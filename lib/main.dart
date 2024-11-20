import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/app_export.dart';
import 'package:uptm_secure_stay/widgets/restart_widget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Declare a global notification plugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local notifications
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Set device orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Check if the encryption key is defined
  if (!dotenv.isEveryDefined(['ENCRYPTION_KEY'])) {
    print('Error: ENCRYPTION_KEY not found in .env');
  }

  // Initialize Firebase
  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final showOnboarding = prefs.getBool('showOnboarding') ?? true;

  runApp(RestartWidget(
    child: MyApp(
      showOnboarding: showOnboarding,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final bool showOnboarding;

  MyApp({required this.showOnboarding});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      title: 'uptm_securestay',
      initialBinding: InitialBindings(),
      initialRoute:
          AppRoutes.splashScreen, // Always start with the splash screen
      getPages: AppRoutes.pages,
    );
  }
}

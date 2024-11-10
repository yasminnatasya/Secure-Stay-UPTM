import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/app_export.dart';
import 'package:uptm_secure_stay/widgets/restart_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      translations: AppLocalization(),
      locale: Get.deviceLocale, // for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'uptm_securestay',
      initialBinding: InitialBindings(),
      initialRoute:
          AppRoutes.initialRoute, // Set splash screen as initial route
      getPages: AppRoutes.pages,
    );
  }
}

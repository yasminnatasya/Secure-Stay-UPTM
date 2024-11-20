import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/log_in_active_screen/models/log_in_active_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart'; // For location-based anomaly detection
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class LogInActiveController extends GetxController {
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isLoading = false.obs;

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  int maxLoginAttempts = 5;
  int currentLoginAttempts = 0;
  Duration cooldownDuration = Duration(minutes: 2); // Cooldown time

  @override
  void onInit() {
    super.onInit();
    configureEmailOtp();

    resetLoginState();
  }

  // Method to reset login state
  void resetLoginState() {
    remainingCooldown.value = Duration.zero;
    currentLoginAttempts = 0;
    isLoading.value = false;
    emailFieldController.clear();
    passwordFieldController.clear();
  }

  void configureEmailOtp() {
    EmailOTP.config(
      appName: 'SecureStay UPTM',
      otpType: OTPType.numeric,
      emailTheme: EmailTheme.v1,
    );

    EmailOTP.setSMTP(
      host: 'mail.rohitchouhan.com',
      emailPort: EmailPort.port587,
      secureType: SecureType.tls,
      username: 'noreply@email-otp.rohitchouhan.com',
      password: 'vgk!cer8xku9BQN5nhk',
    );

    EmailOTP.setTemplate(
      template: '''
      <div style="background-color: #f4f4f4; padding: 20px; font-family: Arial, sans-serif;">
        <div style="background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
          <h1 style="color: #333;">{{appName}}</h1>
          <p style="color: #333;">Your login OTP is <strong>{{otp}}</strong></p>
          <p style="color: #333;">Please use this OTP to complete your login. This OTP is valid for 5 minutes.</p>
          <p style="color: #333;">Thank you for using our service.</p>
        </div>
      </div>
      ''',
    );
  }

  Future<Map<String, String>> getCurrentIPAddressAndLocation() async {
    try {
      final response = await http.get(Uri.parse('http://ip-api.com/json/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'ip': data['query'] ?? 'Unknown IP',
          'country': data['country'] ?? 'Unknown Country',
        };
      } else {
        print('Failed to get IP and location: ${response.statusCode}');
        return {'ip': 'Unknown IP', 'country': 'Unknown Country'};
      }
    } catch (e) {
      print('Error fetching IP and location: $e');
      return {'ip': 'Unknown IP', 'country': 'Unknown Country'};
    }
  }

  Future<void> loginUser() async {
    String email = emailFieldController.text.trim();
    try {
      String password = passwordFieldController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        Get.snackbar('Error', 'Email and password cannot be empty');
        return;
      }

      isLoading.value = true;

      // Check for cooldown
      DocumentSnapshot userCooldownDoc =
          await _firestore.collection('login_attempts').doc(email).get();

      if (userCooldownDoc.exists) {
        Map<String, dynamic>? cooldownData =
            userCooldownDoc.data() as Map<String, dynamic>?;
        Timestamp? cooldownEnd = cooldownData?['cooldown_end'];

        if (cooldownEnd != null &&
            cooldownEnd.toDate().isAfter(DateTime.now())) {
          await updateCooldown(email);

          Get.snackbar(
            'Login Disabled',
            'Too many login attempts. Try again in ${remainingCooldown.value.inMinutes} minutes.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange,
            colorText: Colors.white,
          );
          isLoading.value = false;
          return;
        }
      }

      // Perform login
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;

        // Fetch user document
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(uid).get();

        if (userDoc.exists) {
          Map<String, dynamic>? userData =
              userDoc.data() as Map<String, dynamic>?;

          String lastKnownIP = userData?['last_known_ip'] ?? '';
          String lastKnownCountry = userData?['last_known_country'] ?? '';
          bool isInternational = userData?['is_international_student'] ?? false;

          // Fetch current IP and location
          Map<String, String> locationData =
              await getCurrentIPAddressAndLocation();
          String currentIP = locationData['ip']!;
          String currentCountry = locationData['country']!;

          // Allow flexibility for international students and minor IP differences
          bool isSuspiciousLogin = false;

          if (isInternational) {
            // For international students, only flag if country changes
            if (currentCountry != "Malaysia" &&
                currentCountry != lastKnownCountry) {
              isSuspiciousLogin = true;
            }
          } else {
            // For local students, allow flexibility within the same country
            if (currentCountry != "Malaysia" ||
                (lastKnownIP != currentIP &&
                    currentCountry != lastKnownCountry)) {
              isSuspiciousLogin = true;
            }
          }

          if (isSuspiciousLogin) {
            await handleAnomaly(uid, email,
                'Unusual login from $currentCountry (IP: $currentIP)');
            return; // Stop further execution
          }

          // Update user's last login details
          await _firestore.collection('users').doc(uid).update({
            'last_login': Timestamp.now(),
            'last_known_ip': currentIP,
            'last_known_country': currentCountry
          });

          // Reset login attempts
          await resetLoginAttempts(email);

          // Navigate to home screen
          Get.toNamed(AppRoutes.homeScreenContainerScreen);
        }
      }
    } on FirebaseAuthException catch (e) {
      currentLoginAttempts++;
      await handleLoginError(e, email);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> handleAnomaly(
      String userId, String email, String anomalyReason) async {
    print('Starting anomaly handling for $email...');
    await startCooldown(email); // Trigger cooldown

    final smtpServer =
        gmail('kl2211012953@student.kuptm.edu.my', 'cbyt mlts humf ambn');

    final message = Message()
      ..from = Address('kl2211012953@student.kuptm.edu.my', 'SecureStay UPTM')
      ..recipients.add(email)
      ..subject = 'Security Alert: Anomalous Activity Detected'
      ..html = '''
  <div style="background-color: #f4f4f4; padding: 20px; font-family: Arial, sans-serif;">
    <div style="background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
      <h1 style="color: #333;">SecureStay UPTM</h1>
      <p style="color: #333;">We detected anomalous activity for your account:</p>
      <p style="color: #333;"><strong>Reason:</strong> $anomalyReason</p>
      <p style="color: #333;">If this was not you, please reset your password immediately.</p>
      <p style="color: #333;">Thank you for using SecureStay UPTM.</p>
    </div>
  </div>
  ''';

    try {
      final sendReport = await send(message, smtpServer);
      print('Anomaly alert email sent: ${sendReport.toString()}');
    } catch (e) {
      print('Failed to send anomaly alert email: $e');
    }

    Get.snackbar(
      'Login Disabled',
      'Anomaly detected: $anomalyReason. Account temporarily disabled.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );

    isLoading.value = false;
  }

  RxString errorMessage = ''.obs; // Holds the error message

  Future<void> handleLoginError(FirebaseAuthException e, String email) async {
    String error;

    // Check the Firebase exception code
    switch (e.code) {
      case 'invalid-email':
        error = 'The email address is badly formatted.';
        break;
      case 'user-disabled':
        error = 'This user has been disabled.';
        break;
      case 'user-not-found':
        error = 'No user found for this email.';
        break;
      case 'wrong-password':
        error = 'Incorrect password. Please try again.';
        break;

      default:
        if (e.message != null &&
            e.message!.contains('The supplied auth credential is incorrect')) {
          error = 'Incorrect password. Please try again.';
        } else {
          error = 'An unknown error occurred.';
        }
    }

    // Increment failed login attempts after identifying the error
    currentLoginAttempts++;

    // Trigger anomaly or cooldown if max attempts are reached
    if (currentLoginAttempts >= maxLoginAttempts) {
      await handleAnomaly(
          '', email, 'Multiple incorrect password attempts detected');
      await startCooldown(email);
      error =
          'Too many failed attempts. Account locked for ${cooldownDuration.inMinutes} minutes.';
    }

    errorMessage.value = error; // Update error message
  }

  Future<void> startCooldown(String email) async {
    Timestamp cooldownEnd =
        Timestamp.fromDate(DateTime.now().add(cooldownDuration));
    await _firestore.collection('login_attempts').doc(email).set({
      'cooldown_end': cooldownEnd,
      'last_attempt': Timestamp.now(),
    });
    print('Cooldown started for $email until $cooldownEnd.');
  }

  Rx<Duration> remainingCooldown = Duration.zero.obs;

  Future<void> updateCooldown(String email) async {
    DocumentSnapshot userCooldownDoc =
        await _firestore.collection('login_attempts').doc(email).get();

    if (userCooldownDoc.exists) {
      Map<String, dynamic>? cooldownData =
          userCooldownDoc.data() as Map<String, dynamic>?;
      Timestamp? cooldownEnd = cooldownData?['cooldown_end'];

      if (cooldownEnd != null && cooldownEnd.toDate().isAfter(DateTime.now())) {
        remainingCooldown.value =
            cooldownEnd.toDate().difference(DateTime.now());

        // Start a timer to dynamically update the cooldown duration
        Timer.periodic(const Duration(seconds: 1), (timer) async {
          if (remainingCooldown.value.inSeconds > 0) {
            remainingCooldown.value -= const Duration(seconds: 1);
          } else {
            // Reset remainingCooldown, cancel the timer, and reset login attempts
            remainingCooldown.value = Duration.zero;
            timer.cancel();

            // Reset login attempts and delete cooldown record
            await resetLoginAttempts(email);
          }
        });
      }
    } else {
      // If no cooldown document exists, reset the cooldown
      remainingCooldown.value = Duration.zero;
    }
  }

  Future<void> resetLoginAttempts(String email) async {
    currentLoginAttempts = 0; // Reset the login attempts counter
    await _firestore
        .collection('login_attempts')
        .doc(email)
        .delete(); // Remove cooldown record
    print('Login attempts reset and cooldown removed for $email.');
  }

  Future<String> getCurrentIPAddress() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.ipify.org?format=json'));
      if (response.statusCode == 200) {
        final ip = jsonDecode(response.body)['ip'];
        return ip;
      } else {
        print('Failed to get IP: ${response.statusCode}');
        return 'Unknown IP';
      }
    } catch (e) {
      print('Error fetching IP: $e');
      return 'Unknown IP';
    }
  }

  String getUserAgent() {
    // Mock or implement logic to get user agent
    return 'FlutterApp/1.0 (Android)';
  }

  void togglePasswordVisibility() {
    isShowPassword.value = !isShowPassword.value;
  }
}

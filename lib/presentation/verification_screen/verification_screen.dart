import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/verification_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final VerificationController verificationController =
      Get.put(VerificationController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Timer _timer;
  int _remainingTime = 300;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
        Get.snackbar('Error', 'OTP expired. Please request a new one.');
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get timerText {
    final minutes = (_remainingTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingTime % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? userInfo = Get.arguments;

    if (userInfo == null) {
      Get.snackbar('Error', 'User information is missing.');
      return const Scaffold(
        body: Center(child: Text('An error occurred. Please try again.')),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildHeader(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  children: [
                    const Text(
                      "Enter the 6-digit OTP sent to your email",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 24),
                    Text("Time remaining: $timerText",
                        style: TextStyle(fontSize: 16, color: Colors.red)),
                    const SizedBox(height: 24),
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      controller: verificationController.otpController.value,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Please enter a 6-digit OTP';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor:
                              Colors.blue, // Set button background to blue
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            verificationController.verifyOtp(userInfo);
                          }
                        },
                        child: const Text(
                          'Verify',
                          style: TextStyle(
                              color: Colors.white), // Set text color to white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('OTP Verification',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

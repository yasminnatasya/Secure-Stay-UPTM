import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/core/utils/validation_functions.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signUpController = Get.put(SignUpController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: appTheme.white,
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: RichText(
          text: TextSpan(children: [
            TextSpan(text: "lbl_already".tr, style: theme.textTheme.bodyLarge),
            TextSpan(
                text: "msg_have_an_account".tr,
                style: theme.textTheme.bodyLarge),
            TextSpan(
                text: "lbl_sign_in".tr,
                style: CustomTextStyles.titleMediumBold),
          ]),
          textAlign: TextAlign.center,
        ),
      ).marginOnly(bottom: 40.h),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: 40.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("lbl_sign_up2".tr,
                            style: theme.textTheme.headlineMedium),
                      ),
                      SizedBox(height: 8.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("msg_sign_up_for_our".tr,
                            style: theme.textTheme.bodyLarge),
                      ),
                      SizedBox(height: 16.v),
                      _buildMasterUsername(),
                      SizedBox(height: 16.v),
                      _buildMasterUsername1(),
                      SizedBox(height: 16.v),
                      _buildStudentId(),
                      SizedBox(height: 16.v),
                      _buildMasterUsername2(),
                      SizedBox(height: 30.v),
                      _buildSignUpButton(),
                      SizedBox(height: 94.v),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    return CustomTextFormField(
      controller: signUpController.fullNameController,
      hintText: "Enter your full name",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter full name".tr;
        }
        return null;
      },
    );
  }

  Widget _buildStudentId() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Student ID".tr, style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.v),
        CustomTextFormField(
          controller: signUpController.studentIdController,
          hintText: "Enter your student ID",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your student ID".tr;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildMasterUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Full Name", style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.v),
        _buildFullName(),
      ],
    );
  }

  Widget _buildEmail() {
    return CustomTextFormField(
      controller: signUpController.emailController,
      hintText: "Enter your student email address",
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || !isValidEmail(value, isRequired: true)) {
          return "Please enter a valid email address";
        }
        return null;
      },
    );
  }

  Widget _buildMasterUsername1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email Address", style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.v),
        _buildEmail(),
      ],
    );
  }

  Widget _buildPassword() {
    return Obx(() => CustomTextFormField(
          controller: signUpController.passwordController,
          validator: (value) {
            if (value == null || value.length < 6) {
              // Example of password length check
              return "Password must be at least 6 characters";
            }
            return null;
          },
          hintText: "Enter your password",
          obscureText: signUpController.isShowPassword.value,
          suffix: GestureDetector(
            onTap: () {
              signUpController.togglePasswordVisibility();
            },
            child: Icon(
              signUpController.isShowPassword.value
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
          ),
        ));
  }

  Widget _buildMasterUsername2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password", style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.v),
        _buildPassword(),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return Obx(() => CustomElevatedButton(
          text: signUpController.isLoading.value ? "Processing..." : "Sign Up",
          onPressed: signUpController.isLoading.value
              ? null
              : () {
                  if (_formKey.currentState!.validate()) {
                    signUpController.signUp();
                  } else {
                    Get.snackbar(
                        'Error', 'Please correct the errors in the form');
                  }
                },
        ));
  }
}

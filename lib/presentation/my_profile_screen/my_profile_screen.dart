import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'controller/my_profile_controller.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  MyProfileController myProfileController = Get.put(MyProfileController());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _nameController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      try {
        final userDoc =
            await _firestore.collection('users').doc(currentUser.uid).get();
        if (userDoc.exists) {
          setState(() {
            myProfileController.name = userDoc['name'] ?? 'Unknown';
            myProfileController.email = userDoc['email'] ?? 'No Email';
            _nameController.text = myProfileController.name;
          });
        }
      } catch (e) {
        print('Error fetching user profile: $e');
      }
    }
  }

  Future<void> updateUserName() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null && _nameController.text.isNotEmpty) {
      try {
        await _firestore.collection('users').doc(currentUser.uid).update({
          'name': _nameController.text,
        });
        setState(() {
          myProfileController.name = _nameController.text;
          _isEditing = false;
        });
      } catch (e) {
        print('Error updating user name: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appTheme.white,
      body: SafeArea(
        child: Container(
          color: appTheme.gray100,
          width: double.maxFinite,
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 40.v),
              _buildProfileInfo(),
              SizedBox(height: 24.v),
              _buildEditableNameField(),
              SizedBox(height: 16.v),
              _buildProfileEditText(
                label: "Email Address",
                value: myProfileController.email,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(top: 18.v, bottom: 19.v),
      decoration: AppDecoration.outlineGray10001,
      child: CustomAppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(), // Fixed the back button issue
        ),
        centerTitle: true,
        title: Text("My Profile", style: theme.textTheme.headlineSmall),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgAvtar1,
          height: 100.adaptSize,
          width: 100.adaptSize,
        ),
        SizedBox(height: 16.v),
      ],
    );
  }

  Widget _buildEditableNameField() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name",
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: appTheme.gray800)),
          SizedBox(height: 6.v),
          _isEditing
              ? TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    hintText: "Enter your name",
                  ),
                )
              : Text(myProfileController.name,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: appTheme.gray900)),
          SizedBox(height: 8.v),
          _isEditing
              ? ElevatedButton(
                  onPressed: updateUserName,
                  child: Text("Save"),
                )
              : TextButton(
                  onPressed: () {
                    setState(() {
                      _isEditing = true;
                    });
                  },
                  child: Text("Edit"),
                ),
        ],
      ),
    );
  }

  Widget _buildProfileEditText({required String label, required String value}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: appTheme.gray800)),
          SizedBox(height: 6.v),
          Text(value,
              style:
                  theme.textTheme.bodyLarge!.copyWith(color: appTheme.gray900)),
        ],
      ),
    );
  }
}

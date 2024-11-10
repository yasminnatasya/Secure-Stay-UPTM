import 'package:uptm_secure_stay/presentation/expore_page/expore_page.dart';
import 'package:uptm_secure_stay/presentation/enter_location_screen/controller/enter_location_controller.dart'
    as enter_location_controller; // Use an alias

import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';

class EnterLocationScreen extends StatefulWidget {
  const EnterLocationScreen({super.key});

  @override
  State<EnterLocationScreen> createState() => _EnterLocationScreenState();
}

class _EnterLocationScreenState extends State<EnterLocationScreen> {
  enter_location_controller.EnterLocationController enterLocationController =
      Get.put(enter_location_controller.EnterLocationController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: GetBuilder<enter_location_controller.EnterLocationController>(
        init: enter_location_controller.EnterLocationController(),
        builder: (controller) => Scaffold(
          body: Column(
            children: [
              _buildHeaderSection(),
              Expanded(
                child: controller.isTap.value
                    ? ExporePage() // Modified to load the map on tap
                    : _buildLocationPrompt(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 5,
        ),
      ]),
      child: Text(
        "Explore Nearby Accommodations",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLocationPrompt() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on, size: 100, color: Colors.blue),
          SizedBox(height: 20),
          Text(
            "Allow us to access your location to show nearby accommodations.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          CustomElevatedButton(
            text: "Use Current Location",
            onPressed: () async {
              await enterLocationController.getUserLocation();
              enterLocationController.isTap.value = true;
              enterLocationController.update();
            },
          ),
        ],
      ),
    );
  }
}

import 'package:uptm_secure_stay/presentation/add_property_details_for_roommate_screen/add_property_details_for_roommate_screen.dart';
import 'package:uptm_secure_stay/presentation/my_property_screen/edit_property_screen.dart';
import 'package:uptm_secure_stay/presentation/my_property_screen/models/bedroomlist_item_model.dart';
import 'package:uptm_secure_stay/widgets/animation_widget.dart';

import '../my_property_screen/widgets/bedroomlist_item_widget.dart';
import 'controller/my_property_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';

class MyPropertyScreen extends StatefulWidget {
  const MyPropertyScreen({super.key});

  @override
  State<MyPropertyScreen> createState() => _MyPropertyScreenState();
}

class _MyPropertyScreenState extends State<MyPropertyScreen> {
  final MyPropertyController myPropertyController =
      Get.put(MyPropertyController());

  @override
  void initState() {
    super.initState();
    // Re-fetch properties whenever this screen is accessed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      myPropertyController.fetchProperties();
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: appTheme.white,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          color: appTheme.gray100,
          child: Column(
            children: [
              _buildHeader(),
              _buildBedroomList(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(
        top: 18.v,
        bottom: 19.v,
      ),
      decoration: AppDecoration.outlineGray10001,
      child: CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
          onTap: () {
            Get.back();
          },
          imagePath: ImageConstant.imgIcArrowLeft,
          margin: EdgeInsets.only(
            left: 20.h,
            top: 2.v,
            bottom: 5.v,
          ),
        ),
        centerTitle: true,
        title: AppbarSubtitle(
          text: "lbl_my_property".tr,
        ),
      ),
    );
  }

  /// Section Widget
Widget _buildBedroomList() {
  return Expanded(
    child: Obx(
      () => animationFunction(
        0,
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(height: 16.v),
          itemCount: myPropertyController
              .myPropertyModelObj.value.bedroomlistItemList.value.length,
          itemBuilder: (context, index) {
            BedroomlistItemModel model = myPropertyController
                .myPropertyModelObj.value.bedroomlistItemList.value[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.v),
              ),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AbsorbPointer(
                      absorbing: true, // Disable only this part
                      child: BedroomlistItemWidget(model),
                    ),
                    SizedBox(height: 8.v),
                    AbsorbPointer(
                      absorbing: true, // Disable only this part
                      child: Text(
                        model.isAvailable
                            ? "Status: Available"
                            : "Status: Not Available",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: model.isAvailable ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              // Wait for result from EditPropertyScreen
                              bool? isUpdated = await Get.to(
                                () => EditPropertyScreen(property: model),
                              );

                              // If updated, refresh properties
                              if (isUpdated == true) {
                                myPropertyController.fetchProperties();
                              }
                            },
                            child: Text('Edit',
                                style: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(width: 8.v),
                          ElevatedButton(
                            onPressed: () async {
                              bool confirmDelete = await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Delete Property'),
                                  content: Text(
                                      'Are you sure you want to delete this property?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: Text('Delete'),
                                    ),
                                  ],
                                ),
                              );

                              if (confirmDelete) {
                                await myPropertyController.deleteProperty(model);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: Text(
                              'Delete',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}


}

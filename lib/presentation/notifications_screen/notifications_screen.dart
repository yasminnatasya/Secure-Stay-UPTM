import 'package:uptm_secure_stay/widgets/animation_widget.dart';

import '../notifications_screen/widgets/dominosbuyone_item_widget.dart';
import 'controller/notifications_controller.dart';
import 'models/dominosbuyone_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  NotificationsController notificationsController =
      Get.put(NotificationsController());
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
              _buildDominoSBuyOne(),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5.v),
          CustomAppBar(
            leadingWidth: 44.h,
            leading: AppbarLeadingImage(
              onTap: () {
                Get.back();
              },
              imagePath: ImageConstant.imgIcArrowLeft,
              margin: EdgeInsets.only(
                left: 20.h,
                top: 5.v,
                bottom: 2.v,
              ),
            ),
            centerTitle: true,
            title: AppbarSubtitle(
              text: "lbl_notifications".tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDominoSBuyOne() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
        child: animationFunction(
          0,
          ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 16.v,
              );
            },
            itemCount: dominosbuyoneItemList.length,
            itemBuilder: (context, index) {
              return DominosbuyoneItemWidget(
                dominoSBuyOne: dominosbuyoneItemList[index].dominoSBuyOne,
                buyGetFree: dominosbuyoneItemList[index].buyGetFree,
                duration: dominosbuyoneItemList[index].duration,
              );
            },
          ),
        ),
      ),
    );
  }
}

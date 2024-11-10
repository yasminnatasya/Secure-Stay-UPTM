// ignore_for_file: must_be_immutable

import 'package:uptm_secure_stay/presentation/delete_address_dialog/delete_address_dialog.dart';

import 'controller/edit_and_delete_address_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

class EditAndDeleteAddressBottomSheet extends StatelessWidget {
  EditAndDeleteAddressBottomSheet(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  EditAndDeleteAddressController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      height: 167.v,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL32,
      ),
      child: Column(
        children: [
          Container(
            width: 70.h,
            height: 5.v,
            decoration: ShapeDecoration(
              color: Color(0xFFDBDBDB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.toNamed(AppRoutes.editAddressScreen);
                  },
                  child: Container(
                    width: double.infinity,
                    child: Text('Edit',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleMedium),
                  ),
                ),
                Divider(
                  color: appTheme.gray300,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          backgroundColor: Colors.transparent,
                          contentPadding: EdgeInsets.zero,
                          insetPadding: const EdgeInsets.only(left: 0),
                          content: DeleteAddressDialog()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    child: GestureDetector(
                      child: Text('Delete',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleMedium),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

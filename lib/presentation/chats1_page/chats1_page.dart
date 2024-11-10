import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uptm_secure_stay/presentation/chat_details_screen/chat_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

class Chats1Page extends StatefulWidget {
  const Chats1Page({super.key});

  @override
  State<Chats1Page> createState() => _Chats1PageState();
}

class _Chats1PageState extends State<Chats1Page> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              _buildHeader(),
              _buildChatsList(), // Use only Firestore data for chat list
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeader() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.only(top: 18.v, bottom: 19.v),
      decoration: AppDecoration.outlineGray10001,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "lbl_chats2".tr,
            style: theme.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildChatsList() {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .where('participants',
                arrayContains: FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No contacts yet."));
          }

          final chatDocuments = snapshot.data!.docs;
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
            physics: BouncingScrollPhysics(),
            itemCount: chatDocuments.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.v),
            itemBuilder: (context, index) {
              final chatData = chatDocuments[index];
              final List participants = chatData['participants'] as List;
              final String currentUserId =
                  FirebaseAuth.instance.currentUser?.uid ?? '';

              // Identify the contact ID that is not the current user
              final contactId = participants.firstWhere(
                (id) => id != currentUserId,
                orElse: () => null,
              );

              // Check if contactId is valid
              if (contactId == null) return Container();

              // Fetch contact details from Firestore
              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(contactId)
                    .get(),
                builder: (context, contactSnapshot) {
                  if (!contactSnapshot.hasData ||
                      !contactSnapshot.data!.exists) {
                    return Container();
                  }

                  final contactData = contactSnapshot.data!;
                  final contactName = contactData['name'] ?? 'Unknown';
                  final contactImage = contactData['profileImage'] ??
                      ImageConstant.imgEllipse22; // Use a default image

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(contactImage),
                      onBackgroundImageError: (error, stackTrace) =>
                          Icon(Icons.person), // Fallback icon
                    ),
                    title: Text(contactName),
                    subtitle: Text("Tap to chat"),
                    onTap: () {
                      final chatId = chatData.id;
                      Get.to(
                        ChatDetailsScreen(
                          chatId: chatId,
                          ownerId: contactId,
                          propertyDetails: {
                            'title': 'Property Title',
                            'address': 'Property Address',
                            'monthlyRent': 'Monthly Rent',
                            'imageUrl': ImageConstant
                                .imgRectangle4429, // Placeholder image
                          },
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/chat_details_screen/chat_details_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Container(
        color: appTheme.gray100,
        width: double.infinity,
        child: Column(
          children: [
            _buildHeader(),
            _buildChatsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 18, bottom: 19),
      decoration: AppDecoration.outlineGray10001,
      child: Text(
        "Chats",
        style: theme.textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildChatsList() {
    if (currentUserId.isEmpty) {
      print("Error: User not logged in.");
      return Center(child: Text("Error: User not logged in."));
    }

    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .where('participants', arrayContains: currentUserId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            print("No chats found for user: $currentUserId");
            return Center(child: Text("No chats yet."));
          }

          final chatDocuments = snapshot.data!.docs;

          return ListView.builder(
            itemCount: chatDocuments.length,
            itemBuilder: (context, index) {
              final chatData = chatDocuments[index];
              final chatId = chatData.id;
              final participants = List<String>.from(chatData['participants']);

              final otherUserId = participants.firstWhere(
                (id) => id != currentUserId || participants.length == 1,
                orElse: () => currentUserId,
              );

              final lastMessage = chatData['lastMessage'] ?? "No message";

              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(otherUserId)
                    .get(),
                builder: (context, userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox.shrink();
                  }
                  if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
                    print("User data not found for ID: $otherUserId");
                    return Container();
                  }

                  final userData = userSnapshot.data!;
                  final userName = userData['name'] ?? 'Unknown';

                  // Use a default icon if 'profileImage' field does not exist
                  final userDataMap = userData.data() as Map<String, dynamic>?;
                  final profileImage = userDataMap != null &&
                          userDataMap.containsKey('profileImage')
                      ? userDataMap['profileImage']
                      : null;

                  // Cast chatData.data() to Map<String, dynamic> and check for 'propertyId'
                  final chatDataMap = chatData.data() as Map<String, dynamic>?;
                  final propertyId = chatDataMap != null &&
                          chatDataMap.containsKey('propertyId')
                      ? chatDataMap['propertyId']
                      : null;

                  if (propertyId == null) {
                    // If propertyId is missing, display a basic chat tile without property details
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: profileImage != null
                            ? NetworkImage(profileImage)
                            : null,
                        child: profileImage == null ? Icon(Icons.person) : null,
                      ),
                      title: Text(userName),
                      subtitle: Text(lastMessage),
                      onTap: () {
                        Get.to(
                          ChatDetailsScreen(
                            chatId: chatId,
                            ownerId: otherUserId,
                            propertyDetails: {}, // Empty map since no property details
                          ),
                        );
                      },
                    );
                  }

                  // Fetch property details if propertyId exists
                  // Inside _buildChatsList() in ChatsScreen

                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('accommodations')
                        .doc(propertyId)
                        .get(),
                    builder: (context, propertySnapshot) {
                      if (!propertySnapshot.hasData ||
                          !propertySnapshot.data!.exists) {
                        return Container(); // Handle no property data
                      }

                      final propertyData = propertySnapshot.data!;
                      final propertyDetails = {
                        'propertyId':
                            propertyId, // Ensure propertyId is always included
                        'title': propertyData['title'] ?? 'No Name',
                        'address': propertyData['address'] ?? 'No Address',
                        'monthlyRent': propertyData['monthly_rent'] ?? 'N/A',
                        'imageUrl': propertyData['image_url'] ??
                            ImageConstant.imgEllipse22,
                      };

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: profileImage != null
                              ? NetworkImage(profileImage)
                              : null,
                          child:
                              profileImage == null ? Icon(Icons.person) : null,
                        ),
                        title: Text(userName),
                        subtitle: Text(lastMessage),
                        onTap: () {
                          Get.to(
                            ChatDetailsScreen(
                              chatId: chatId,
                              ownerId: otherUserId,
                              propertyDetails: propertyDetails,
                            ),
                          );
                        },
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

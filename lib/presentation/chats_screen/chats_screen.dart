import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/chat_details_screen/chat_details_screen.dart';
import 'package:uptm_secure_stay/services/encryption_helper.dart';
import 'package:intl/intl.dart';

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

          return ListView.separated(
            itemCount: chatDocuments.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey[300], // Line to split between chat items
              thickness: 1.0,
            ),
            itemBuilder: (context, index) {
              final chatData = chatDocuments[index];
              final chatId = chatData.id;
              final participants = List<String>.from(chatData['participants']);

              final otherUserId = participants.firstWhere(
                (id) => id != currentUserId || participants.length == 1,
                orElse: () => currentUserId,
              );

              final lastMessage = chatData['lastMessage'] ?? "No message";
              final lastMessageTimestamp = chatData['lastMessageTimestamp'];
              final formattedTime = lastMessageTimestamp != null
                  ? DateFormat('dd/MM/yyyy, hh:mm a')
                      .format((lastMessageTimestamp as Timestamp).toDate())
                  : "Unknown Time";

              // Safely check for `propertyId`
              final chatDataMap = chatData.data() as Map<String, dynamic>;
              final propertyId = chatDataMap.containsKey('propertyId')
                  ? chatDataMap['propertyId']
                  : null;

              // Adjust unreadCount logic
              final unreadCount = chatDataMap.containsKey('unreadCount') &&
                      chatDataMap['unreadCount'] is Map<String, dynamic> &&
                      (chatDataMap['unreadCount'] as Map<String, dynamic>)
                          .containsKey(currentUserId)
                  ? (chatDataMap['unreadCount']
                      as Map<String, dynamic>)[currentUserId]
                  : 0;

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
                  final encryptedName = userData['name'] ?? 'Unknown';
                  final userName = encryptedName != 'Unknown'
                      ? EncryptionHelper.decrypt(encryptedName)
                      : 'Unknown';

                  final userDataMap = userData.data()
                      as Map<String, dynamic>; // Ensure it's a map
                  final profileImage = userDataMap.containsKey('profileImage')
                      ? userDataMap['profileImage']
                      : null;

                  if (propertyId == null) {
                    // If propertyId is missing, display basic chat tile
                    return ListTile(
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: profileImage != null
                                ? NetworkImage(profileImage)
                                : null,
                            child: profileImage == null
                                ? Icon(Icons.person, color: Colors.white)
                                : null,
                          ),
                          if (unreadCount > 0)
                            Positioned(
                              right: 0,
                              top: 0,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.red,
                                child: Text(
                                  unreadCount.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      title: Text(userName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(lastMessage,
                              maxLines: 1, overflow: TextOverflow.ellipsis),
                          SizedBox(height: 4),
                          Text(
                            formattedTime,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      onTap: () {
                        // Mark messages as read
                        FirebaseFirestore.instance
                            .collection('chats')
                            .doc(chatId)
                            .update({'unreadCount.$currentUserId': 0});

                        Get.to(
                          ChatDetailsScreen(
                            chatId: chatId,
                            ownerId: otherUserId,
                            propertyDetails: {}, // Empty map for missing property
                          ),
                        );
                      },
                    );
                  }

                  // Fetch property details if propertyId exists
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
                        'propertyId': propertyId,
                        'title': propertyData['title'] ?? 'No Name',
                        'address': propertyData['address'] ?? 'No Address',
                        'monthlyRent': propertyData['monthly_rent'] ?? 'N/A',
                        'imageUrl': propertyData['image_urls'] != null &&
                                (propertyData['image_urls'] as List).isNotEmpty
                            ? propertyData['image_urls'][0]
                            : null, // First image if available
                      };

                      return ListTile(
                        leading: Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage: profileImage != null
                                  ? NetworkImage(profileImage)
                                  : null,
                              child: profileImage == null
                                  ? Icon(Icons.person, color: Colors.white)
                                  : null,
                            ),
                            if (unreadCount > 0)
                              Positioned(
                                right: 0,
                                top: 0,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    unreadCount.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        title: Text(userName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(lastMessage,
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            SizedBox(height: 4),
                            Text(
                              formattedTime,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        onTap: () {
                          // Mark messages as read
                          FirebaseFirestore.instance
                              .collection('chats')
                              .doc(chatId)
                              .update({'unreadCount.$currentUserId': 0});

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

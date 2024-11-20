import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/presentation/notifications_screen/models/notifications_model.dart';
import 'package:uptm_secure_stay/services/encryption_helper.dart';

/// A controller class for the NotificationsScreen.
class NotificationsController extends GetxController {
  Rx<NotificationsModel> notificationsModelObj = NotificationsModel().obs;
  RxList<Map<String, dynamic>> notificationsList = <Map<String, dynamic>>[].obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        String currentUserId = currentUser.uid;

        QuerySnapshot notificationsSnapshot = await _firestore
            .collection('notifications')
            .orderBy('timestamp', descending: true)
            .get();

        final filteredNotifications = await Future.wait(
          notificationsSnapshot.docs.map((doc) async {
            var data = doc.data() as Map<String, dynamic>;

            // Check if current user is either sender or receiver
            if (data['senderId'] == currentUserId ||
                data['receiverId'] == currentUserId) {
              // Extract encrypted part from the title and decrypt it
              if (data.containsKey('title')) {
                final title = data['title'] as String;
                final match =
                    RegExp(r'New Message from (.+)').firstMatch(title);

                if (match != null && _isBase64(match.group(1)!)) {
                  final decryptedPart =
                      EncryptionHelper.decrypt(match.group(1)!);
                  data['title'] = 'New Message from $decryptedPart';
                }
              }

              // Decrypt sender name
              if (data['senderId'] != null) {
                final senderDoc = await _firestore
                    .collection('users')
                    .doc(data['senderId'])
                    .get();
                if (senderDoc.exists && _isBase64(senderDoc['name'])) {
                  data['senderName'] =
                      EncryptionHelper.decrypt(senderDoc['name']);
                } else {
                  data['senderName'] = senderDoc['name'];
                }
              }

              // Decrypt receiver name
              if (data['receiverId'] != null) {
                final receiverDoc = await _firestore
                    .collection('users')
                    .doc(data['receiverId'])
                    .get();
                if (receiverDoc.exists && _isBase64(receiverDoc['name'])) {
                  data['receiverName'] =
                      EncryptionHelper.decrypt(receiverDoc['name']);
                } else {
                  data['receiverName'] = receiverDoc['name'];
                }
              }

              return data; // Update data in the list
            }
            return null;
          }).toList(),
        );

        // Only add decrypted results to notificationsList
        notificationsList.value = filteredNotifications
            .where((item) => item != null)
            .cast<Map<String, dynamic>>()
            .toList();

        // Debugging: print to ensure it holds decrypted values
        print('Notifications List: ${notificationsList.value}');
      }
    } catch (e) {
      print("Error fetching notifications: $e");
    }
  }

  /// Helper method to check if a string is Base64 encoded
  bool _isBase64(String input) {
    final base64Pattern = RegExp(r'^[A-Za-z0-9+/]+={0,2}$');
    return base64Pattern.hasMatch(input) && input.length % 4 == 0;
  }
}

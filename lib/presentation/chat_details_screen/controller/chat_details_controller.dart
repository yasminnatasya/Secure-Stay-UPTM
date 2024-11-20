import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:uptm_secure_stay/main.dart';
import 'package:uptm_secure_stay/presentation/chat_details_screen/models/chat_details_model.dart';
import 'package:uptm_secure_stay/services/encryption_helper.dart';

class ChatDetailsController extends GetxController {
  Rx<ChatDetailsModel> chatDetailsModelObj = ChatDetailsModel().obs;
  TextEditingController messageController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Configure EmailOTP at the start
  ChatDetailsController() {
    EmailOTP.config(
      appName: 'UPTM Secure Stay',
      otpType: OTPType.numeric,
      emailTheme: EmailTheme.v1,
    );

    // Configure SMTP details
    EmailOTP.setSMTP(
      host: 'mail.rohitchouhan.com',
      emailPort: EmailPort.port587,
      secureType: SecureType.tls,
      username: 'noreply@email-otp.rohitchouhan.com',
      password: 'vgk!cer8xku9BQN5nhk',
    );

    // Listen for notifications
    listenForNotifications();
  }

  Future<void> sendOtpToOwner(String ownerId, String chatId,
      {String otpPurpose = 'confirm'}) async {
    try {
      final ownerDoc = await _firestore.collection('users').doc(ownerId).get();
      if (!ownerDoc.exists) {
        Get.snackbar("Error", "Owner document not found");
        return;
      }

      // Decrypt the encrypted email before using it
      final encryptedEmail = ownerDoc['email'] ?? '';
      final ownerEmail = encryptedEmail.isNotEmpty
          ? EncryptionHelper.decrypt(encryptedEmail)
          : '';

      if (ownerEmail.isEmpty) {
        Get.snackbar("Error", "Owner email not found");
        return;
      }

      // Set email template based on otpPurpose
      if (otpPurpose == 'confirm') {
        EmailOTP.setTemplate(template: '''
        <div style="background-color: #f4f4f4; padding: 20px; font-family: Arial, sans-serif;">
          <div style="background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            <h1 style="color: #333;">{{appName}}</h1>
            <p style="color: #333;">Your OTP for booking confirmation is <strong>{{otp}}</strong></p>
            <p style="color: #333;">This OTP is valid for 1 hour.</p>
            <p style="color: #333;">Thank you for using UPTM Secure Stay.</p>
          </div>
        </div>
      ''');
      } else {
        EmailOTP.setTemplate(template: '''
        <div style="background-color: #f4f4f4; padding: 20px; font-family: Arial, sans-serif;">
          <div style="background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            <h1 style="color: #333;">{{appName}}</h1>
            <p style="color: #333;">Your OTP for booking cancellation is <strong>{{otp}}</strong></p>
            <p style="color: #333;">This OTP is valid for 1 hour.</p>
            <p style="color: #333;">Thank you for using UPTM Secure Stay.</p>
          </div>
        </div>
      ''');
      }

      // Send OTP
      bool isOtpSent = await EmailOTP.sendOTP(email: ownerEmail);

      // Save OTP metadata to Firestore
      final otpExpiration = DateTime.now().add(Duration(hours: 1));
      await _firestore.collection('chats').doc(chatId).update({
        'otpRequested': true,
        'otpExpiration': otpExpiration,
        'otpStatus': isOtpSent ? 'sent' : 'failed',
        'otpPurpose': otpPurpose,
      });

      Get.snackbar(isOtpSent ? 'Success' : 'Error',
          isOtpSent ? 'OTP sent successfully.' : 'Failed to send OTP');
    } catch (e) {
      print('Error sending OTP: $e');
      Get.snackbar('Error', 'Error sending OTP');
    }
  }

  Future<bool> verifyOtp(String enteredOtp, String chatId, String propertyId,
      {String otpPurpose = 'confirm'}) async {
    try {
      bool isOtpValid = await EmailOTP.verifyOTP(otp: enteredOtp);
      if (isOtpValid) {
        // Update OTP status in the chat document
        await _firestore.collection('chats').doc(chatId).update({
          'otpStatus': otpPurpose == 'confirm' ? 'success' : 'canceled',
        });

        // If OTP purpose is confirmation, update the accommodation document
        if (otpPurpose == 'confirm') {
          await _firestore.collection('accommodations').doc(propertyId).update({
            'confirmed': true,
            'confirmedBy': _auth.currentUser?.uid,
          });
        } else if (otpPurpose == 'cancel') {
          // If cancellation, mark confirmed as false and clear confirmedBy
          await _firestore.collection('accommodations').doc(propertyId).update({
            'confirmed': false,
            'confirmedBy': '',
          });
        }

        Get.snackbar(
            'Success',
            otpPurpose == 'confirm'
                ? 'Booking confirmed.'
                : 'Booking canceled.');
        return true;
      } else {
        Get.snackbar('Error', 'Invalid OTP. Try again.');
        return false;
      }
    } catch (e) {
      print('Error verifying OTP: $e');
      Get.snackbar('Error', 'Error verifying OTP');
      return false;
    }
  }

  Stream<DocumentSnapshot> chatStream(String chatId) {
    return _firestore.collection('chats').doc(chatId).snapshots();
  }

  void listenForNotifications() {
    final currentUserId = _auth.currentUser?.uid;
    if (currentUserId == null) return;

    _firestore
        .collection('notifications')
        .where('receiverId', isEqualTo: currentUserId)
        .snapshots()
        .listen((querySnapshot) {
      for (var docChange in querySnapshot.docChanges) {
        if (docChange.type == DocumentChangeType.added) {
          final notificationData = docChange.doc.data() as Map<String, dynamic>;

          // Decrypt the sender's name
          String senderName = notificationData['title'] ?? 'New Message';
          if (senderName.startsWith('New Message from')) {
            final encryptedName =
                senderName.replaceFirst('New Message from ', '');
            senderName =
                'New Message from ${EncryptionHelper.decrypt(encryptedName)}';
          }

          final body = notificationData['body'] ?? 'You have a new message';
          final timestamp =
              (notificationData['timestamp'] as Timestamp?)?.toDate();

          final timeElapsed =
              timestamp != null ? _formatTimeElapsed(timestamp) : 'Just now';

          // Check if the user is not on ChatDetailsScreen
          if (!Get.currentRoute.contains('ChatDetailsScreen')) {
            showNotification(senderName, '$body - $timeElapsed');
          }

          // Optionally mark notification as read
          _firestore.collection('notifications').doc(docChange.doc.id).update({
            'read': true,
          });
        }
      }
    });
  }

// Helper to format the elapsed time
  String _formatTimeElapsed(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'new_message_channel', // Channel ID
      'New Message Notifications', // Channel name
      channelDescription: 'Notification channel for new messages',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title, // Title of the notification
      body, // Body of the notification
      notificationDetails,
    );
  }

  Future<void> sendMessage(
      String chatId, String receiverId, String propertyId) async {
    if (messageController.text.isEmpty) return;

    final currentUserId = _auth.currentUser?.uid;
    if (currentUserId == null) return;

    try {
      final chatDocRef = _firestore.collection('chats').doc(chatId);
      final messageText = messageController.text;

      // Fetch sender's information
      final currentUserDoc =
          await _firestore.collection('users').doc(currentUserId).get();
      final senderName = currentUserDoc.data()?['name'] ?? 'Unknown';

      // Initialize unreadCount map if it doesn't exist
      final chatSnapshot = await chatDocRef.get();
      Map<String, dynamic> unreadCountMap = {};
      if (chatSnapshot.exists) {
        unreadCountMap =
            chatSnapshot.data()?['unreadCount'] as Map<String, dynamic>? ?? {};
      }
      if (!unreadCountMap.containsKey(receiverId)) {
        unreadCountMap[receiverId] = 0;
      }

      // Increment unreadCount for the receiver
      unreadCountMap[receiverId] += 1;

      // Update the chat document
      await chatDocRef.set({
        'participants': [currentUserId, receiverId],
        'propertyId': propertyId,
        'lastMessage': messageText,
        'lastMessageTimestamp': FieldValue.serverTimestamp(),
        'unreadCount': unreadCountMap, // Update the unreadCount map
      }, SetOptions(merge: true));

      // Add the message to the sub-collection
      await chatDocRef.collection('messages').add({
        'text': messageText,
        'senderId': currentUserId,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Add a notification document for the receiver
      await _firestore.collection('notifications').add({
        'title': 'New Message from $senderName',
        'body': messageText,
        'receiverId': receiverId,
        'timestamp': FieldValue.serverTimestamp(),
        'senderId': currentUserId,
        'read': false, // Set read to false
      });

      // Clear the input field
      messageController.clear();
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }
}

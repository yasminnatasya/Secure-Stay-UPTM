import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/main.dart';
import 'package:uptm_secure_stay/services/encryption_helper.dart';

/// A controller class for the HomeScreenPage.
///
/// This class manages the state of the HomeScreenPage, including the
/// current homeScreenModelObj
class HomeScreenController extends GetxController {
  TextEditingController searchController = TextEditingController();
  TextEditingController searchRentController = TextEditingController();

  Rx<bool> bed = false.obs;
  Rx<bool> bath = false.obs;
  Rx<bool> bed1 = false.obs;
  Rx<bool> bath1 = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    listenForNotifications(); // Start listening for notifications on init
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

          // Decrypt sender's name
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

          // Show notification
          showNotification(senderName, '$body - $timeElapsed');

          // Mark notification as read
          _firestore
              .collection('notifications')
              .doc(docChange.doc.id)
              .update({'read': true});
        }
      }
    });
  }

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
}

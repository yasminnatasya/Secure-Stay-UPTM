import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'encryption_helper.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseFirestore get firestore => _firestore;

  Future<void> addUserDataToFirestore({
    required User user,
    required String fullName,
    required String email,
    required String studentId,
    required String userId,
  }) async {
    try {
      // Encrypt sensitive fields
      final encryptedFullName = EncryptionHelper.encrypt(fullName);
      final encryptedEmail = EncryptionHelper.encrypt(email);
      final encryptedStudentId = EncryptionHelper.encrypt(studentId);

      // Log encrypted data to ensure encryption is working
      print('Encrypted Full Name: $encryptedFullName');
      print('Encrypted Email: $encryptedEmail');
      print('Encrypted Student ID: $encryptedStudentId');

      await _firestore.collection('users').doc(user.uid).set({
        'name': encryptedFullName,
        'email': encryptedEmail,
        'student_id': encryptedStudentId,
        'is_verified': false,
        'user_id': userId,
        'created_at': Timestamp.now(),
        'otp_expiration':
            Timestamp.fromDate(DateTime.now().add(Duration(minutes: 10))),
      });

      print('User data stored successfully in Firestore.');
    } catch (e) {
      print('Firestore Error: ${e.runtimeType} - ${e.toString()}');
      Get.snackbar('Error', 'Failed to add user data to Firestore');
    }
  }

  // Decryption example after retrieving data
  Future<Map<String, dynamic>> getUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();

      if (doc.exists) {
        final data = doc.data()!;
        return {
          'name': EncryptionHelper.decrypt(data['name']),
          'email': EncryptionHelper.decrypt(data['email']),
          'student_id': EncryptionHelper.decrypt(data['student_id']),
          'is_verified': data['is_verified'],
          'user_id': data['user_id'],
          'created_at': data['created_at'],
          'otp_expiration': data['otp_expiration'],
        };
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      print('Error decrypting data: ${e.toString()}');
      throw Exception('Failed to retrieve user data');
    }
  }
}

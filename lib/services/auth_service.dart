import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to create user in Firebase Auth
  Future<User?> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String fullName}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Get the created user
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(fullName);
        print('User created in Firebase Auth with UID: ${user.uid}');
        return user; // Return the user to pass it to the next step
      } else {
        Get.snackbar('Error', 'Failed to create user in Firebase Auth');
        return null;
      }
    } catch (e) {
      print(
          'Auth Error: ${e.runtimeType} - ${e.toString()}'); // More detailed logging
      Get.snackbar('Error', 'Auth Error: ${e.runtimeType} - ${e.toString()}');
      return null;
    }
  }
}

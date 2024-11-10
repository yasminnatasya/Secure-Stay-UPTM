import 'package:encrypt/encrypt.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EncryptionHelper {
  static final String? encryptionKey = dotenv.env['ENCRYPTION_KEY'];

  // Ensure the key is the correct length for AES
  static final Key _key =
      Key.fromUtf8(encryptionKey!.padRight(16).substring(0, 16));
  static final IV _iv = IV.fromLength(16);

  static void printKeyAndIV() {
    print('Encryption Key: ${_key.base16}');
    print('IV: ${_iv.base16}');
  }

  static String encrypt(String plainText) {
    if (encryptionKey == null || encryptionKey!.length < 16) {
      print('Error: Invalid encryption key.');
      return plainText;
    }

    final encrypter = Encrypter(AES(_key, mode: AESMode.cbc, padding: 'PKCS7'));
    final encrypted = encrypter.encrypt(plainText, iv: _iv);
    print('Encrypted Text (Base64): ${encrypted.base64}');
    return encrypted.base64;
  }

  static String decrypt(String encryptedText) {
    if (encryptionKey == null || encryptionKey!.length < 16) {
      print('Error: Invalid encryption key.');
      return encryptedText;
    }

    final encrypter = Encrypter(AES(_key, mode: AESMode.cbc, padding: 'PKCS7'));
    try {
      final decrypted = encrypter.decrypt64(encryptedText, iv: _iv);
      print('Decrypted Text: $decrypted');
      return decrypted;
    } catch (e) {
      print('Decryption Error: $e');
      return 'Error decrypting data';
    }
  }
}

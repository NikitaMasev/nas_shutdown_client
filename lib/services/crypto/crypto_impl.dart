import 'package:encrypt/encrypt.dart';
import 'package:nas_shutdown_client/services/crypto/crypto.dart';

class CryptoImpl implements Crypto {
  factory CryptoImpl({
    required final String key,
    required final String iv,
    final AESMode aesMode = AESMode.cbc,
  }) {
    final keyAes = Key.fromUtf8(key);
    final ivAes = IV.fromUtf8(iv);
    final encrypter = Encrypter(AES(keyAes, mode: aesMode));
    return CryptoImpl._(ivAes, encrypter);
  }

  const CryptoImpl._(this._iv, this._encrypter);

  final IV _iv;
  final Encrypter _encrypter;

  @override
  String decrypt(final String encryptedData) {
    var decrypted = '';
    try {
      final base64 = Encrypted.fromBase64(encryptedData);
      decrypted = _encrypter
          .decrypt(
            base64,
            iv: _iv,
          )
          .trim();
    } catch (e) {
      print(e.toString());
      return decrypted;
    }
    return decrypted;
  }

  @override
  String encrypt(final String rawData) =>
      _encrypter.encrypt(rawData, iv: _iv).base64;
}

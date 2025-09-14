import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions getAndroidOptions() =>
    const AndroidOptions(encryptedSharedPreferences: true);
IOSOptions getIOSOptions() => const IOSOptions(
  accessibility: KeychainAccessibility.first_unlock_this_device,
);
final secureStorage = FlutterSecureStorage(
  aOptions: getAndroidOptions(),
  iOptions: getIOSOptions(),
);

import 'package:gamr/interfaces/interfaces.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage implements ISecureStorage {
  FlutterSecureStorage prefs;
  SecureStorage(this.prefs);

  @override
  Future<String> read(String path) async {
    return await prefs.read(key: path) ?? '';
  }

  @override
  Future<void> write({required String path, required String value}) async {
    return prefs.write(key: path, value: value);
  }

  @override
  Future<void> delete(String path) async {
    await prefs.delete(key: path);
  }

  @override
  Future<void> deleteAll() async {
    prefs.deleteAll();
  }

  @override
  Future<Map<String, String>> readAll() async {
    return await prefs.readAll();
  }
}

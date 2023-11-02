abstract class ISecureStorage {
  // get data from device secure storage
  Future<String> read(String path);

  // write data to device secoure storage
  Future<void> write({required String path, required String value});

  // get all data from device secure storage
  Future<Map<String, String>> readAll();

  // delete data from device secure storage
  Future<void> delete(String path);

  // delete all data from device secure storage
  Future<void> deleteAll();
}

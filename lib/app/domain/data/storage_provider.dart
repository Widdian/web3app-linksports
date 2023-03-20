abstract class StorageProvider {
  Future<void> store(int value);
  Future<int> retrieve();
}

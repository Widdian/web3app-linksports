import '../domain.dart';

class StoreIntUseCase {
  final StorageProvider storageProvider;

  StoreIntUseCase(this.storageProvider);

  Future<void> storeInt(int value) {
    if (value < 0) throw NonPositiveValueException();
    return storageProvider.store(value);
  }
}

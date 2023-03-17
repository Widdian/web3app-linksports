import 'package:web3app_linksports/app/domain/data/storage_provider.dart';
import 'package:web3app_linksports/app/domain/exceptions/custom_exceptions.dart';

class StoreIntUseCase {
  final StorageProvider storageProvider;

  StoreIntUseCase(this.storageProvider);

  Future<void> storeInt(int value) {
    if (value < 0) throw NonPositiveValueException();
    return storageProvider.store(value);
  }
}

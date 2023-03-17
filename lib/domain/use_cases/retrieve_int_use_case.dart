import 'package:web3app_linksports/domain/data/storage_provider.dart';

class RetrieveIntUseCase {
  final StorageProvider storageProvider;

  RetrieveIntUseCase(this.storageProvider);

  Future<int> retrieveInt() {
    return storageProvider.retrieve();
  }
}

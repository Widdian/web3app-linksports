import '../domain.dart';

class RetrieveIntUseCase {
  final StorageProvider storageProvider;

  RetrieveIntUseCase(this.storageProvider);

  Future<int> retrieveInt() {
    return storageProvider.retrieve();
  }
}

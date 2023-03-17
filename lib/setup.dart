import 'package:get_it/get_it.dart';
import 'package:web3app_linksports/domain/use_cases/retrieve_int_use_case.dart';
import 'package:web3app_linksports/domain/use_cases/store_int_use_case.dart';

import 'constants.dart';
import 'data/storage_provider_impl.dart';
import 'domain/data/storage_provider.dart';

Future<void> setup() async {
  final instance = StorageProviderImpl(privateKey);
  await instance.setup(
    rpcUrl,
    wsUrl,
  );
  GetIt.I.registerSingleton<StorageProvider>(
    instance,
  );
  GetIt.I.registerLazySingleton<RetrieveIntUseCase>(
      () => RetrieveIntUseCase(GetIt.I.get<StorageProvider>()));
  GetIt.I.registerLazySingleton<StoreIntUseCase>(
      () => StoreIntUseCase(GetIt.I.get<StorageProvider>()));
}

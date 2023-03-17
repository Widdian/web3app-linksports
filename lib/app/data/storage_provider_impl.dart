import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3app_linksports/app/domain/data/storage_provider.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class StorageProviderImpl implements StorageProvider {
  late Web3Client _client;
  late EthereumAddress _contractAddress;
  late String _abiCode;
  final EthPrivateKey _credentials;

  Future<void> setup(String rpcUrl, String wsUrl) async {
    _client = Web3Client(rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(wsUrl).cast<String>();
    });

    await _setupAbi();
  }

  StorageProviderImpl(String privateKey)
      : _credentials = EthPrivateKey.fromHex(privateKey);

  Future<void> _setupAbi() async {
    String abiStringFile = await rootBundle.loadString(
      "smartcontracts/build/contracts/Storage.json",
    );
    final jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);

    _contractAddress = EthereumAddress.fromHex(
      jsonAbi["networks"]["5777"]["address"],
    );
  }

  DeployedContract get _contract => DeployedContract(
        ContractAbi.fromJson(_abiCode, "Storage"),
        _contractAddress,
      );

  @override
  Future<int> retrieve() async {
    final retrieve = _contract.function("retrieve");
    final value = await _client.call(
      contract: _contract,
      function: retrieve,
      params: [],
    );
    final result = value[0] as BigInt;
    return result.toInt();
  }

  @override
  Future<void> store(int value) async {
    final bigIntValue = BigInt.from(value);
    final store = _contract.function("store");
    await _client.sendTransaction(
        _credentials,
        chainId: 1337,
        Transaction.callContract(
          contract: _contract,
          function: store,
          parameters: [bigIntValue],
        ));
  }
}

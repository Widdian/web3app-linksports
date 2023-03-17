import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3app_linksports/app/data/model/value.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

class StoreService extends ChangeNotifier {
  ValueModel valueModel = ValueModel();

  final String _rpcUrl = '';
  final String _wsUrl = '';

  final String _privateKey = '';

  late Web3Client _web3client;
  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  late EthPrivateKey _creds;
  late DeployedContract _deployedContract;
  late ContractFunction _insertValue;
  late ContractFunction _getValue;

  StoreService() {
    init();
  }

  Future<void> init() async {
    _web3client = Web3Client(_rpcUrl, http.Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
    await getABI();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getABI() async {
    String abiFile = await rootBundle.loadString('');
    var jsonABI = jsonDecode(abiFile);
    _abiCode = ContractAbi.fromJson(jsonDecode(jsonABI['abi']), '');
    _contractAddress = EthereumAddress.fromHex(jsonABI['networks']['']);
  }

  Future<void> getCredentials() async {
    _creds = EthPrivateKey.fromHex(_privateKey);
  }

  Future<void> getDeployedContract() async {
    _deployedContract = DeployedContract(_abiCode, _contractAddress);
    _insertValue = _deployedContract.function('INSERT');
    _getValue = _deployedContract.function('GET');
  }

  Future<void> getValue() async {
    var temp = await _web3client
        .call(contract: _deployedContract, function: _getValue, params: []);

    valueModel = ValueModel(value: (temp[0] as BigInt).toInt());

    notifyListeners();
  }

  Future<void> storeValue(int value) async {
    await _web3client.sendTransaction(
      _creds,
      Transaction.callContract(
        contract: _deployedContract,
        function: _insertValue,
        parameters: [value],
      ),
    );

    notifyListeners();
    getValue();
  }
}

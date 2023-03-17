import 'package:flutter/material.dart';
import 'package:web3app_linksports/setup.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const Web3App());
}

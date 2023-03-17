import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3app_linksports/app/domain/service/store_service.dart';

import 'presentation/presentation.dart';

class Web3App extends StatelessWidget {
  const Web3App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoreService(),
      child: MaterialApp(
        title: 'Web3 App',
        darkTheme: ThemeData.dark(),
        home: const MyHomePage(title: 'Web3 App'),
      ),
    );
  }
}

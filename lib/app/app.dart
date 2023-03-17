import 'package:flutter/material.dart';

import 'presentation/presentation.dart';

class Web3App extends StatelessWidget {
  const Web3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web3 App',
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Web3 App'),
    );
  }
}

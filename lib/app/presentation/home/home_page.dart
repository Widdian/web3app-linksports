import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3app_linksports/app/domain/service/store_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var storeService = context.watch<StoreService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The current number stored is:',
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          storeService.storeValue(0);
        },
        tooltip: 'Edit value',
        child: const Icon(Icons.edit),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:web3app_linksports/app/domain/use_cases/retrieve_int_use_case.dart';
import 'package:web3app_linksports/app/domain/use_cases/store_int_use_case.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _retrievedValue = 0;

  @override
  Widget build(BuildContext context) {
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
              _retrievedValue.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: () async {
                final value =
                    await GetIt.I.get<RetrieveIntUseCase>().retrieveInt();
                setState(() {
                  _retrievedValue = value;
                });
              },
              child: const Text('Retrieve Number'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                onChanged: (value) {
                  GetIt.I.get<StoreIntUseCase>().storeInt(int.parse(value));
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

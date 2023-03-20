import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/domain.dart';

class InsertValueDialog {
  Future<void> show(BuildContext context) async {
    final formKey = GlobalKey<FormState>();

    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Enter the number you would like to store',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        GetIt.I
                            .get<StoreIntUseCase>()
                            .storeInt(int.parse(value!))
                            .then(
                              (value) => Navigator.pop(context),
                            );
                      },
                      validator: (value) => value!.isEmpty
                          ? 'Empty field'
                          : int.parse(value) < 0
                              ? 'The number must be non-negative'
                              : null,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                      ),
                    ),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                          }
                        },
                        style: const ButtonStyle(
                          shape: MaterialStatePropertyAll<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.orange),
                        ),
                        child: const Text('Confirm'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/entrust.dart';

class TransfersPage extends StatelessWidget {
  static const String routeName = '/home';

  const TransfersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('transfers'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('transfer page'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () async => {
                await EntrustService.getOTP(),
              },
              child: const Text('Generar otp'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => context.push('/home'),
              child: const Text('back to home'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => context.push('/beneficiaries'),
              child: const Text('go beneficiaries'),
            ),
          ),
        ],
      ),
    );
  }
}

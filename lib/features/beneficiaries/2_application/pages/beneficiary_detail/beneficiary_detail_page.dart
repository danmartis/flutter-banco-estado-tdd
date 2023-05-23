// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BeneficiaryDetailPage extends StatelessWidget {
  final String id;

  const BeneficiaryDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FirebaseCrashlytics.instance.crash();

    return Scaffold(
      appBar: AppBar(
        title: Text('Beneficiario $id'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Beneficiario $id'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => context.push('/home'),
              child: const Text('Go To home'),
            ),
          ),
        ],
      ),
    );
  }
}

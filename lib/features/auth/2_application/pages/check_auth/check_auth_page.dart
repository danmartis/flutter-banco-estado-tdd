import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../../configs/entrust.dart';
import '../../../../../services/entrust.dart';

class CheckAuthPage extends HookWidget {
  const CheckAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 1000), () async {
        String? token = await FirebaseMessaging.instance.getToken();

        await EntrustService.getInstance(token!);

        // await EntrustService.insertSeed(
        //     'https://bancoestado.us.trustedauth.com/api/mobile/redirect?action=activate&regurl=bancoestado.us.trustedauth.com%2Fapi%2Fmobile&serialnum=77886-59063&regpwd=fc3b8331e33c20fc815d506f0cb44fd3');

        final resultTrx = await EntrustService.getTransactions();
        print(resultTrx);

        if (resultTrx != null) {
          await EntrustService.setResponseTransaction(
              resultTrx, EntrustTransactions.cancel);
        }

        await FirebaseAnalytics.instance.setUserId(id: '123456');
        await FirebaseAnalytics.instance
            .setUserProperty(name: 'personName', value: 'Andro Ostoic ');

        FirebaseCrashlytics.instance.setUserIdentifier("123456");
        // Set a key to a string.
        FirebaseCrashlytics.instance.setCustomKey('str_key', 'hello');

// Set a key to a boolean.
        FirebaseCrashlytics.instance.setCustomKey("bool_key", true);

// Set a key to an int.
        FirebaseCrashlytics.instance.setCustomKey("int_key", 1);

// Set a key to a long.
        FirebaseCrashlytics.instance.setCustomKey("int_key", 1);

// Set a key to a float.
        FirebaseCrashlytics.instance.setCustomKey("float_key", 1.0);

// Set a key to a double.
        FirebaseCrashlytics.instance.setCustomKey("double_key", 1.0);

        context.pushReplacement('/auth/login');
      });

      return null;
    }, []);

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

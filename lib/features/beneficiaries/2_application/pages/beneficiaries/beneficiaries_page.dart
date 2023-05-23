import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../../injection.dart' as di;
import '../../core/blocs/beneficiaries_bloc/beneficiaries_bloc.dart';

class BeneficiariesPage extends StatelessWidget {
  const BeneficiariesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<BeneficiariesBloc>(),
      child: const BeneficiariesPageContainer(),
    );
  }
}

class BeneficiariesPageContainer extends HookWidget {
  const BeneficiariesPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beneficiariesBloc = BlocProvider.of<BeneficiariesBloc>(
      context,
      listen: true,
    );
    print(beneficiariesBloc.state);

    useEffect(() {
      beneficiariesBloc.add(GetBeneficiariesEvent());

      return null;
    }, []);

    String? trxId;
    String? otp;
    bool? confirm;

    // FirebaseAnalytics.instance.logEvent(
    //   name: 'screen_view',
    //   parameters: {
    //     'firebase_screen': "asd",
    //     'firebase_screen_class': "screenClass",
    //   },
    // );

    return Scaffold(
      appBar: AppBar(),
      body: beneficiariesBloc.state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: beneficiariesBloc.state.items.length,
              itemBuilder: (_, index) {
                final beneficiary = beneficiariesBloc.state.items[index];

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(beneficiary.name),
                      Text(beneficiary.email),
                      Text(beneficiary.rut.toString()),
                      Text(beneficiary.dv),
                      Text(beneficiary.account),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () => context
                              .push('/beneficiaries/detail/${beneficiary.rut}'),
                          child: const Text('Go detail beneficiares'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );

    // return Scaffold(
    //   appBar: AppBar(),
    //   body: Center(
    //     child: ElevatedButton(
    //       onPressed: () async => {
    //         trxId = await EntrustService.getTransactions(),
    //         print(trxId),
    //         otp = await EntrustService.getOTP(),
    //         if (trxId != '')
    //           {
    //             confirm = await EntrustService.setResponseTransaction(
    //               trxId!,
    //               'CONFIRM',
    //             ),
    //           },
    //         context.push('/beneficiaries/detail/1')
    //       },
    //       child: const Text('Go To Detail'),
    //     ),
    //   ),
    // );
  }
}

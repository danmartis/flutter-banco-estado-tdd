import 'package:animate_do/animate_do.dart';
import 'package:empresas/features/auth_tef/2_application/pages/shared/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/string_util.dart';
import '../../../balances/2_application/widgets/appbar_customized.dart';
import '../../1_domain/entities/account.dart';
import '../../1_domain/entities/account_state.dart';
import '../cubits/auth_tef/auth_tef_cubit.dart';
import '../widgets/origin_account_card.dart';
import '../widgets/shared/alert_card.dart';
import '../widgets/skeletons/account_states_skeleton.dart';

class SelectOriginAccountPage extends StatelessWidget {
  const SelectOriginAccountPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthTefCubit(),
      child: const _BalancesPage(),
    );
  }
}

class _BalancesPage extends StatelessWidget {
  const _BalancesPage();

  @override
  Widget build(BuildContext context) {
   
    context.read<AuthTefCubit>().getPhaseOneData();

    return Scaffold(
      appBar: AppBarCustomized(
        title: 'Saldo consolidado',
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<AuthTefCubit, AuthTefState>(
          builder: (context, authTefState) {
        if (!authTefState.isLoading &&
            !authTefState.hasPhaseOneError &&
            authTefState.phaseOne.accountStates.isEmpty) {
          return FadeIn(
            child: const ErrorPageContent(
              titleError: 'No tiene transferencias sin autorización',
              subtitleError:
                  'Según nuestros registros no tiene transferencias sin autorización',
            ),
          );
        }
        return showResult(context, authTefState);
      }),
    );
  }
}

  Widget showResult(BuildContext context, AuthTefState authTefState) {
    if (authTefState.isLoading) {
      return const AccountStatesSkeleton();
    }
    if (authTefState.hasPhaseOneError) {
      // TODO: Retornar widget de error por defecto que está por definir
      return Column(
        children: [
          const Text('Error inesperado'),
          TextButton(
              onPressed: () {
                context.read<AuthTefCubit>().getPhaseOneData();
              },
              child: const Text('Reintentar'))
        ],
      );
    }

    return FadeIn(
      child: OriginAccountsSelection(
        accounts: authTefState.phaseOne.accounts,
        accountStates: authTefState.phaseOne.accountStates,
        maxTefAmountPerDay: authTefState.phaseOne.maxTefAmountPerDay
      )
    );
  }


class OriginAccountsSelection extends StatelessWidget {
  final List<Account> accounts;
  final List<AccountState> accountStates;
  final int maxTefAmountPerDay;

  const OriginAccountsSelection({
    super.key,
    required this.accounts,
    required this.accountStates,
    required this.maxTefAmountPerDay
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...accounts.map((account) => 
            OriginAccountCardWidget(account: account)),
        const SizedBox(
          height: 32,
        ),
        AlertCard(
          mainText:
              'El límite de monto máximo diario para transferencias a terceros es ',
          alertCardType: AlertCardType.info,
          childrenText: [
            TextSpan(
                text: '\$${formatPriceCLP(maxTefAmountPerDay)}',
                style: const TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}


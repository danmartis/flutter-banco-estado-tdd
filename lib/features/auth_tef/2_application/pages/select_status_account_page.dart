import 'package:animate_do/animate_do.dart';
import 'package:empresas/core/util/string_util.dart';
import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';
import 'package:empresas/features/auth_tef/2_application/cubits/auth_tef/auth_tef_cubit.dart';
import 'package:empresas/features/auth_tef/2_application/widgets/shared/alert_card.dart';
import 'package:empresas/features/auth_tef/2_application/widgets/shared/custom_app_bar.dart';
import 'package:empresas/features/auth_tef/2_application/widgets/shared/custom_card_button.dart';
import 'package:empresas/features/auth_tef/2_application/widgets/skeletons/account_states_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectStatusAccountPage extends StatelessWidget {
  const SelectStatusAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SelectStatusAccountView();
  }
}

class _SelectStatusAccountView extends StatelessWidget {
  const _SelectStatusAccountView();

  @override
  Widget build(BuildContext context) {
    context.read<AuthTefCubit>().getPhaseOneData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Autorizar transferencias'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const _ImageTef(),
              const SizedBox(
                height: 24,
              ),
              const Text(
                '¿Qué transferencias autorizará?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Seleccione una opción para filtrar las transferencias pendientes de autorización',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 48,
              ),
              BlocBuilder<AuthTefCubit, AuthTefState>(
                builder: (context, authTefState) {
                  return showResult(context, authTefState);
                },
              )
            ],
          ),
        ),
      ),
    );
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
            onPressed: () => context.read<AuthTefCubit>().getPhaseOneData(),
            child: const Text('Reintentar')
          )
        ],
      );
    }

    return FadeIn(
      child: AccountStateButtons(
        accountStates: authTefState.phaseOne.accountStates,
        maxTefAmountPerDay: authTefState.phaseOne.maxTefAmountPerDay
      )
    );
  }
}

class AccountStateButtons extends StatelessWidget {
  final List<AccountState> accountStates;
  final int maxTefAmountPerDay;

  const AccountStateButtons(
      {super.key,
      required this.accountStates,
      required this.maxTefAmountPerDay});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...accountStates.map((accountState) => CustomCardButton(
              cardTitle: accountState.description,
              onTap: () {},
            )),
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

class _ImageTef extends StatelessWidget {
  const _ImageTef();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 82,
          child: Center(
              child: SvgPicture.asset(
            'assets/images/auth_tef/circle_tef_img.svg',
            width: 82,
            height: 82,
          )),
        ),
        SizedBox(
          height: 82,
          child: Center(
              child: SvgPicture.asset(
            'assets/images/auth_tef/icon_tef_img.svg',
            width: 56,
            height: 56,
          )),
        )
      ],
    );
  }
}

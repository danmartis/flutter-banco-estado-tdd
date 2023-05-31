import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/toggle_balances_cubit/toggle_balances_cubit.dart';

class BalancesSummaryCard extends StatelessWidget {
  const BalancesSummaryCard({super.key});

  final double borderRadius = 10.0;
  final double leftColorWidth = 5.0;
  final String hiddenTextString = "*****";

  @override
  Widget build(BuildContext context) {
    const consolidatedBalances = "\$605.234.789";
    const availableBalance = "\$100.000.000";
    const creditLine = "\$23.456.789";

    return InkWell(
      onTap: () => context.push('/balances'),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius - 5),
        ),
        child: Row(
          children: [
            _leftColor(Colors.blue),
            const SizedBox(width: 10),
            BlocBuilder<ToggleBalancesCubit, ToggleBalancesState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    _numberOfAccountsText("15 Cuentas Corrientes"),
                    const SizedBox(height: 5),
                    const Text("Saldo consolidado"),
                    Row(
                      children: [
                        _consolidatedBalanceNumber(
                          state.showBalances
                              ? consolidatedBalances
                              : hiddenTextString,
                        ),
                        _toggleBalanceButton(context, state.showBalances)
                      ],
                    ),
                    Text(
                      "Saldo disponible ${state.showBalances ? availableBalance : hiddenTextString}",
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Línea de crédito ${state.showBalances ? creditLine : hiddenTextString}",
                    ),
                    const SizedBox(height: 15),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _leftColor(Color color) {
    return Container(
      height: double.infinity,
      width: leftColorWidth,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
        ),
      ),
    );
  }

  Widget _numberOfAccountsText(String text) {
    return Text(text, style: const TextStyle(fontWeight: FontWeight.bold));
  }

  Widget _consolidatedBalanceNumber(String number) {
    return Text(
      number,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _toggleBalanceButton(BuildContext context, bool showBalances) {
    return IconButton(
      onPressed: () => context.read<ToggleBalancesCubit>().toggle(),
      icon: Icon(
        showBalances
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
      ),
    );
  }
}

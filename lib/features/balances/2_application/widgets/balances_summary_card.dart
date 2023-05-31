import 'package:flutter/material.dart';

import '../../1_domain/entities/account_entitie.dart';
import '../../1_domain/entities/bank_account_entitie.dart';
import '../core/money_handler.dart';

class BalancesSummaryCardWidget extends StatelessWidget {
  const BalancesSummaryCardWidget({
    required this.bankAccount,
    required this.account,
    this.onTap,
    this.leftColor,
    super.key,
  });

  final Function()? onTap;
  final Color? leftColor;
  final BankAccount bankAccount;
  final Account account;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SizedBox(
          // height: 127,
          height: 135,
          child: Row(
            children: [
              LeftColorWidget(color: leftColor),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    bankAccount.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    account.id,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    MoneyHandler('${bankAccount.consolidatedBalances}')
                        .formatted,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Saldo disponible ${MoneyHandler('${bankAccount.availableBalance}').formatted}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeftColorWidget extends StatelessWidget {
  final Color? color;

  const LeftColorWidget({this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return color != null
        ? Container(
            height: double.infinity,
            width: 5.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

import 'package:flutter/material.dart';

import '../../1_domain/entities/bank_account_entitie.dart';
import 'balances_summary_card.dart';

class BackgroundContainerWidget extends StatelessWidget {
  final double height;
  final Color? color;
  final BankAccount? bankAccount;
  const BackgroundContainerWidget({
    required this.bankAccount,
    required this.height,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Text(
              bankAccount?.name ?? '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bankAccount?.accounts.length,
              itemBuilder: (BuildContext context, int index) =>
                  BalancesSummaryCardWidget(
                leftColor: const Color(0xFFFF9100),
                bankAccount: bankAccount!,
                account: bankAccount!.accounts[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

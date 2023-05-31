import 'package:flutter/material.dart';

import '../../0_data/models/bank_account_model.dart';
import '../widgets/appbar_customized.dart';
import '../widgets/background_container.dart';
import '../widgets/bank_account_card.dart';

class BalancesPage extends StatelessWidget {
  const BalancesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
      body: Column(
        children: [
          BankAccountCardWidget(
            bankAccount: bankAccountModel,
          ),
          Expanded(
            flex: 3,
            child: BackgroundContainerWidget(
              height: size.height * 0.65,
              bankAccount: bankAccountModel,
            ),
          ),
        ],
      ),
    );
  }
}

final BankAccountModel bankAccountModel = bankAccountFromJson("""
{
    "accounts": [
        {
            "id": "876628221232",
            "consolidatedBalances": 605234789,
            "creditLine": 100000000
        },
      {
            "id": "976628221232",
            "consolidatedBalances": 605234789,
            "creditLine": 100000000
        },
      {
            "id": "176628221232",
            "consolidatedBalances": 605234789,
            "creditLine": 100000000
        }
    ],
    "consolidatedBalances": 605234789,
    "availableBalance": 1000,
    "creditLine": 23456789,
    "name": "Chequeras Electrónicas"
}  """);

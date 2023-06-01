import 'package:flutter/material.dart';


import '../../../auth_tef/0_data/models/phase_one_model.dart';
import '../../../auth_tef/1_domain/entities/account.dart';

class AccountSummaryCardWidget extends StatelessWidget {
  const AccountSummaryCardWidget({
    required this.pasheOneData,
    required this.account,
    this.onTap,
    this.leftColor,
    super.key,
  });

  final Function()? onTap;
  final Color? leftColor;
  final PhaseOneModel pasheOneData;
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
                    account.description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    account.description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    account.accountNumber,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                 const  Text(
                    'Saldo disponible',
                    style:  TextStyle(
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

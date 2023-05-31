import 'package:flutter/material.dart';

import 'balances_summary_card.dart';

class BalancesSummaryList extends StatelessWidget {
  const BalancesSummaryList({super.key, required this.padding});

  final double padding;
  final hMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    final portFraction = (fullWidth - 2 * padding + 2 * hMargin) / fullWidth;

    final PageController pageController = PageController(
      initialPage: 0,
      viewportFraction: portFraction,
    );

    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: pageController,
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: hMargin),
          child: const BalancesSummaryCard(),
        ),
      ),
    );
  }
}

import 'package:empresas/features/balances/2_application/pages/balances_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BalancesFeature {
  static GoRoute router = GoRoute(
    path: '/balances',
    builder: (BuildContext context, GoRouterState state) {
      return const BalancesPage();
    },
  );
}

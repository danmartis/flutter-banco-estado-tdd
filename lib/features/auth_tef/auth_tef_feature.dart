import 'package:empresas/features/auth_tef/2_application/pages/select_status_account_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class AuthTefFeature {
  static GoRoute router = GoRoute(
    path: '/select_status_account',
    builder: (BuildContext context, GoRouterState state) {
      return const SelectStatusAccountPage();
    },
    routes: [],
  );
}

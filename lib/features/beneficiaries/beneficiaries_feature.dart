import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '2_application/pages/pages.dart';

class BeneficiariesFeature {
  static GoRoute router = GoRoute(
    path: '/beneficiaries',
    builder: (BuildContext context, GoRouterState state) {
      return const BeneficiariesPage();
    },
    routes: [
      GoRoute(
        path: 'detail/:id',
        builder: (context, state) =>
            BeneficiaryDetailPage(id: state.pathParameters['id']!),
      ),
    ],
  );
}

import 'package:empresas/features/auth_tef/2_application/pages/shared/error_page.dart';
import 'package:empresas/features/balances/2_application/balances_feature.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/features.dart';

class ApplicationRouter {
  final FirebaseAnalytics analytics;

  ApplicationRouter({
    required this.analytics,
  });

  GoRouter getApplicationRouter() {
    return GoRouter(
      initialLocation: '/home',
      observers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      routes: [
        AuthFeature.router,
        BalancesFeature.router,
        BeneficiariesFeature.router,
        HomeFeature.router,
        TransfersFeature.router,
        AuthTefFeature.router,
        GoRoute(
          name: 'error_page',
          path: '/error_page',
          builder: (BuildContext context, GoRouterState state) {
            final data = state.extra as Map<String, dynamic>;
            return ErrorPage(
              titlePage: data['titlePage'],
              titleError: data['titleError'],
              subtitleError: data['subtitleError'],
            );
          },
        )
      ],
    );
  }
}

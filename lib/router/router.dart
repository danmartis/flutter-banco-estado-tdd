import 'package:empresas/features/auth_tef/auth_tef_feature.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:go_router/go_router.dart';

import '../features/features.dart';

class ApplicationRouter {
  final FirebaseAnalytics analytics;

  ApplicationRouter({
    required this.analytics,
  });

  GoRouter getApplicationRouter() {
    return GoRouter(
      initialLocation: '/auth_tef',
      observers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      routes: [
        AuthFeature.router,
        BeneficiariesFeature.router,
        HomeFeature.router,
        TransfersFeature.router,
        AuthTefFeature.router
      ],
    );
  }
}

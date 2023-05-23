import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '2_application/pages/transfers_page.dart';

class TransfersFeature {
  static GoRoute router = GoRoute(
    path: '/transfers',
    builder: (BuildContext context, GoRouterState state) {
      return const TransfersPage();
    },
  );
}

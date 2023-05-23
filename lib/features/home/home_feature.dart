import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '2_application/pages/pages.dart';

class HomeFeature {
  static GoRoute router = GoRoute(
    path: '/home',
    builder: (BuildContext context, GoRouterState state) {
      return const HomePage();
    },
  );
}

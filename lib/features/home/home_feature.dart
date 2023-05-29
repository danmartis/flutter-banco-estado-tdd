import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_index.dart';

class HomeFeature {
  static GoRoute router = GoRoute(
    path: '/home',
    builder: (BuildContext context, GoRouterState state) {
      return const HomeIndex();
    },
  );
}

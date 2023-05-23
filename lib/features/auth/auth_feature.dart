import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '2_application/pages/pages.dart';

class AuthFeature {
  static GoRoute router = GoRoute(
    path: '/auth',
    builder: (BuildContext context, GoRouterState state) {
      return const CheckAuthPage();
    },
    routes: [
      GoRoute(
        path: 'login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: 'register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterPage();
        },
      ),
    ],
  );
}

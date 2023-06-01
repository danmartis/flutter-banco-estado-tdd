import 'package:empresas/features/auth_tef/0_data/datasources/http_datasource.dart';
import 'package:empresas/features/auth_tef/0_data/repositories/phase_one_repository_impl.dart';
import 'package:empresas/features/auth_tef/1_domain/repositories/phase_one_repository.dart';
import 'package:empresas/features/auth_tef/1_domain/usecases/get_phase_one.dart';
import 'package:empresas/features/auth_tef/2_application/pages/select_status_account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '2_application/pages/select_origin_account_page.dart';

class AuthTefFeature {
    static GoRoute router = GoRoute(
        name: 'auth_tef',
    path: '/auth_tef',
    builder: (BuildContext context, GoRouterState state) {
      return const SelectStatusAccountPage();
    },
    routes: [
      GoRoute(
        path: 'select_origin_account',
        builder: (context, state) =>
            SelectOriginAccountPage(),
      ),
    ],
  );


  static void injections(GetIt sl) {

    final url = '${dotenv.env['API_BASE_URL']!}/bff/v1/tef-pj-bff-app-v2/autorizar/fase1';

    // Use Cases
    sl.registerLazySingleton(() => GetPhaseOne(sl()));

    // Repositories
    sl.registerLazySingleton<PhaseOneRepository>(() => PhaseOneRepositoryImpl(
        httpDatasource: sl(),
        url: url));

    // Datasources
    sl.registerLazySingleton<HttpDatasource>(
        () => HttpDatasourceImpl(httpClient: sl()));
  }
}

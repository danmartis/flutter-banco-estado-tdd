import 'dart:convert';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:empresas/features/features.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'features/beneficiaries/0_data/datasource/beneficiaries_remote_datasource.dart';
import 'features/beneficiaries/0_data/repositories/beneficiaries_repo_impl.dart';
import 'features/beneficiaries/1_domain/repositories/beneficiaries_repo.dart';
import 'features/beneficiaries/1_domain/usecases/beneficiaries_usecases.dart';
import 'features/beneficiaries/2_application/core/blocs/beneficiaries_bloc/beneficiaries_bloc.dart';
import 'firebase_options.dart';
import 'router/router.dart';

final sl = GetIt.I;

Future<void> init() async {
  await dotenv.load(fileName: ".env");

  const storage = FlutterSecureStorage();
  sl.registerFactory(() => storage);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: 'YourAPP',
  );

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  sl.registerFactory(() => analytics);

  analytics.setDefaultEventParameters({'version': '1.0.0'});

  final FirebasePerformance performance = FirebasePerformance.instance;
  sl.registerFactory(() => performance);

  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  sl.registerFactory(() => messaging);

  String? token = await FirebaseMessaging.instance.getToken();

  print("token");
  print(token);

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first,
      errorAndStacktrace.last,
      fatal: true,
    );
  }).sendPort);

  final dio = Dio();
  dio.options.baseUrl = dotenv.env['API_BASE_URL']!;
  dio.options.headers = {
    'content-type': 'application/json',
  };
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        // print('REQUEST[${options.method}] => PATH: ${options.path}');

        await analytics.logEvent(
          name: "request_dio",
          parameters: {
            "url_dio": options.baseUrl + options.path,
            "url_method_dio": options.method,
            "url_headers_dio": jsonEncode(options.headers),
            "url_body_dio": jsonEncode(options.data),
          },
        );
        // await performance.newTrace(options.path).start();
        return handler.next(options);
      },
      onResponse:
          (Response response, ResponseInterceptorHandler handler) async {
        // print(
        //     'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

        await analytics.logEvent(
          name: "response_dio",
          parameters: {
            "url_dio":
                response.requestOptions.baseUrl + response.requestOptions.path,
            "url_method_dio": response.requestOptions.method,
            "url_headers_dio": jsonEncode(response.requestOptions.headers),
            "url_body_dio": jsonEncode(response.requestOptions.data),
            "url_response_dio": jsonEncode(response.data),
          },
        );

        // await performance.newTrace(response.requestOptions.path).stop();
        return handler.next(response);
      },
      onError: (DioError e, ErrorInterceptorHandler handler) async {
        print(
            'ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
        // await performance.newTrace(e.requestOptions.path).stop();
        return handler.next(e);
      },
    ),
  );
  sl.registerFactory(() => dio);

  // AuthTef Injections
  AuthTefFeature.injections(sl);

  sl.registerFactory<BeneficiariesRemoteDataSource>(
      () => BeneficiariesRemoteDataSourceImpl(dio: sl(), performance: sl()));
  sl.registerFactory<BeneficiariesRepo>(
      () => BeneficiariesRepoImpl(beneficiariesRemoteDatasource: sl()));
  sl.registerFactory(() => BeneficiariesUseCases(beneficiariesRepo: sl()));
  sl.registerFactory(() => BeneficiariesBloc(beneficiariesUseCases: sl()));

  sl.registerFactory(() => ApplicationRouter(analytics: sl()));
}

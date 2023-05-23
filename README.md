# App Empresas Banco Estado 🏦

Aplicación de clientes empresa Banco Estado.

## Libraries and dependencies

1. [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons): Librería utilizada para configurar el icono de la aplicación.
2. [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash): Librería utilizada para configurar el splash de la aplicación.
3. [Get IT](https://pub.dev/packages/get_it): Librería utilizada para manejar la inyección de dependencias.
4. [Font Awesome Flutter](https://pub.dev/packages/font_awesome_flutter): Librería utilizada para implementar Font Awesome Icons en Flutter.
5. [Easy Mask](https://pub.dev/packages/easy_mask): Librería utilizada para aplicar una máscara a los TextFields de Flutter.
6. [AAD OAuth](https://pub.dev/packages/aad_oauth): Librería utilizada para implementar acceso con Azure Active Directory.
7. [Flutter BLoC](https://pub.dev/packages/flutter_bloc): Librería utilizada para implementar el patrón BLoC en Flutter.
8. [Equatable](https://pub.dev/packages/equatable): Librería utilizada para comparar clases.
9. [Dartz](https://pub.dev/packages/dartz): Librería para utilizar programación funcional en Dart.
10. [DIO](https://pub.dev/packages/dio): Cliente HTTP Dart.
11. [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage)
12. [Loading Animations](https://pub.dev/packages/loading_animation_widget)
13. [Flutter SpinKit](https://pub.dev/packages/flutter_spinkit)
14. [JWT Decode](https://pub.dev/packages/jwt_decode)
15. [Flutter DotEnv](https://pub.dev/packages/flutter_dotenv)
16. [Flutter Hooks](https://pub.dev/packages/flutter_hooks)
17. [Badges](https://pub.dev/packages/badges)
18. [Go Router](https://pub.dev/packages/go_router)

#### Ejecuta el siguiente comando para instalar Firebase CLI con npm:

```
npm install -g firebase-tools
```

appbecheflutter@gmail.com
Solicitar acceso.

```
firebase login
```

#### Install the CLI if not already done so

```

dart pub global activate flutterfire_cli
```

#### Run the `configure` command, select a Firebase project and platforms

Esta configuracion ya viene instalada en el proyecto.
se requiere ejecutar solo si desean cambiar de cuenta firebase.

```
flutterfire configure
```

Seleccionar solo Android & Ios
(se requiere hacer esto solo una vez si desean cambiar de cuenta de firebase.)

1. [Firebase Core](https://pub.dev/packages/firebase_core)
2. [Firebase Analytics](https://pub.dev/packages/firebase_analytics)
3. [Firebase Messaging](https://pub.dev/packages/firebase_messaging)
4. [Firebase Crashlytics](https://pub.dev/packages/firebase_crashlytics)
5. [Firebase Performance](https://pub.dev/packages/firebase_performance)
<!-- 6. [Firebase App Check](https://pub.dev/packages/firebase_app_check) -->

#### Depuración Mobile RealTime

```

adb shell setprop debug.firebase.analytics.app com.example.app_beche_poc
```

[Implementación FirebaseCrashlytics](https://firebase.google.com/docs/crashlytics/customize-crash-reports?hl=es&authuser=0&platform=flutter)
ejemplo de implementación lib\features\auth\2_application\pages\check_auth\check_auth_page.dart

```

FirebaseCrashlytics.instance.setUserIdentifier("123456");
        // Set a key to a string.
        FirebaseCrashlytics.instance.setCustomKey('str_key', 'hello');
```

[Implementación FirebaseAnalytics](https://firebase.google.com/docs/analytics/events?platform=flutter&hl=es-419)
ejemplo de implementación lib\features\auth\2_application\pages\check_auth\check_auth_page.dart

```
await FirebaseAnalytics.instance.setUserId(id: '123456');
        await FirebaseAnalytics.instance
            .setUserProperty(name: 'personName', value: 'Andro Ostoic ');
```

[Implementación FirebasePerformance](https://firebase.flutter.dev/docs/performance/usage)
ejemplo de implementación lib\injection.dart

```
 Trace trace = performance.newTrace('path');
    await trace.start();
    trace.setMetric('sum', 200);
    trace.setMetric('time', 342340435);

    trace.putAttribute('userId', '1234');

    trace.stop();

```

## Notes

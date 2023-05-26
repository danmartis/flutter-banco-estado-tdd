
import 'package:empresas/core/error/exceptions.dart';
import 'package:empresas/features/auth_tef/0_data/datasources/http_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {

  late MockDio mockDio;
  late HttpDatasourceImpl httpDatasource;

  setUp(() {
    mockDio = MockDio();
    httpDatasource = HttpDatasourceImpl(httpClient: mockDio);
  });

  const httpResponseJson = {
    "codigo": 200,
    "mensaje": "Success",
    "resultado": "E",
    "payload": {
        "cuentas": [
            {
                "numeroCuenta": "00001028821",
                "alias": "Alias cuenta",
                "tipoCuenta": "CCT"
            }
        ],
        "maximoTransferencia": 5000000,
        "montoMaximoPorDia": 5000000,
        "seleccionMaximaTransferencias": 15,
        "estados": [
            {
                "descripcion": "Sin Autorización",
                "id": "1eraFirma"
            }
        ]
    }
  };

  

  test(
    'should preform a GET request on a URL when the responde code is 200',
    () async {

      final response = Response(
        data: httpResponseJson,
        statusCode: 200,
        requestOptions: RequestOptions(path: 'https://test.com'),  // Agregar el parámetro `requestOptions`
      );

      when(() => mockDio.get('https://test.com')).thenAnswer((_) async => response);

      await httpDatasource.get('https://test.com');

      verify(() => mockDio.get('https://test.com'));
    }
  );

  test(
    'should throw a GET request on a URL when the response code is 404',
    () async {

      final response = Response(
        data: httpResponseJson,
        statusCode: 404,
        requestOptions: RequestOptions(path: 'https://test.com'),  // Agregar el parámetro `requestOptions`
      );

      when(() => mockDio.get('https://test.com')).thenAnswer((_) async => response);

      final call = httpDatasource.get;

      expect(() => call('https://test.com'), throwsA(const TypeMatcher<ServerException>()));
    }
  );

}
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/domain/services/api_service.dart';

void main() {
  group('ApiService', () {
    late ApiService apiService;

    setUpAll(() {
      apiService = ApiService();
    });

    test('fetchData que retorna un map de resultando cuando todo esta bien',
        () async {
      final result = await apiService.fetchData('characters');

      expect(result['code'], equals(200));
      expect(result['status'], equals('Ok'));
      expect(result['data'], isNotNull);
    });

    test('fetchData me arroja un error cuando hay una excepcion', () async {
      try {
        await apiService.fetchData('non-existent-endpoint');
      } catch (e) {
        expect(e, isInstanceOf<Exception>());
        expect(e.toString(), equals('Exception: Failed to load data'));
      }
    });
  });
}

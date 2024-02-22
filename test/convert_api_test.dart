import 'package:convert_api/convert_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final ConvertAPI convertAPI;
  test('Configure', () {
    convertAPI = ConvertAPI.instance;
    convertAPI.configure(apiKey: 'apiKey', apiSecret: 'apiSecret');

    expect(convertAPI.isInitialized, true);
  });
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
library convert_api;

import 'client/convert_http_client.dart';
import 'convert/convert_methods.dart';

export 'models/convert_api_response.dart';
export 'models/success_response.dart';

class ConvertAPI {
  // Instancia privada estática del singleton.
  static final ConvertAPI _instance = ConvertAPI._privado();

  // Constructor privado.
  ConvertAPI._privado();

  // Método estático para acceder a la instancia.
  static ConvertAPI get instance => _instance;

  // Client HTTP.
  static late final ConvertHttpClient _client;
  static bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // Métodos adicionales aquí.
  Future<void> configure({
    required String apiKey,
    required String apiSecret,
  }) async {
    _client = ConvertHttpClient(
      apiKey: apiKey,
      apiSecret: apiSecret,
    );

    _convert = ConvertMethods(_client);

    _isInitialized = true;
  }

  // API Calls
  late final ConvertMethods _convert;
  ConvertMethods get convert {
    if (!_isInitialized) {
      throw Exception('ConvertAPI is not initialized. Did you forget to call configure()?');
    }

    return _convert;
  }
}

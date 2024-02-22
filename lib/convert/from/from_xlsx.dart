import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:convert_api/client/convert_http_client.dart';
import 'package:convert_api/models/convert_api_response.dart';
import 'package:convert_api/models/success_response.dart';
import 'package:dio/dio.dart';

class FromXlsxMethods {
  final ConvertHttpClient client;

  FromXlsxMethods(this.client);

  /// Convert XLSX to CSV
  /// The API for converting XLSX documents to CSV files.
  /// Read more about the converter here: https://www.convertapi.com/xlsx-to-csv
  Future<ConvertApiResponse> toCsv({
    /// File to convert
    required File file,

    /// Store converted file on our secure server and provides download URL.
    bool storeFile = false,

    /// Converted output file name without extension. The extension will be added automatically.
    String? fileName,

    /// Sets the password to open protected documents.
    String? password,

    /// Conversion timeout in seconds.
    int timeout = 600,
  }) async {
    final formData = FormData.fromMap({
      'StoreFile': storeFile,
      'File': await MultipartFile.fromFile(
        file.path,
        // filename: (file.path.split('/').last).split('.').first,
        filename: file.path.split('/').last,
        contentType: MediaType('application',
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),
      ),
      'FileName': fileName ?? (file.path.split('/').last).split('.').first,
      'Timeout': timeout.toString(),
      'Password': password ?? '',
    });

    try {
      final response = await client.post(
        path: '/convert/xlsx/to/csv',
        data: formData,
      );

      if (response.statusCode == 200) {
        return ConvertSuccessResponse.fromMap(response.data);
      } else {
        throw Exception(
            'Error ${response.statusCode}: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Error converting file: $e');
    }
  }

  /// Convert XLSX to PDF
  /// The API for converting PDF documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/pdf-to-jpg
  Future<ConvertApiResponse> toPdf({
    /// File to convert
    required File file,

    /// Store converted file on our secure server and provides download URL.
    bool storeFile = false,

    /// Converted output file name without extension. The extension will be added automatically.
    String? fileName,

    /// Sets the password to open protected documents.
    String? password,

    /// Conversion timeout in seconds.
    int timeout = 600,

    ///
  }) async {
    final formData = FormData.fromMap({
      'StoreFile': storeFile,
      'File': await MultipartFile.fromFile(
        file.path,
        // filename: (file.path.split('/').last).split('.').first,
        filename: file.path.split('/').last,
        contentType: MediaType('application',
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),
      ),
      'FileName': fileName ?? (file.path.split('/').last).split('.').first,
      'Timeout': timeout.toString(),
      'Password': password ?? '',
      'ConvertMetadata': true,
    });

    try {
      final response = await client.post(
        path: '/convert/xlsx/to/pdf',
        data: formData,
      );

      if (response.statusCode == 200) {
        return ConvertSuccessResponse.fromMap(response.data);
      } else {
        throw Exception(
            'Error ${response.statusCode}: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Error converting file: $e');
    }
  }
}

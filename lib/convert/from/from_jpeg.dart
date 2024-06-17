import 'dart:io';

import 'package:convert_api/client/convert_http_client.dart';
import 'package:convert_api/models/convert_api_response.dart';
import 'package:convert_api/models/success_response.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class FromJpegMethods {
  final ConvertHttpClient client;

  FromJpegMethods(this.client);

  /// Convert JPEG to JPG
  /// The API for converting PDF documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/jpeg-to-jpg
  Future<ConvertApiResponse> toJpg({
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

    /// Enable optical character recognition(OCR).
    bool enableOcr = true,

    /// Persist formatting while extracting text. Only works when RemoveHeadersFooters and RemoveFootnotes properties are disabled.
    bool includeFormatting = false,

    /// Set page range. Example 1-10 or 1,2,5. Default is 1-2000.
    String pageRange = '1-2000',

    /// Remove tables from the document.
    bool removeTables = true,

    /// Remove footnotes from the document.
    bool removeFootnotes = true,

    /// Remove headers and footers from the document.
    bool removeHeadersFooters = true,
  }) async {
    final formData = FormData.fromMap({
      'StoreFile': storeFile,
      'File': await MultipartFile.fromFile(
        file.path,
        // filename: (file.path.split('/').last).split('.').first,
        filename: file.path.split('/').last,
        contentType: MediaType('application', 'jpeg'),
      ),
      'FileName': fileName ?? (file.path.split('/').last).split('.').first,
      'Timeout': timeout.toString(),
      'Password': password ?? '',
      'PageRange': pageRange,
      'OcrLanguage': 'automatic',
      'EnableOcr': enableOcr.toString(),
      'IncludeFormatting': includeFormatting.toString(),
      'RemoveHeadersFooters': removeHeadersFooters.toString(),
      'RemoveFootnotes': removeFootnotes.toString(),
      'RemoveTables': removeTables.toString(),
    });

    try {
      final response = await client.post(
        path: '/convert/jpeg/to/jpg',
        data: formData,
      );

      if (response.statusCode == 200) {
        return ConvertSuccessResponse.fromMap(response.data);
      } else {
        throw Exception('Error ${response.statusCode}: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Error converting file: $e');
    }
  }

  /// Convert JPEG to PNG
  /// The API for converting PDF documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/jpeg-to-png
  Future<ConvertApiResponse> toPng({
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

    /// Enable optical character recognition(OCR).
    bool enableOcr = true,

    /// Persist formatting while extracting text. Only works when RemoveHeadersFooters and RemoveFootnotes properties are disabled.
    bool includeFormatting = false,

    /// Set page range. Example 1-10 or 1,2,5. Default is 1-2000.
    String pageRange = '1-2000',

    /// Remove tables from the document.
    bool removeTables = true,

    /// Remove footnotes from the document.
    bool removeFootnotes = true,

    /// Remove headers and footers from the document.
    bool removeHeadersFooters = true,
  }) async {
    final formData = FormData.fromMap({
      'StoreFile': storeFile,
      'File': await MultipartFile.fromFile(
        file.path,
        // filename: (file.path.split('/').last).split('.').first,
        filename: file.path.split('/').last,
        contentType: MediaType('application', 'jpeg'),
      ),
      'FileName': fileName ?? (file.path.split('/').last).split('.').first,
      'Timeout': timeout.toString(),
      'Password': password ?? '',
      'PageRange': pageRange,
      'OcrLanguage': 'automatic',
      'EnableOcr': enableOcr.toString(),
      'IncludeFormatting': includeFormatting.toString(),
      'RemoveHeadersFooters': removeHeadersFooters.toString(),
      'RemoveFootnotes': removeFootnotes.toString(),
      'RemoveTables': removeTables.toString(),
    });

    try {
      final response = await client.post(
        path: '/convert/jpeg/to/png',
        data: formData,
      );

      if (response.statusCode == 200) {
        return ConvertSuccessResponse.fromMap(response.data);
      } else {
        throw Exception('Error ${response.statusCode}: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Error converting file: $e');
    }
  }

  /// Convert JPEG to PNG
  /// The API for converting PDF documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/jpeg-to-pdf
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
        contentType: MediaType('application', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),
      ),
      'FileName': fileName ?? (file.path.split('/').last).split('.').first,
      'Timeout': timeout.toString(),
      'Password': password ?? '',
      'ConvertMetadata': true,
    });

    try {
      final response = await client.post(
        path: '/convert/jpeg/to/pdf',
        data: formData,
      );

      if (response.statusCode == 200) {
        return ConvertSuccessResponse.fromMap(response.data);
      } else {
        throw Exception('Error ${response.statusCode}: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Error converting file: $e');
    }
  }
}

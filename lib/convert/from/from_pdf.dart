import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:convert_api/client/convert_http_client.dart';
import 'package:convert_api/models/convert_api_response.dart';
import 'package:convert_api/models/success_response.dart';
import 'package:dio/dio.dart';

class FromPdfMethods {
  final ConvertHttpClient client;

  FromPdfMethods(this.client);

  /// Convert PDF to TXT
  /// The API for converting PDF documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/pdf-to-txt
  Future<ConvertApiResponse> toTxt({
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
        contentType: MediaType('application', 'pdf'),
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
        path: '/convert/pdf/to/txt',
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

  /// Convert PDF to JPG
  /// The API for converting PDF documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/pdf-to-jpg
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
        contentType: MediaType('application', 'pdf'),
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
        path: '/convert/pdf/to/jpg',
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

  /// Convert PDF to PPTX
  /// The API for converting PDF documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/pdf-to-pptx
  Future<ConvertApiResponse> toPptx({
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

    /// Set page range. Example 1-10 or 1,2,5. Default is 1-2000.
    String pageRange = '1-2000',
  }) async {
    final formData = FormData.fromMap({
      'StoreFile': storeFile,
      'File': await MultipartFile.fromFile(
        file.path,
        // filename: (file.path.split('/').last).split('.').first,
        filename: file.path.split('/').last,
        contentType: MediaType('application', 'pdf'),
      ),
      'FileName': fileName ?? (file.path.split('/').last).split('.').first,
      'Timeout': timeout.toString(),
      'Password': password ?? '',
      'PageRange': pageRange,
      'OcrLanguage': 'automatic',
      'EnableOcr': enableOcr.toString(),
    });

    try {
      final response = await client.post(
        path: '/convert/pdf/to/pptx',
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

  /// Convert PDF to DOCX
  /// The API for converting PDF documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/pdf-to-docx
  Future<ConvertApiResponse> toDocx({
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

    /// Set page range. Example 1-10 or 1,2,5. Default is 1-2000.
    String pageRange = '1-2000',
  }) async {
    final formData = FormData.fromMap({
      'StoreFile': storeFile,
      'File': await MultipartFile.fromFile(
        file.path,
        // filename: (file.path.split('/').last).split('.').first,
        filename: file.path.split('/').last,
        contentType: MediaType('application', 'pdf'),
      ),
      'FileName': fileName ?? (file.path.split('/').last).split('.').first,
      'Timeout': timeout.toString(),
      'Password': password ?? '',
      'PageRange': pageRange,
      'OcrLanguage': 'automatic',
      'EnableOcr': enableOcr.toString(),
    });

    try {
      final response = await client.post(
        path: '/convert/pdf/to/docx',
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
